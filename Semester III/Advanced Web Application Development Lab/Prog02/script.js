function createText() {
    if (!document.getElementById("number")) {
        var x = document.createElement("INPUT");
        x.setAttribute("type", "text");
        x.setAttribute("id", "number");
        x.setAttribute("class", "text");
        document.body.appendChild(x);
    }
}

function createButton() {
    if (!document.getElementById("factBtn")) {
        var x = document.createElement("INPUT");
        x.setAttribute("type", "button");
        x.setAttribute("class", "button");
        x.setAttribute("id", "factBtn");
        x.setAttribute("value", "Factorial Value Computation");
        x.onclick = findFactVal;
        document.body.appendChild(x);
    }
}

function createParagraph() {
    if (!document.getElementById("result")) {
        var x = document.createElement("P");
        x.setAttribute("id", "result");
        x.setAttribute("class", "mystyle");
        document.body.appendChild(x);
    }
}

function findFactVal() {
    var n = parseInt(document.getElementById('number').value);
    if (isNaN(n) || n < 0) {
        alert("Please enter a valid non-negative integer.");
        return;
    }
    var f = factorial(n);
    var resultPara = document.getElementById('result');
    if (resultPara) {
        resultPara.innerHTML = "Factorial Value of " + n + " is " + f;
    } else {
        alert("Result paragraph not created yet.");
    }
}

function factorial(n) {
    if (n === 0 || n === 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
} 