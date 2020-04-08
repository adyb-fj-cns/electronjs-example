using Microsoft.EntityFrameworkCore;

namespace Account.Models
{
    public class AccountContext : DbContext
    {
        public AccountContext(DbContextOptions<AccountContext> options)
            : base(options)
        {
        }

        public DbSet<AccountItem> AccountItems { get; set; }
    }
}