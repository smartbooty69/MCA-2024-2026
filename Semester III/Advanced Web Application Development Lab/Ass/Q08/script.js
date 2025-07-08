// Q08: Palindrome Checker

function checkPalindrome() {
    const str = document.getElementById('inputStr').value;
    let result = '';
    try {
        if (str.trim() === '') {
            throw new Error('Input is required.');
        }
        // Remove non-alphanumeric characters and convert to lowercase
        const cleaned = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
        const reversed = cleaned.split('').reverse().join('');
        if (cleaned === reversed) {
            result = `"${str}" is a palindrome.`;
        } else {
            result = `"${str}" is not a palindrome.`;
        }
    } catch (err) {
        result = `Error: ${err.message}`;
    }
    document.getElementById('output').textContent = result;
} 