using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
  public class SystemUser
  {
    [Key]
    public int SystemUserId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public string FirstName { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public string LastName { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public int CountryId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public int DepartmentId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public int CityId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public int GenreId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public string Address { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    public string Phone { get; set; }

    [Display(Name = "Role")]
    [Required(ErrorMessage = "The field {0} id required")]
    public string Role { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    [DataType(DataType.EmailAddress)]
    [MaxLength(50, ErrorMessage = "The field {0} must have a minimum {1} characters")]
    [Display(Name = "User Name")]
    public string UserName { get; set; }

    [DataType(DataType.Password)]
    [Display(Name = "Password")]
    public string Password { get; set; }

    public string ImageUrl { get; set; }

    public Country Country { get; set; }
    public Department Department { get; set; }
    public City City { get; set; }
    public Genre Genre { get; set; }
  }
}
