
var screen;

window.onload = function() {
    screen = document.getElementById('screen');
}

function btnclick(value) {
    screen.value += value;
}

function clearscreen() {
    screen.value = "";
}

function findresult() {
    try {
        var result = eval(screen.value);
        screen.value = result;
    } catch (e) {
        screen.value = "Error";
    }
}