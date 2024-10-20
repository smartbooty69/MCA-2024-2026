<?php
include 'db.php';
session_start();

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $profilePic = $user['profile_pic'];

    if (!empty($_FILES["profile_pic"]["name"])) {
        $targetDir = "uploads/";
        $profilePic = basename($_FILES["profile_pic"]["name"]);
        $targetFilePath = $targetDir . $profilePic;
        $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

        if (in_array($fileType, array('jpg', 'jpeg', 'png', 'gif'))) {
            move_uploaded_file($_FILES["profile_pic"]["tmp_name"], $targetFilePath);
        }
    }

    $sql = "UPDATE users SET name = :name, email = :email, profile_pic = :profile_pic WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':profile_pic', $profilePic);
    $stmt->bindParam(':id', $id);

    if ($stmt->execute()) {
        $_SESSION['message'] = "Record updated successfully.";
        header('Location: index.php');
        exit;
    }
}
?>
