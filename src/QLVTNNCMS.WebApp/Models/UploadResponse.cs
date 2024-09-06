using System.Text.Json.Serialization;

namespace QLVTNNCMS.WebApp.Models
{
    public class UploadResponse
    {
        [JsonPropertyName("path")]
        public string Path { get; set; }
    }
}
