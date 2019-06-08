using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
  public class Country
  {
    [Key]
    public int CountryId { get; set; }

    [Required(ErrorMessage = "The field {0} is required")]
    [MaxLength(100, ErrorMessage = "The field {0} must have a minimum {1} characters")]
    [Display(Name = "Name")]
    public string Name { get; set; }

    public ICollection<Department> Departments { get; set; }
    public ICollection<City> Cities { get; set; }
    public ICollection<SystemUser> SystemUsers { get; set; }
  }
}
