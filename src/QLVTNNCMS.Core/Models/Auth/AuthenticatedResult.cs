namespace QLVTNNCMS.Core.Models.Auth
{
    public class AuthenticatedResult
    {
        public string Id { get; set; }
        public required string Token { get; set; }
        public required string RefreshToken { get; set; }
    }
}
