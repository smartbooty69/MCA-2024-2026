function Student(name, age, grade) {
    this.name = name;
    this.age = age;
    this.grade = grade; 
}

let students = [
    new Student('Aarav', 20, 85),
    new Student('Vivaan', 22, 92),
    new Student('Aditya', 19, 78),
    new Student('Diya', 21, 65),
    new Student('Sneha', 23, 90)
];

function sortStudentsByGrade(students) {
    return students.sort((a, b) => b.grade - a.grade);
}

function filterPassingStudents(students) {
    return students.filter(student => student.grade >= 75);
}

function displayStudents(students) {
    students.forEach(student => {
        console.log(`Name: ${student.name}, Age: ${student.age}, Grade: ${student.grade}`);
    });
}

console.log("Sorted Students by Grade:");
const sortedStudents = sortStudentsByGrade(students);
displayStudents(sortedStudents);

console.log("\nPassing Students:");
const passingStudents = filterPassingStudents(students);
displayStudents(passingStudents);
