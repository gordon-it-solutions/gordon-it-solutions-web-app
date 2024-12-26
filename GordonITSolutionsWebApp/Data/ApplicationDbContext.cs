using Microsoft.EntityFrameworkCore;
using GordonITSolutionsWebApp.Models;

namespace GordonITSolutionsWebApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<ContactUsFormModel> ContactFormEntries { get; set; }
    }
}

