// Q03: Exception Handling Mechanism in JavaScript

function handleDivision() {
    const num1 = document.getElementById('num1').value;
    const num2 = document.getElementById('num2').value;
    let result = '';
    try {
        if (num1.trim() === '' || num2.trim() === '') {
            throw new Error('Both fields are required.');
        }
        const a = parseFloat(num1);
        const b = parseFloat(num2);
        if (isNaN(a) || isNaN(b)) {
            throw new Error('Please enter valid numbers.');
        }
        if (b === 0) {
            throw new Error('Division by zero is not allowed.');
        }
        result = `Result: ${a} / ${b} = ${a / b}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 