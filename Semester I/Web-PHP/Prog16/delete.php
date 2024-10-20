<?php
include 'db.php';
session_start();

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "DELETE FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);

    if ($stmt->execute()) {
        $_SESSION['message'] = "Record deleted successfully.";
        header('Location: index.php');
        exit;
    }
}
?>
