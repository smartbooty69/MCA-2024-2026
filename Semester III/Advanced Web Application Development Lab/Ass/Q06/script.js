// Q06: Simple and Compound Interest Calculator

function getInputs() {
    const principal = document.getElementById('principal').value;
    const rate = document.getElementById('rate').value;
    const time = document.getElementById('time').value;
    if (principal.trim() === '' || rate.trim() === '' || time.trim() === '') {
        throw new Error('All fields are required.');
    }
    const p = parseFloat(principal);
    const r = parseFloat(rate);
    const t = parseFloat(time);
    if (isNaN(p) || isNaN(r) || isNaN(t)) {
        throw new Error('Please enter valid numbers.');
    }
    return { p, r, t };
}

function calculateSimpleInterest() {
    let result = '';
    try {
        const { p, r, t } = getInputs();
        const si = (p * r * t) / 100;
        result = `Simple Interest: ${si.toFixed(2)}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
}

function calculateCompoundInterest() {
    let result = '';
    try {
        const { p, r, t } = getInputs();
        const ci = p * Math.pow((1 + r / 100), t) - p;
        result = `Compound Interest: ${ci.toFixed(2)}`;
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 