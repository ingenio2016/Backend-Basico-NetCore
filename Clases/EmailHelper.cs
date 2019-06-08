using AngularASPNETCore2WebApiAuth.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace AngularASPNETCore2WebApiAuth.Clases
{
    public class EmailHelper
    {
    public static async Task SendMail(List<string> mails, string subject, string body)
    {
      var senderEmail = "norteticsas@gmail.com";
      var senderPassword = "joel04011992";

      var smtpServer = "smtp.gmail.com";
      var smtpPort = 587;

      var message = new MailMessage();

      foreach (var to in mails)
      {
        message.To.Add(new MailAddress(to));
      }

      message.From = new MailAddress(senderEmail);
      message.Subject = subject;
      message.Body = body;
      message.IsBodyHtml = true;

      using (var smtp = new SmtpClient())
      {
        var credential = new NetworkCredential
        {
          UserName = senderEmail,
          Password = senderPassword
        };

        smtp.Credentials = credential;
        smtp.Host = smtpServer;
        smtp.Port = smtpPort;
        smtp.EnableSsl = true;
        await smtp.SendMailAsync(message);
      }
    }
  }
}
