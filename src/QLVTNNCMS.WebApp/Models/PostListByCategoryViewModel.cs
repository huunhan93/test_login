using QLVTNNCMS.Core.Models.Content;
using QLVTNNCMS.Core.Models;

namespace QLVTNNCMS.WebApp.Models
{
    public class PostListByCategoryViewModel
    {
        public PostCategoryDto Category { get; set; }
        public PagedResult<PostInListDto> Posts { get; set; }
    }
}
