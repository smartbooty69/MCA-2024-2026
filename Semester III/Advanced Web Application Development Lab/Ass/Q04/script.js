// Q04: Find the Biggest Among Three Numbers

function findBiggest() {
    const num1 = document.getElementById('num1').value;
    const num2 = document.getElementById('num2').value;
    const num3 = document.getElementById('num3').value;
    let result = '';
    try {
        if (num1.trim() === '' || num2.trim() === '' || num3.trim() === '') {
            throw new Error('All fields are required.');
        }
        const a = parseFloat(num1);
        const b = parseFloat(num2);
        const c = parseFloat(num3);
        if (isNaN(a) || isNaN(b) || isNaN(c)) {
            throw new Error('Please enter valid numbers.');
        }
        const biggest = Math.max(a, b, c);
        result = `The biggest number is: ${biggest}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 