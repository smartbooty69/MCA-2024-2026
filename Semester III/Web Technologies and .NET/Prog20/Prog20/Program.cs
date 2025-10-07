using System;
using System.Linq;

namespace Prog20
{
    internal class Program
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

                    var input = Console.ReadLine();
                    if (!int.TryParse(input, out int choice))
                    {
                        Console.WriteLine("Invalid choice. Please enter a number.");
                        continue;
                    }

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
                            Console.WriteLine("Exiting program...");
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
            var ageInput = Console.ReadLine();
            if (!int.TryParse(ageInput, out int age))
            {
                Console.WriteLine("Invalid age. Please enter a number.");
                return;
            }

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
            if (patients.Count == 0)
            {
                Console.WriteLine("No patients found.");
                return;
            }

            Console.WriteLine("\n--- Patient List ---");
            Console.WriteLine("{0,-5} {1,-20} {2,-5} {3,-20}", "ID", "Name", "Age", "Disease");
            foreach (var p in patients)
            {
                Console.WriteLine("{0,-5} {1,-20} {2,-5} {3,-20}", p.PatientId, p.Name, p.Age, p.Disease);
            }
        }

        static void EditPatient(HospitalContext db)
        {
            Console.Write("Enter Patient ID to Edit: ");
            var idInput = Console.ReadLine();
            if (!int.TryParse(idInput, out int id))
            {
                Console.WriteLine("Invalid ID. Please enter a number.");
                return;
            }

            var patient = db.Patients.Find(id);
            if (patient != null)
            {
                Console.Write("Enter New Name (leave blank to keep current): ");
                string name = Console.ReadLine();
                if (!string.IsNullOrWhiteSpace(name))
                    patient.Name = name;

                Console.Write("Enter New Age (leave blank to keep current): ");
                string ageInput = Console.ReadLine();
                if (!string.IsNullOrWhiteSpace(ageInput))
                {
                    if (int.TryParse(ageInput, out int age))
                        patient.Age = age;
                    else
                    {
                        Console.WriteLine("Invalid age. Edit cancelled.");
                        return;
                    }
                }

                Console.Write("Enter New Disease (leave blank to keep current): ");
                string disease = Console.ReadLine();
                if (!string.IsNullOrWhiteSpace(disease))
                    patient.Disease = disease;

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
            var idInput = Console.ReadLine();
            if (!int.TryParse(idInput, out int id))
            {
                Console.WriteLine("Invalid ID. Please enter a number.");
                return;
            }

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
