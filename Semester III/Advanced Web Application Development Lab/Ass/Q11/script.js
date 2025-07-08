// Q11: String Functions in JavaScript

const str = "Hello, JavaScript World!";
let output = `<strong>Original String:</strong> "${str}"
`;

output += `\n<strong>Length:</strong> ${str.length}`;
output += `\n<strong>toUpperCase():</strong> ${str.toUpperCase()}`;
output += `\n<strong>toLowerCase():</strong> ${str.toLowerCase()}`;
output += `\n<strong>charAt(7):</strong> ${str.charAt(7)}`;
output += `\n<strong>indexOf('JavaScript'):</strong> ${str.indexOf('JavaScript')}`;
output += `\n<strong>substring(7, 17):</strong> ${str.substring(7, 17)}`;
output += `\n<strong>slice(-6):</strong> ${str.slice(-6)}`;
output += `\n<strong>replace('World', 'Universe'):</strong> ${str.replace('World', 'Universe')}`;
output += `\n<strong>split(' '):</strong> ${JSON.stringify(str.split(' '))}`;
output += `\n<strong>trim():</strong> "   Hello   ".trim() = "${'   Hello   '.trim()}"`;
output += `\n<strong>includes('JavaScript'):</strong> ${str.includes('JavaScript')}`;
output += `\n<strong>startsWith('Hello'):</strong> ${str.startsWith('Hello')}`;
output += `\n<strong>endsWith('!'):</strong> ${str.endsWith('!')}`;

document.getElementById('output').innerHTML = output; 