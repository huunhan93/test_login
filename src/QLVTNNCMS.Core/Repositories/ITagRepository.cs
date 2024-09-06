using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLVTNNCMS.Core.Domain.Content;
using QLVTNNCMS.Core.Models.Content;
using QLVTNNCMS.Core.SeedWorks;

namespace QLVTNNCMS.Core.Repositories
{
    public interface ITagRepository : IRepository<Tag, Guid>
    {
        Task<TagDto> GetBySlug (string slug);
    }
}
