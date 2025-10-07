using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class Student
{
    public int ID { get; set; }
    public string Name { get; set; }
    public int Marks { get; set; }
}

public class Program
{
    public static void Main(string[] args)
    {
        var students = new List<Student>
        {
            new Student { ID = 1, Name = "Alice", Marks = 85 },
            new Student { ID = 2, Name = "Bob", Marks = 60 },
            new Student { ID = 3, Name = "Charlie", Marks = 95 },
            new Student { ID = 4, Name = "David", Marks = 78 },
            new Student { ID = 5, Name = "Eve", Marks = 75 },
            new Student { ID = 6, Name = "Frank", Marks = 95 }
        };

        // 1. Students with marks > 75, sorted descending
        var highAchievers = students.Where(s => s.Marks > 75).OrderByDescending(s => s.Marks);
        Console.WriteLine("High Achievers (>75):");
        foreach (var s in highAchievers)
            Console.WriteLine($"{s.Name}: {s.Marks}");
        Console.WriteLine();

        // 2. All students sorted by marks, descending
        var sortedByMarks = students.OrderByDescending(s => s.Marks);
        Console.WriteLine("All Students by Marks (desc):");
        foreach (var s in sortedByMarks)
            Console.WriteLine($"{s.Name}: {s.Marks}");
        Console.WriteLine();

        // 3. Names in alphabetical order
        var names = students.OrderBy(s => s.Name).Select(s => s.Name);
        Console.WriteLine("Names (alphabetical):");
        foreach (var name in names)
            Console.WriteLine(name);
        Console.WriteLine();

        // 4. Average, highest, and lowest marks
        Console.WriteLine("Marks Statistics:");
        Console.WriteLine($"Average: {students.Average(s => s.Marks)}");
        Console.WriteLine($"Highest: {students.Max(s => s.Marks)}");
        Console.WriteLine($"Lowest: {students.Min(s => s.Marks)}");
        Console.WriteLine();

        // 5. Students grouped by marks, groups sorted descending
        var groupedByMarks = students.GroupBy(s => s.Marks).OrderByDescending(g => g.Key);
        Console.WriteLine("Students Grouped by Marks:");
        foreach (var group in groupedByMarks)
        {
            Console.WriteLine($"- Marks: {group.Key}");
            foreach (var s in group)
                Console.WriteLine($"  - {s.Name}");
        }
    }
}