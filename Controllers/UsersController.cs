using System.Linq;
using System.Net;
using System.Threading.Tasks;
using AngularASPNETCore2WebApiAuth.Data;
using AngularASPNETCore2WebApiAuth.Models.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using AngularASPNETCore2WebApiAuth.Clases;
using Microsoft.AspNetCore.Authorization;
using AngularASPNETCore2WebApiAuth.ViewModels;
using System.Collections.Generic;
using System;
using System.IO;
using System.Net.Http.Headers;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AngularASPNETCore2WebApiAuth.Controllers
{
  [Route("api/[controller]")]
  [EnableCors("CorsPolicy")]
  [Authorize]
  public class UsersController : Controller
  {
    private readonly ApplicationDbContext _context;
    private readonly UserManager<AppUser> _userManager;
    private readonly IHostingEnvironment _hostingEnvironment;

    public UsersController(ApplicationDbContext context, UserManager<AppUser> userManager, IHostingEnvironment hostingEnvironment)
    {
      _context = context;
      _userManager = userManager;
      _hostingEnvironment = hostingEnvironment;
    }

    [HttpGet]
    public List<UserView> GetAll()
    {
      List<UserView> userList = new List<UserView>();
      var users = _context.SystemUsers.ToList();

      foreach (var user in users)
      {
        user.Country = _context.Countries.Find(user.CountryId);
        user.Department = _context.Departments.Find(user.DepartmentId);
        user.City = _context.Cities.Find(user.CityId);
        user.Genre = _context.Genres.Find(user.GenreId);
        var data = new UserView
        {
          Id = user.SystemUserId,
          FirstName = user.FirstName,
          LastName = user.LastName,
          Address = user.Address,
          CountryId = user.Country.CountryId,
          CountryName = user.Country.Name,
          DepartmentId = user.Department.DepartmentId,
          DepartmentName = user.Department.Name,
          CityId = user.City.CityId,
          CityName = user.City.Name,
          GenreId = user.Genre.GenreId,
          GenreName = user.Genre.Name,
          Phone = user.Phone,
          UserEmail = user.UserName,
          Role = user.Role,
          FullName = string.Format("{0} {1}", user.FirstName, user.LastName),
          Password = ":)",
          Photo = user.ImageUrl
        };

        userList.Add(data);
      }

      return userList;
    }

    [HttpGet("{id}", Name = "GetUser")]
    public IActionResult GetById(int id)
    {
      var user = _context.SystemUsers.Find(id);
      if (user == null)
      {
        return NotFound();
      }

      user.Country = _context.Countries.Find(user.CountryId);
      user.Department = _context.Departments.Find(user.DepartmentId);
      user.City = _context.Cities.Find(user.CityId);
      user.Genre = _context.Genres.Find(user.GenreId);
      var userView = new UserView
      {
        Id = user.SystemUserId,
        FirstName = user.FirstName,
        LastName = user.LastName,
        Address = user.Address,
        CountryId = user.Country.CountryId,
        CountryName = user.Country.Name,
        DepartmentId = user.Department.DepartmentId,
        DepartmentName = user.Department.Name,
        CityId = user.City.CityId,
        CityName = user.City.Name,
        GenreId = user.Genre.GenreId,
        GenreName = user.Genre.Name,
        Phone = user.Phone,
        UserEmail = user.UserName,
        Role = user.Role,
        FullName = string.Format("{0} {1}", user.FirstName, user.LastName),
        Password = "",
        Photo = user.ImageUrl
      };

      return Ok(userView);
    }

    [HttpPost]
    public async Task<Response> CreateAsync([FromBody] SystemUser user)
    {
      if (user == null)
      {
        return new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se envió información", Data = { } };
      }
      using (var transaction = _context.Database.BeginTransaction())
      {
        _context.SystemUsers.Add(user);
        //Creeo el usuario en el sistema
        var userIdentity = new AppUser { Email = user.UserName, EmailConfirmed = true, Name = string.Format("{0} {1}", user.FirstName, user.LastName), UserName = user.UserName };
        try
        {
          var result = await _userManager.CreateAsync(userIdentity, user.Password);
          if (!result.Succeeded)
          {
            transaction.Rollback();
            foreach (var error in result.Errors)
            {
              if (error.Code == "DuplicateUserName")
              {
                return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Este correo ya se encuentra registrado en el sistema", Data = { } };
              }
            }
            return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al crear el registro", Data = { } };
          }
          _context.SaveChanges();
          transaction.Commit();


          return new Response { Success = true, Result = HttpStatusCode.OK, Message = "El registro se modificó exitosamente", Data = { } };
        }
        catch (Exception ex)
        {
          transaction.Rollback();
          return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al crear el registro", Data = { } };
        }
      }
    }

    [HttpPut("{id}")]
    public async Task<Response> UpdateAsync(int id, [FromBody] SystemUser user)
    {
      if (user == null || user.SystemUserId == 0)
      {
        return new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se envió información", Data = { } };
      }

      var verifyUser = _context.SystemUsers.Find(id);
      using (var transaction = _context.Database.BeginTransaction())
      {
        verifyUser.FirstName = user.FirstName;
        verifyUser.LastName = user.LastName;
        verifyUser.CityId = user.CityId;
        verifyUser.Address = user.Address;
        verifyUser.GenreId = user.GenreId;
        verifyUser.Phone = user.Phone;

        if (user.Password != "")
        {
          if (user != null)
          {
            var userIdenty = _context.Users.Where(u => u.Email == user.UserName).FirstOrDefault();
            var result = await _userManager.ChangePasswordAsync(userIdenty, verifyUser.Password, user.Password);
            if (!result.Succeeded)
            {
              transaction.Rollback();
              return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al modificar el registro", Data = { } };
            }
            verifyUser.Password = user.Password;
          }
        }

        _context.SystemUsers.Update(verifyUser);

        try
        {
          _context.SaveChanges();
          transaction.Commit();

          //Envio el Modelo de Respuesta
          verifyUser.Country = _context.Countries.Find(verifyUser.CountryId);
          verifyUser.Department = _context.Departments.Find(verifyUser.DepartmentId);
          verifyUser.City = _context.Cities.Find(verifyUser.CityId);
          verifyUser.Genre = _context.Genres.Find(verifyUser.GenreId);
          var data = new UserLoginViewModel
          {
            Id = verifyUser.SystemUserId,
            FirstName = verifyUser.FirstName,
            LastName = verifyUser.LastName,
            Phone = verifyUser.Phone,
            Address = verifyUser.Address,
            GenreId = verifyUser.Genre.GenreId,
            GenreName = verifyUser.Genre.Name,
            CountryId = verifyUser.Country.CountryId,
            CountryName = verifyUser.Country.Name,
            DepartmentId = verifyUser.Department.DepartmentId,
            DepartmentName = verifyUser.Department.Name,
            CityId = verifyUser.City.CityId,
            CityName = verifyUser.City.Name,
            FullName = verifyUser.FirstName + " " + verifyUser.LastName,
            Role = verifyUser.Role,
            UserEmail = verifyUser.UserName,
            Password = ":)",
            ImageUrl = user.ImageUrl
          };
          return new Response { Success = true, Result = HttpStatusCode.OK, Message = "El registro se modificó exitosamente", Data = data };
        }
        catch (Exception ex)
        {
          transaction.Rollback();
          return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al modificar el registro", Data = { } };
        }
      }
    }

    [HttpPost, DisableRequestSizeLimit]
    [Route("[action]")]
    public Response UploadImage(int id, string type)
    {
      string backendUrl = "https://www.silvanoserrano.com/dev/";
      if (id == 0)
      {
        return new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se envió información", Data = { } };
      }
      var user = _context.SystemUsers.Find(id);
      if (user == null)
      {
        return new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se envió información", Data = { } };
      }
      try
      {
        var file = Request.Form.Files[0];
        string folderName = type;
        string webRootPath = _hostingEnvironment.WebRootPath;
        string newPath = Path.Combine(webRootPath, folderName);
        if (!Directory.Exists(newPath))
        {
          Directory.CreateDirectory(newPath);
        }
        if (file.Length > 0)
        {
          Random random = new Random();
          int randomNumber = random.Next(0, 1000);
          string fileName = (user.SystemUserId + randomNumber).ToString() + ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
          user.ImageUrl = backendUrl + folderName + "/" + fileName;
          string fullPath = Path.Combine(newPath, fileName);
          string publicPatch = Path.Combine(folderName, fileName);
          using (var stream = new FileStream(fullPath, FileMode.Create))
          {
            file.CopyTo(stream);
            _context.SystemUsers.Update(user);
            _context.SaveChanges();
          }
        }

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
          ImageUrl = user.ImageUrl
        };
        return new Response { Success = true, Result = HttpStatusCode.OK, Message = "La imágen ha sido cargada exitosamente", Data = data };
      }
      catch (Exception ex)
      {
        return new Response { Success = false, Result = HttpStatusCode.OK, Message = "Ha ocurrido un error al subir la imágen", Data = { } };
      }
    }

    [HttpDelete("{id}")]
    public async Task<Response> DeleteAsync(int id)
    {
      var userData = _context.SystemUsers.Find(id);
      if (userData == null)
      {
        return new Response { Success = false, Result = HttpStatusCode.NotFound, Message = "No se encontró ningún registro", Data = { } };
      }
      using (var transaction = _context.Database.BeginTransaction())
      {
        var userIdenty = _context.Users.Where(u => u.Email == userData.UserName).FirstOrDefault();
        var result = await _userManager.DeleteAsync(userIdenty);
        if (!result.Succeeded)
        {
          transaction.Rollback();
          return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al modificar el registro", Data = { } };
        }

        _context.SystemUsers.Remove(userData);
        try
        {
          _context.SaveChanges();
          transaction.Commit();
          return new Response { Success = true, Result = HttpStatusCode.OK, Message = "El registro se borró exitosamente", Data = { } };
        }
        catch (Exception ex)
        {
          if (ex.InnerException != null && ex.InnerException.Message.Contains("REFERENCE"))
          {
            return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Él usuario no se puede borrar porque tiene registros relacionados", Data = { } };
          }
          else
          {
            return new Response { Success = false, Result = HttpStatusCode.InternalServerError, Message = "Ocurrió un error al borrar el usuario", Data = { } };
          }
        }
      }
    }
  }
}
