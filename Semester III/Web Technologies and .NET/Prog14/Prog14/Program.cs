using System;
using Microsoft.Data.SqlClient;

class Program
{
    static string connectionString = "Server=(localdb)\\MSSQLLocalDB;Database=StudentDB;Integrated Security=True;TrustServerCertificate=True;";

    static void Main()
    {
        while (true)
        {
            Console.Clear();
            Console.WriteLine("1.Create  2.Read  3.Update  4.Delete  5.Exit");
            Console.Write(">");
            switch (Console.ReadLine())
            {
                case "1": Create(); break;
                case "2": Read(); break;
                case "3": Update(); break;
                case "4": Delete(); break;
                case "5": return;
                default: Console.WriteLine("Invalid"); break;
            }
            Console.Write("Key...");
            Console.ReadKey();
        }
    }

    static void Create()
    {
        try
        {
            Console.Write("ID: "); int id = int.Parse(Console.ReadLine());
            Console.Write("Name: "); string name = Console.ReadLine();
            Console.Write("Marks: "); int marks = int.Parse(Console.ReadLine());

            using var con = new SqlConnection(connectionString);
            using var cmd = new SqlCommand("INSERT INTO Students (Id, Name, Marks) VALUES (@Id, @Name, @Marks)", con);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Marks", marks);
            con.Open();
            Console.WriteLine($"{cmd.ExecuteNonQuery()} inserted");
        }
        catch { Console.WriteLine("Invalid"); }
    }

    static void Read()
    {
        using var con = new SqlConnection(connectionString);
        using var cmd = new SqlCommand("SELECT Id, Name, Marks FROM Students", con);
        con.Open();
        using var r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            Console.WriteLine("ID  Name                 Marks");
            while (r.Read())
                Console.WriteLine($"{r.GetInt32(0),-4}{r.GetString(1),-20}{r.GetInt32(2)}");
        }
        else Console.WriteLine("Empty");
    }

    static void Update()
    {
        try
        {
            Console.Write("ID: "); int id = int.Parse(Console.ReadLine());

            using var con = new SqlConnection(connectionString);
            using var check = new SqlCommand("SELECT COUNT(*) FROM Students WHERE Id=@Id", con);
            check.Parameters.AddWithValue("@Id", id);
            con.Open();
            if ((int)check.ExecuteScalar() == 0) { Console.WriteLine("Not found"); return; }

            Console.Write("New Name: "); string name = Console.ReadLine();
            Console.Write("New Marks: "); string marksStr = Console.ReadLine();
            int? marks = string.IsNullOrWhiteSpace(marksStr) ? null : int.Parse(marksStr);

            string q = "UPDATE Students SET ";
            if (!string.IsNullOrWhiteSpace(name)) q += "Name=@Name";
            if (marks.HasValue) q += (q.EndsWith(" ") ? "" : ", ") + "Marks=@Marks";
            q += " WHERE Id=@Id";

            using var update = new SqlCommand(q, con);
            update.Parameters.AddWithValue("@Id", id);
            if (!string.IsNullOrWhiteSpace(name)) update.Parameters.AddWithValue("@Name", name);
            if (marks.HasValue) update.Parameters.AddWithValue("@Marks", marks.Value);

            Console.WriteLine($"{update.ExecuteNonQuery()} updated");
        }
        catch { Console.WriteLine("Invalid"); }
    }

    static void Delete()
    {
        try
        {
            Console.Write("ID: "); int id = int.Parse(Console.ReadLine());
            using var con = new SqlConnection(connectionString);
            using var cmd = new SqlCommand("DELETE FROM Students WHERE Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            int affected = cmd.ExecuteNonQuery();
            Console.WriteLine(affected > 0 ? $"{affected} deleted" : "Not found");
        }
        catch { Console.WriteLine("Invalid"); }
    }
}
