

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Threading.Tasks;
using AngularASPNETCore2WebApiAuth.Auth;
using AngularASPNETCore2WebApiAuth.Clases;
using AngularASPNETCore2WebApiAuth.Data;
using AngularASPNETCore2WebApiAuth.Helpers;
using AngularASPNETCore2WebApiAuth.Models;
using AngularASPNETCore2WebApiAuth.Models.Entities;
using AngularASPNETCore2WebApiAuth.ViewModels;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;


namespace AngularASPNETCore2WebApiAuth.Controllers
{
  [Route("api/[controller]")]
  public class AuthController : Controller
  {
    private readonly ApplicationDbContext _context;
    private readonly UserManager<AppUser> _userManager;
    private readonly IJwtFactory _jwtFactory;
    private readonly JwtIssuerOptions _jwtOptions;

    public AuthController(ApplicationDbContext appDbContext, UserManager<AppUser> userManager, IJwtFactory jwtFactory, IOptions<JwtIssuerOptions> jwtOptions)
    {
      _context = appDbContext;
      _userManager = userManager;
      _jwtFactory = jwtFactory;
      _jwtOptions = jwtOptions.Value;
    }

    // POST api/auth/login
    [HttpPost("login")]
    [EnableCors("CorsPolicy")]
    public async Task<Response> Post([FromBody]CredentialsViewModel credentials)
    {
      var response = new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se envió información", Data = { } };
      if (credentials == null)
      {
        return response;
      }

      var identity = await GetClaimsIdentity(credentials.UserName, credentials.Password);
      if (identity == null)
      {
        response.Message = "Correo electrónico y/o contraseña inválidos. Por favor verifique";
        return response;
      }

      var user = _context.SystemUsers.Where(u => u.UserName == credentials.UserName).FirstOrDefault();
      var jwt = await Tokens.GenerateJwt(identity, _jwtFactory, credentials.UserName, _jwtOptions, new JsonSerializerSettings { Formatting = Formatting.Indented });

      //Envio el ViewModel con los datos del usuario logueado
      user.Country = _context.Countries.Find(user.CountryId);
      user.Department = _context.Departments.Find(user.DepartmentId);
      user.City = _context.Cities.Find(user.CityId);
      user.Genre = _context.Genres.Find(user.GenreId);
      var data = new UserLoginViewModel
      {
        Id = user.SystemUserId,
        FirstName = user.FirstName,
        LastName = user.LastName,
        Phone = user.Phone,
        Address = user.Address,
        GenreId = user.Genre.GenreId,
        GenreName = user.Genre.Name,
        CountryId = user.Country.CountryId,
        CountryName = user.Country.Name,
        DepartmentId = user.Department.DepartmentId,
        DepartmentName = user.Department.Name,
        CityId = user.City.CityId,
        CityName = user.City.Name,
        FullName = user.FirstName + " " + user.LastName,
        Role = user.Role,
        UserEmail = user.UserName,
        Password = ":)",
        auth_token = jwt,
        ImageUrl = user.ImageUrl
      };

      response.Success = true;
      response.Result = HttpStatusCode.OK;
      response.Message = "El usuario ha sido logueado exitosamente";
      response.Data = data;

      return response;
    }

    private async Task<ClaimsIdentity> GetClaimsIdentity(string userName, string password)
    {
      if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
        return await Task.FromResult<ClaimsIdentity>(null);

      // get the user to verifty
      var userToVerify = await _userManager.FindByNameAsync(userName);

      if (userToVerify == null) return await Task.FromResult<ClaimsIdentity>(null);

      // check the credentials
      if (await _userManager.CheckPasswordAsync(userToVerify, password))
      {
        return await Task.FromResult(_jwtFactory.GenerateClaimsIdentity(userName, userToVerify.Id));
      }

      // Credentials are invalid, or account doesn't exist
      return await Task.FromResult<ClaimsIdentity>(null);
    }
  }
}
