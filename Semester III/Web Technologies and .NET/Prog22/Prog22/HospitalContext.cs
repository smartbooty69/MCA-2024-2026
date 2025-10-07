using System.Collections.Generic;
using System.Data.Entity;
using System.Runtime.Remoting.Contexts;

namespace HospitalManagement
{
    public class HospitalContext : DbContext
    {
        public HospitalContext() : base("HospitalDb")
        {
        }

        public DbSet<Patient> Patients { get; set; }
    }
}