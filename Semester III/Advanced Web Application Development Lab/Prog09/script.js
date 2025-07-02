const express = require('express');
const path = require('path');
const calculate = require('./calculation');
const app = express();
const port = 8080;

app.use(express.urlencoded({ extended: true })); 

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/submit', (req, res) => {
    const a = Number(req.body.a);
    const b = Number(req.body.b);
    const btn = req.body.operation;
    let result = '';
    if (btn === 'add') {
        result = `<h1>Addition of ${a} and ${b} is ${calculate.add(a, b)}</h1>`;
    } else if (btn === 'sub') {
        result = `<h1>Subtraction of ${a} and ${b} is ${calculate.sub(a, b)}</h1>`;
    } else if (btn === 'mul') {
        result = `<h1>Multiplication of ${a} and ${b} is ${calculate.mul(a, b)}</h1>`;
    } else if (btn === 'div') {
        result = `<h1>Division of ${a} and ${b} is ${calculate.div(a, b)}</h1>`;
    } else {
        result = '<h1>Invalid Operation</h1>';
    }
    res.send(result);
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
}); 