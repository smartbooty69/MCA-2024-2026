function addElement() {
    const item = prompt("Enter an item to be added into the list:");
    if (item) {
        const node = document.createElement("li");
        const textnode = document.createTextNode(item);
        node.appendChild(textnode);
        document.getElementById("myList").appendChild(node);
    }
}

function removeElement() {
    const list = document.getElementById("myList");
    if (list.lastElementChild) {
        list.removeChild(list.lastElementChild);
    }
}

function removeAllElement() {
    const list = document.getElementById("myList");
    while (list.firstChild) {
        list.removeChild(list.firstChild);
    }
}

function elementCount() {
    const list = document.getElementById("myList");
    const messageDiv = document.getElementById("message");
    messageDiv.innerHTML = "<span class='count-message'>Number of Elements in the List is " + list.children.length + "</span>";
}

function addButton() {
    var x = document.createElement("input");
    x.setAttribute("type", "button");
    x.setAttribute("value", "Click me");
    x.onclick = hello;
    document.body.appendChild(x);
}

function hello() {
    alert("Welcome to JavaScript Programming using Document Object Model!");
} 