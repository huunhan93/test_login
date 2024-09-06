using AutoMapper;
using Microsoft.EntityFrameworkCore;
using QLVTNNCMS.Core.Domain.Content;
using QLVTNNCMS.Core.Models.Content;
using QLVTNNCMS.Core.Repositories;
using QLVTNNCMS.Data.SeedWorks;

namespace QLVTNNCMS.Data.Repositories
{
    public class TagRepository : RepositoryBase<Tag, Guid>, ITagRepository
    {
        private readonly IMapper _mapper;
        public TagRepository(QLVTNNCMSContext context, IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public async Task<TagDto?> GetBySlug(string slug)
        {
            var tag = await _context.Tags.FirstOrDefaultAsync(x => x.Slug == slug);
            if (tag == null) return null;
            return _mapper.Map<TagDto?>(tag);
        }
    }
}
