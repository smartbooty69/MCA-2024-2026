<?php
include 'db.php';
session_start();

// Fetch all users from the database
$sql = "SELECT * FROM users";
$stmt = $conn->prepare($sql);
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
    <h1>User List</h1>
    <?php if (isset($_SESSION['message'])): ?>
        <p><?php echo $_SESSION['message']; unset($_SESSION['message']); ?></p>
    <?php endif; ?>
    <?php if (isset($_SESSION['error'])): ?>
        <p><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></p>
    <?php endif; ?>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Profile Picture</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($users as $user): ?>
        <tr>
            <td><?php echo $user['id']; ?></td>
            <td><?php echo $user['name']; ?></td>
            <td><?php echo $user['email']; ?></td>
            <td><img src="uploads/<?php echo $user['profile_pic']; ?>" width="50"></td>
            <td>
                <a href="edit.php?id=<?php echo $user['id']; ?>">Edit</a>
                <a href="delete.php?id=<?php echo $user['id']; ?>">Delete</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

    <h2>Create New User</h2>
    <form action="create.php" method="POST" enctype="multipart/form-data">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="profile_pic">Profile Picture:</label><br>
        <input type="file" id="profile_pic" name="profile_pic" required><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
