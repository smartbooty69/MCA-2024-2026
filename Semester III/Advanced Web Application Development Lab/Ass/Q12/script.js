// Q12: Regular Expressions in JavaScript

let output = '';

// Example 1: Test if a string contains only digits
const str1 = '12345';
const regex1 = /^\d+$/;
output += `<strong>Example 1:</strong> Does "${str1}" contain only digits? <strong>${regex1.test(str1)}</strong>\n`;

// Example 2: Extract all words from a sentence
const str2 = 'Hello, world! Welcome to JavaScript.';
const regex2 = /\w+/g;
output += `<strong>Example 2:</strong> Words in "${str2}": <strong>${JSON.stringify(str2.match(regex2))}</strong>\n`;

// Example 3: Validate an email address
const str3 = 'user@example.com';
const regex3 = /^[\w.-]+@[\w.-]+\.\w{2,}$/;
output += `<strong>Example 3:</strong> Is "${str3}" a valid email? <strong>${regex3.test(str3)}</strong>\n`;

// Example 4: Replace all spaces with dashes
const str4 = 'Replace all spaces with dashes';
const regex4 = /\s+/g;
output += `<strong>Example 4:</strong> "${str4}" with dashes: <strong>${str4.replace(regex4, '-')}</strong>\n`;

// Example 5: Find all numbers in a string
const str5 = 'Order 66, Room 101, 2023 year';
const regex5 = /\d+/g;
output += `<strong>Example 5:</strong> Numbers in "${str5}": <strong>${JSON.stringify(str5.match(regex5))}</strong>\n`;

// Example 6: Check if a string starts with 'Hello'
const str6 = 'Hello, friend!';
const regex6 = /^Hello/;
output += `<strong>Example 6:</strong> Does "${str6}" start with 'Hello'? <strong>${regex6.test(str6)}</strong>\n`;

document.getElementById('output').innerHTML = output; 