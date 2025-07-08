// Q01: Arrays and Arrays of Objects in JavaScript

// Creating and accessing a simple array
const fruits = ["Apple", "Banana", "Cherry"];

// Creating and accessing an array of objects
const students = [
    { name: "Alice", age: 20 },
    { name: "Bob", age: 21 },
    { name: "Charlie", age: 22 }
];

let output = '<h2>Simple Array</h2>';
output += '<pre>' + JSON.stringify(fruits, null, 2) + '</pre>';
output += '<h2>Accessing Array Elements</h2>';
output += `<p>First fruit: ${fruits[0]}</p>`;

output += '<h2>Array of Objects</h2>';
output += '<pre>' + JSON.stringify(students, null, 2) + '</pre>';
output += '<h2>Accessing Object Properties</h2>';
output += `<p>First student name: ${students[0].name}, age: ${students[0].age}</p>`;

document.getElementById('output').innerHTML = output; 