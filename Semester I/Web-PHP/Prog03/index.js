
let a = 10;
let b = 5;

let andResult = a & b;  
let orResult = a | b;   
let xorResult = a ^ b;  
let notResult = ~a;      

let firstName = "Aarav";
let lastName = "Sharma";
let fullName = firstName + " " + lastName; 

let isAdult = (a >= 18) ? "Adult" : "Minor";

let increment = ++a; 
let decrement = --b; 

let x = (1, 2, 3); 

if (a > b) {
    console.log(`${fullName} has a higher value: ${a}`);
} else {
    console.log(`${fullName} has a lower or equal value: ${b}`);
}

switch (b) {
    case 0:
        console.log("b is zero.");
        break;
    case 5:
        console.log("b is five.");
        break;
    case 10:
        console.log("b is ten.");
        break;
    default:
        console.log("b is neither zero, five, nor ten.");
}

console.log("Bitwise AND:", andResult);
console.log("Bitwise OR:", orResult);
console.log("Bitwise XOR:", xorResult);
console.log("Bitwise NOT of a:", notResult);
console.log("Full Name:", fullName);
console.log("Is Adult:", isAdult);
console.log("Incremented a:", increment);
console.log("Decremented b:", decrement);
console.log("Value of x using comma operator:", x);
