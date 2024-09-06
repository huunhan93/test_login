using QLVTNNCMS.Core.Models.Content;

namespace QLVTNNCMS.WebApp.Models
{
    public class PostDetailViewModel
    {
        public PostDto Post { get; set; }
        public PostCategoryDto Category { get; set; }

        public List<TagDto> Tags { get; set; }
    }
}
