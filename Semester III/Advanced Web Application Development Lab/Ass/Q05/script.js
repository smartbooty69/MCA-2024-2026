// Q05: Simple Arithmetic Operations

function calculate(operation) {
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
        switch (operation) {
            case 'add':
                result = `Result: ${a} + ${b} = ${a + b}`;
                break;
            case 'subtract':
                result = `Result: ${a} - ${b} = ${a - b}`;
                break;
            case 'multiply':
                result = `Result: ${a} × ${b} = ${a * b}`;
                break;
            case 'divide':
                if (b === 0) {
                    throw new Error('Division by zero is not allowed.');
                }
                result = `Result: ${a} ÷ ${b} = ${a / b}`;
                break;
            default:
                throw new Error('Unknown operation.');
        }
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 