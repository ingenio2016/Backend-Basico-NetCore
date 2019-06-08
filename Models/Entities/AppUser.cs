
using Microsoft.AspNetCore.Identity;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
    // Add profile data for application users by adding properties to this class
  public class AppUser : IdentityUser
  {
    // Extended Properties
    public string Name { get; set; }
    public string PictureUrl { get; set; }
  }
}
