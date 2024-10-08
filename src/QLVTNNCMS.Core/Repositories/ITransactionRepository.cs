﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLVTNNCMS.Core.Domain.Royalty;
using QLVTNNCMS.Core.Models;
using QLVTNNCMS.Core.Models.Royalty;
using QLVTNNCMS.Core.SeedWorks;

namespace QLVTNNCMS.Core.Repositories
{
    public interface ITransactionRepository : IRepository<Transaction,Guid>
    {
        Task<PagedResult<TransactionDto>> GetAllPaging(string? userName,
         int fromMonth, int fromYear, int toMonth, int toYear, int pageIndex = 1, int pageSize = 10);
    }
}
