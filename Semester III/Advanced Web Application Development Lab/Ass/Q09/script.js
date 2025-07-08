// Q09: Email and Mobile Number Validation

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

function validateMobile() {
    const mobile = document.getElementById('mobile').value;
    let result = '';
    try {
        if (mobile.trim() === '') {
            throw new Error('Mobile number is required.');
        }
        // Simple mobile number regex (10 digits, allows optional country code)
        const mobileRegex = /^\+?\d{10,15}$/;
        if (mobileRegex.test(mobile)) {
            result = `"${mobile}" is a valid mobile number.`;
        } else {
            result = `"${mobile}" is not a valid mobile number.`;
        }
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 