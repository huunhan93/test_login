using QLVTNNCMS.Core.Domain.Content;
using QLVTNNCMS.Core.Models.Content;
using QLVTNNCMS.Core.Models;
using QLVTNNCMS.Core.SeedWorks;

namespace QLVTNNCMS.Core.Repositories
{
    public interface IPostCategoryRepository : IRepository<PostCategory, Guid>
    {
        Task<PagedResult<PostCategoryDto>> GetAllPaging(string? keyword, int pageIndex = 1, int pageSize = 10);
        Task<bool> HasPost(Guid categoryId);

        Task<PostCategoryDto> GetBySlug(string slug);


    }
}
