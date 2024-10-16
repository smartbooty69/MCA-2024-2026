<?php

function validateEmail($email) {
    
    $pattern = '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/';
    return preg_match($pattern, $email);
}

function processArray($inputArray) {
    return array_reverse($inputArray);
}

function capitalizeWords($string) {
    return ucwords(strtolower($string));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $items = explode(',', htmlspecialchars($_POST['items'])); 

    if (!validateEmail($email)) {
        echo "Invalid email format.<br>";
    } else {
        
        $reversedItems = processArray($items);

        $capitalizedName = capitalizeWords($name);

        echo "<h2>Processed Results:</h2>";
        echo "Name: $capitalizedName<br>";
        echo "Email: $email<br>";
        echo "Reversed Items: " . implode(', ', $reversedItems) . "<br>";
    }
} else {
    echo "Invalid form submission.";
}
?>
