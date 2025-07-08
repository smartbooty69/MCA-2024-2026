// Q10: Email and Credit Card Validation

function validateEmail() {
    const email = document.getElementById('email').value;
    let result = '';
    try {
        if (email.trim() === '') {
            throw new Error('Email is required.');
        }
        // Simple email regex
        const emailRegex = /^[\w.-]+@[\w.-]+\.\w{2,}$/;
        if (emailRegex.test(email)) {
            result = `"${email}" is a valid email address.`;
        } else {
            result = `"${email}" is not a valid email address.`;
        }
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
}

function validateCreditCard() {
    const cc = document.getElementById('creditcard').value;
    let result = '';
    try {
        if (cc.trim() === '') {
            throw new Error('Credit card number is required.');
        }
        // Simple credit card regex (Visa, MasterCard, Amex, Discover)
        const ccRegex = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|6(?:011|5[0-9]{2})[0-9]{12})$/;
        if (ccRegex.test(cc.replace(/\s+/g, ''))) {
            result = `"${cc}" is a valid credit card number format.`;
        } else {
            result = `"${cc}" is not a valid credit card number format.`;
        }
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 