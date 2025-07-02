/*
create database student default character set=utf8;
use student;
create table stud(rno varchar(10) primary key,
name varchar(30),
m1 numeric(3),
m2 numeric(3),
result varchar(10));
*/
const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const mysql = require('mysql');
const app = express();
const port = 8080;

app.use(bodyParser.urlencoded({ extended: true }));

var conn = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'student'
});

conn.connect(function(err) {
    if (err) throw err;
    console.log('Connected!');
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/submit', (req, res) => {
    const rno = req.body.rno;
    const na = req.body.na;
    const m1 = Number(req.body.m1);
    const m2 = Number(req.body.m2);
    const btn = req.body.DBManip;
    let resultValue = (m1 >= 40 && m2 >= 40) ? 'PASS' : 'FAIL';

    if (btn === 'Insert') {
        if (!rno || !na || isNaN(m1) || isNaN(m2)) {
            res.send('<h1>All fields are required for insertion.</h1>');
            return;
        }
        var sql = 'INSERT INTO stud (rno, name, m1, m2, result) VALUES (?, ?, ?, ?, ?)';
        conn.query(sql, [rno, na, m1, m2, resultValue], function(err, result) {
            if (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    res.send('<h1>Error: Duplicate Roll Number. Record already exists.</h1>');
                } else {
                    res.send('<h1>Error inserting record: ' + err.message + '</h1>');
                }
                return;
            }
            res.send('<h1>Record Inserted Successfully</h1>');
        });
    } else if (btn === 'Update') {
        if (!rno || !na || isNaN(m1) || isNaN(m2)) {
            res.send('<h1>All fields are required for update.</h1>');
            return;
        }
        var sql = 'UPDATE stud SET name=?, m1=?, m2=?, result=? WHERE rno=?';
        conn.query(sql, [na, m1, m2, resultValue, rno], function(err, result) {
            if (err) {
                res.send('<h1>Error updating record: ' + err.message + '</h1>');
                return;
            }
            if (result.affectedRows === 0) {
                res.send('<h1>No record found to update.</h1>');
            } else {
                res.send('<h1>Record Updated Successfully</h1>');
            }
        });
    } else if (btn === 'Delete') {
        if (!rno) {
            res.send('<h1>Roll Number is required for deletion.</h1>');
            return;
        }
        var sql = 'DELETE FROM stud WHERE rno=?';
        conn.query(sql, [rno], function(err, result) {
            if (err) {
                res.send('<h1>Error deleting record: ' + err.message + '</h1>');
                return;
            }
            if (result.affectedRows === 0) {
                res.send('<h1>No record found to delete.</h1>');
            } else {
                res.send('<h1>Record Deleted Successfully</h1>');
            }
        });
    } else if (btn === 'View All') {
        var sql = 'SELECT * FROM stud';
        conn.query(sql, function(err, result, fields) {
            if (err) throw err;
            res.write("<h1>Student Marks Details</h1>");
            res.write("<table border=1 cellpadding=3><tr><td>RNO</td><td>NAME</td><td>MARK 1</td><td>MARK 2</td><td>RESULT</td></tr>");
            result.forEach((row) => {
                res.write(`<tr><td>${row['rno']}</td><td>${row['name']}</td><td>${row['m1']}</td><td>${row['m2']}</td><td>${row['result']}</td></tr>`);
            });
            res.write("</table>");
            res.end();
        });
    } else {
        res.send('<h1>Invalid Operation</h1>');
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
}); 