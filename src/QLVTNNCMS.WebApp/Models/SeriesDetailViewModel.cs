using QLVTNNCMS.Core.Models;
using QLVTNNCMS.Core.Models.Content;

namespace QLVTNNCMS.WebApp.Models
{
    public class SeriesDetailViewModel
    {
        public SeriesDto Series { get; set; }

        public PagedResult<PostInListDto> Posts { get; set; }
    }
}
