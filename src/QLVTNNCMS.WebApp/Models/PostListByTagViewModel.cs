using QLVTNNCMS.Core.Models.Content;
using QLVTNNCMS.Core.Models;

namespace QLVTNNCMS.WebApp.Models
{
    public class PostListByTagViewModel
    {
        public TagDto Tag { get; set; }
        public PagedResult<PostInListDto> Posts { get; set; }
    }
}
