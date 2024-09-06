
using Microsoft.AspNetCore.Identity;
using AutoMapper;
using System.Diagnostics;
using QLVTNNCMS.Core.Domain.Identity;
using QLVTNNCMS.Core.Repositories;
using QLVTNNCMS.Core.SeedWorks;
using QLVTNNCMS.Data.Repositories;

namespace QLVTNNCMS.Data.SeedWorks
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly QLVTNNCMSContext _context;
        private readonly IMapper _mapper;
        private readonly UserManager<AppUser> _userManager;

        public UnitOfWork(QLVTNNCMSContext context, IMapper mapper, UserManager<AppUser> userManager)
        {
            _context = context;
            _mapper = mapper;
            _userManager = userManager;
            Posts = new PostRepository(context, mapper, userManager);
            PostCategories = new PostCategoryRepository(context, mapper);
            Series = new SeriesRepository(context, mapper);
            Transactions = new TransactionRepository(context, mapper);
            Users = new UserRepository(context);
            Tags = new TagRepository(context, mapper); 
        }
        public IPostRepository Posts { get; private set; }
        public IPostCategoryRepository PostCategories { get; private set; }
        public ISeriesRepository Series { get; private set; }
        public ITransactionRepository Transactions { get; private set; }

        public IUserRepository Users { get; private set; }
        public ITagRepository Tags { get; private set; }

        public async Task<int> CompleteAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
