using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.ViewModels
{
  public class UserView
  {
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public int GenreId { get; set; }
    public string GenreName { get; set; }
    public string Photo { get; set; }
    public int CountryId { get; set; }
    public string CountryName { get; set; }
    public int DepartmentId { get; set; }
    public string DepartmentName { get; set; }
    public int CityId { get; set; }
    public string CityName { get; set; }
    public string FullName { get; set; }
    public string UserEmail { get; set; }
    public string Password { get; set; }
    public string Role { get; set; }
  }
}
