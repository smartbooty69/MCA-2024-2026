function Student(name, age, grade) {
    this.name = name;
    this.age = age;
    this.grade = grade;
}

let students = [
    new Student("Aryan", 19, 85),
    new Student("Sita", 20, 92),
    new Student("John", 18, 75),
    new Student("Priya", 21, 89)
];

function sortByGrade(students) {
    return students.sort((a, b) => b.grade - a.grade);
}

function filterByGrade(students, minGrade) {
    return students.filter(student => student.grade >= minGrade);
}

console.log("Sorted Students by Grade:");
console.log(sortByGrade(students));

console.log("Filtered Students with Grade >= 80:");
console.log(filterByGrade(students, 80));
