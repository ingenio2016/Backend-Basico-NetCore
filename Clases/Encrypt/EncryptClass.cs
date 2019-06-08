using AngularASPNETCore2WebApiAuth.Clases.Encrypt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Clases
{
  public class EncryptClass
  {
    public string configKey = "QmVoGzRDscx61k3RHHkLYaMFtxYZi3ps";
    public string configIV = "QmVoGzRDscx61k3R";

    //Data encrypted
    public string SetData(string valData)
    {
      byte[] bKey = System.Text.ASCIIEncoding.ASCII.GetBytes(configKey);
      byte[] bIV = System.Text.ASCIIEncoding.ASCII.GetBytes(configIV);

      Encripta enc = new Encripta();

      byte[] bDataEnc;
      bDataEnc = enc.EncryptStringToBytes_Aes(valData, bKey, bIV);

      string value = Convert.ToBase64String(bDataEnc);

      return value;
    }

    //Data decrypted
    public string getData(string valData)
    {
      byte[] bKey = System.Text.ASCIIEncoding.ASCII.GetBytes(configKey);
      byte[] bIV = System.Text.ASCIIEncoding.ASCII.GetBytes(configIV);

      Encripta enc = new Encripta();

      string value = enc.DecryptStringFromBytes_Aes(valData, bKey, bIV);

      return value;
    }
  }
}
