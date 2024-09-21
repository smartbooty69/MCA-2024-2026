let a = 5; 
let b = 3; 

console.log("Bitwise AND: ", a & b);  
console.log("Bitwise OR: ", a | b);   
console.log("Bitwise XOR: ", a ^ b);  

let age = 20;
let eligibility = (age >= 18) ? "Eligible to vote" : "Not eligible to vote";
console.log(eligibility);

let num = 10;
if (num > 0) {
    console.log(num + " is positive.");
} else if (num < 0) {
    console.log(num + " is negative.");
} else {
    console.log("Number is zero.");
}

let day = 3;
switch (day) {
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case 3:
        console.log("Wednesday");
        break;
    default:
        console.log("Invalid day");
}


for (let i = 1; i <= 5; i++) {
    console.log("Iteration: " + i);
}
