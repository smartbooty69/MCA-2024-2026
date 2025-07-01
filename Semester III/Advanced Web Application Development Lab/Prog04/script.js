const typeFrom = document.getElementById("typeFrom");
const typeTo = document.getElementById("typeTo");
const res = document.getElementById("res");
const input = document.getElementById("input");
const inputType = document.getElementById("inputType");
const resultType = document.getElementById("resultType");

const tags = {
    10: "Decimal:",
    2: "Binary:",
    8: "Octal:",
    16: "HexaDecimal:"
};

function update() {
    inputType.innerText = `Enter ${tags[typeFrom.value]}`;
    resultType.innerText = `Result ${tags[typeTo.value]}`;
    // Convert input value to result
    let inputValue = input.value.trim();
    if (inputValue === "") {
        res.value = "";
        return;
    }
    let num = parseInt(inputValue, parseInt(typeFrom.value));
    if (isNaN(num)) {
        res.value = "Invalid Input";
        return;
    }
    res.value = num.toString(parseInt(typeTo.value)).toUpperCase();
}

function reverse() {
    inputType.innerText = `Enter ${tags[typeFrom.value]}`;
    resultType.innerText = `Result ${tags[typeTo.value]}`;
    // Convert result value to input
    let resultValue = res.value.trim();
    if (resultValue === "") {
        input.value = "";
        return;
    }
    let num = parseInt(resultValue, parseInt(typeTo.value));
    if (isNaN(num)) {
        input.value = "Invalid Input";
        return;
    }
    input.value = num.toString(parseInt(typeFrom.value)).toUpperCase();
}

// Initialize UI
update(); 