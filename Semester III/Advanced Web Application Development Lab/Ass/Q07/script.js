// Q07: Fibonacci and Factorial (Recursion)

function computeFibonacci() {
    const num = document.getElementById('num').value;
    let result = '';
    try {
        if (num.trim() === '') {
            throw new Error('Input is required.');
        }
        const n = parseInt(num);
        if (isNaN(n) || n < 0) {
            throw new Error('Please enter a non-negative integer.');
        }
        result = `Fibonacci series up to ${n}: ${fibonacciSeries(n).join(', ')}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
}

function fibonacciSeries(n) {
    if (n === 0) return [0];
    if (n === 1) return [0, 1];
    const series = fibonacciSeries(n - 1);
    series.push(series[series.length - 1] + series[series.length - 2]);
    return series;
}

function computeFactorial() {
    const num = document.getElementById('num').value;
    let result = '';
    try {
        if (num.trim() === '') {
            throw new Error('Input is required.');
        }
        const n = parseInt(num);
        if (isNaN(n) || n < 0) {
            throw new Error('Please enter a non-negative integer.');
        }
        result = `Factorial of ${n}: ${factorial(n)}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
}

function factorial(n) {
    if (n === 0 || n === 1) return 1;
    return n * factorial(n - 1);
} 