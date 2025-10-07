using System;
using Microsoft.Data.SqlClient;

class Program
{
    static void Main()
    {
        string connectionString = "Server=(localdb)\\MSSQLLocalDB;Database=HospitalDB;Trusted_Connection=True;";
        string query = "SELECT Id, Name, Age, Disease FROM dbo.Patients;";

        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                Console.WriteLine("Connected to HospitalDB successfully.");

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        Console.WriteLine("\n--- Patient Records ---");
                        while (reader.Read())
                        {
                            int id = reader.GetInt32(0);
                            string name = reader.IsDBNull(1) ? "NULL" : reader.GetString(1);
                            int? age = reader.IsDBNull(2) ? (int?)null : reader.GetInt32(2);
                            string disease = reader.IsDBNull(3) ? "NULL" : reader.GetString(3);

                            Console.WriteLine($"ID: {id}, Name: {name}, Age: {(age.HasValue ? age.Value.ToString() : "NULL")}, Disease: {disease}");
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found in dbo.Patients.");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }

        Console.WriteLine("\nPress any key to exit...");
        Console.ReadKey();
    }
}
