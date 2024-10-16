<?php

function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    if (!empty($_POST["name"]) && !empty($_POST["email"])) {
        $name = sanitize_input($_POST["name"]);
        $email = sanitize_input($_POST["email"]);

        if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
            echo "Invalid email format.";
        } else {
            echo "<h3>POST Data:</h3>";
            echo "Name: " . $name . "<br>";
            echo "Email: " . $email . "<br>";
        }
    } else {
        echo "All POST fields are required!";
    }
}


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_GET['age'])) {
    if (!empty($_GET['age'])) {
        $age = sanitize_input($_GET['age']);

        if (filter_var($age, FILTER_VALIDATE_INT) === false) {
            echo "Age must be a valid number.";
        } else {
            echo "<h3>GET Data:</h3>";
            echo "Age: " . $age;
        }
    } else {
        echo "Age (GET) is required!";
    }
}
?>
