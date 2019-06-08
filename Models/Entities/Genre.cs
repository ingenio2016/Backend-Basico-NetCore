using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
  public class Genre
  {
    [Key]
    public int GenreId { get; set; }

    [Required(ErrorMessage = "The field {0} id required")]
    [MaxLength(50, ErrorMessage = "The field {0} must have a minimum {1} characters")]
    public string Name { get; set; }
    public ICollection<SystemUser> SystemUsers { get; set; }
  }
}
