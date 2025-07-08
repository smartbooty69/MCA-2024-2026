// Q02: Function Invocation Mechanisms in JavaScript

let output = '';

// 1. Function Invocation
function greet(name) {
    return `Hello, ${name}! (Function Invocation)`;
}
output += `<h2>1. Function Invocation</h2><p>${greet('Alice')}</p>`;

// 2. Method Invocation
const person = {
    name: 'Bob',
    sayHello: function() {
        return `Hello, ${this.name}! (Method Invocation)`;
    }
};
output += `<h2>2. Method Invocation</h2><p>${person.sayHello()}</p>`;

// 3. Constructor Invocation
function Animal(type) {
    this.type = type;
    this.describe = function() {
        return `This is a ${this.type}. (Constructor Invocation)`;
    };
}
const dog = new Animal('Dog');
output += `<h2>3. Constructor Invocation</h2><p>${dog.describe()}</p>`;

// 4. Indirect Invocation (call/apply)
function showDetails(role) {
    return `${this.name} is a ${role}. (Indirect Invocation)`;
}
const user = { name: 'Charlie' };
output += `<h2>4. Indirect Invocation (call/apply)</h2><p>${showDetails.call(user, 'Developer')}</p>`;

document.getElementById('output').innerHTML = output; 