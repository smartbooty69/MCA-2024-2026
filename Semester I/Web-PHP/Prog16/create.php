<?php
include 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $targetDir = "uploads/";
    $profilePic = basename($_FILES["profile_pic"]["name"]);
    $targetFilePath = $targetDir . $profilePic;
    $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

    $allowedTypes = array('jpg', 'jpeg', 'png', 'gif');
    if (in_array($fileType, $allowedTypes)) {
        if (move_uploaded_file($_FILES["profile_pic"]["tmp_name"], $targetFilePath)) {
            $name = $_POST['name'];
            $email = $_POST['email'];

            $sql = "INSERT INTO users (name, email, profile_pic) VALUES (:name, :email, :profile_pic)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':profile_pic', $profilePic);

            if ($stmt->execute()) {
                $_SESSION['message'] = "Record created successfully.";
                header('Location: index.php');
                exit;
            }
        }
    } else {
        $_SESSION['error'] = "Invalid file type. Only JPG, JPEG, PNG, and GIF are allowed.";
        header('Location: index.php');
    }
}
?>
