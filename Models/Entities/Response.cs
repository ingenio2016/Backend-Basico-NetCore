using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Models.Entities
{
  public class Response
  {
    public bool Success { get; set; }
    public HttpStatusCode Result { get; set; }
    public object Data { get; set; }
    public string Message { get; set; }
  }
}
