using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure; // <-- Add this using directive

namespace Prog20
{
    public class HospitalContext : DbContext
    {
        public DbSet<Patient> Patients { get; set; }

        // You may need to configure your connection string here
        protected override void OnConfiguring(Microsoft.EntityFrameworkCore.DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("YourConnectionStringHere");
        }
    }

    public class Patient
    {
        public int PatientId { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Disease { get; set; }
    }
}   