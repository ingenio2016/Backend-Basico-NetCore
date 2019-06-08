using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models
{
  public class ModuleModel
  {
    public int ModuleId { get; set; }
    public string ModuleName { get; set; }
    public string ModuleType { get; set; }
    public int ProfileId { get; set; }
    public bool Access { get; set; }
    public bool Add { get; set; }
    public bool Modify { get; set; }
    public bool Delete { get; set; }
  }
}
