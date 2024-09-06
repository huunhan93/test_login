using QLVTNNCMS.Core.SeedWorks;
using QLVTNNCMS.Core.Domain.Identity;

namespace QLVTNNCMS.Core.Repositories
{
    public interface IUserRepository : IRepository<AppUser, Guid>
    {
        Task RemoveUserFromRoles(Guid userId, string[] roles);
    }
}
