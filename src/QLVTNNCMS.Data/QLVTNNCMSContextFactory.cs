using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLVTNNCMS.Data
{
    public class QLVTNNCMSContextFactory : IDesignTimeDbContextFactory<QLVTNNCMSContext>
    {
        public QLVTNNCMSContext CreateDbContext(string[] args)
        {
            var configuration = new ConfigurationBuilder()
                 .SetBasePath(Directory.GetCurrentDirectory())
                 .AddJsonFile("appsettings.json")
                 .Build();
            var builder = new DbContextOptionsBuilder<QLVTNNCMSContext>();
            builder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            return new QLVTNNCMSContext(builder.Options);
        }
    }
}
