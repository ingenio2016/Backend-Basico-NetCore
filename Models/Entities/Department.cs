using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
  public class Department
  {
    [Key]
    public int DepartmentId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    [MaxLength(50, ErrorMessage = "The field {0} must have a minimum {1} characters")]
    [Display(Name = "Name")]
    public string Name { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    [Range(1, double.MaxValue, ErrorMessage = "Must be a {0}")]
    [Display(Name = "Country Id")]
    public int CountryId { get; set; }

    public Country Country { get; set; }

    public ICollection<City> Cities { get; set; }
    public ICollection<SystemUser> SystemUsers { get; set; }
  }
}
