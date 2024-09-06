using QLVTNNCMS.WebApp.Models;

namespace QLVTNNCMS.WebApp.Services
{
    public interface IEmailSender
    {
        Task SendEmail(EmailData emailData);
    }
}
