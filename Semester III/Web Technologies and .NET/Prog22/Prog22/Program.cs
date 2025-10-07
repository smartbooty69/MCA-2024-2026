using System;
using System.Linq;

namespace HospitalManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new HospitalContext())
            {
                while (true)
                {
                    Console.WriteLine("\n--- Hospital Management ---");
                    Console.WriteLine("1. Add Patient");
                    Console.WriteLine("2. View Patients");
                    Console.WriteLine("3. Edit Patient");
                    Console.WriteLine("4. Delete Patient");
                    Console.WriteLine("5. Exit");
                    Console.Write("Choose an option: ");

                    int choice = int.Parse(Console.ReadLine());

                    switch (choice)
                    {
                        case 1:
                            AddPatient(db);
                            break;
                        case 2:
                            ViewPatients(db);
                            break;
                        case 3:
                            EditPatient(db);
                            break;
                        case 4:
                            DeletePatient(db);
                            break;
                        case 5:
                            return;
                        default:
                            Console.WriteLine("Invalid choice.");
                            break;
                    }
                }
            }
        }

        static void AddPatient(HospitalContext db)
        {
            Console.Write("Enter Name: ");
            string name = Console.ReadLine();
            Console.Write("Enter Age: ");
            int age = int.Parse(Console.ReadLine());
            Console.Write("Enter Disease: ");
            string disease = Console.ReadLine();

            var patient = new Patient { Name = name, Age = age, Disease = disease };
            db.Patients.Add(patient);
            db.SaveChanges();

            Console.WriteLine("Patient added successfully!");
        }

        static void ViewPatients(HospitalContext db)
        {
            var patients = db.Patients.ToList();
            Console.WriteLine("\n--- Patient List ---");
            foreach (var p in patients)
            {
                Console.WriteLine($"ID: {p.PatientId}, Name: {p.Name}, Age: {p.Age}, Disease: {p.Disease}");
            }
        }

        static void EditPatient(HospitalContext db)
        {
            Console.Write("Enter Patient ID to Edit: ");
            int id = int.Parse(Console.ReadLine());

            var patient = db.Patients.Find(id);
            if (patient != null)
            {
                Console.Write("Enter New Name: ");
                patient.Name = Console.ReadLine();
                Console.Write("Enter New Age: ");
                patient.Age = int.Parse(Console.ReadLine());
                Console.Write("Enter New Disease: ");
                patient.Disease = Console.ReadLine();

                db.SaveChanges();
                Console.WriteLine("Patient updated successfully!");
            }
            else
            {
                Console.WriteLine("Patient not found.");
            }
        }

        static void DeletePatient(HospitalContext db)
        {
            Console.Write("Enter Patient ID to Delete: ");
            int id = int.Parse(Console.ReadLine());

            var patient = db.Patients.Find(id);
            if (patient != null)
            {
                db.Patients.Remove(patient);
                db.SaveChanges();
                Console.WriteLine("Patient deleted successfully!");
            }
            else
            {
                Console.WriteLine("Patient not found.");
            }
        }
    }
}