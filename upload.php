<?php
include 'inc/header.php';
include 'db.php';
include 'inc/functions.php';

// Show success message and link after redirect
if (isset($_GET['success']) && $_GET['success'] == 1 && isset($_GET['file'])) {
    $file_url = htmlspecialchars($_GET['file']);
    echo "<p style='color: green;'>Upload successful! <a href='$file_url' target='_blank'>View uploaded file</a></p>";
}
?>

<h2>Upload Academic Resource</h2>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $title = trim($_POST['title']);
    $department = $_POST['department'];
    $course = trim($_POST['course']);
    $file = $_FILES['pdf'];

    $errors = [];

    // Validate inputs
    if (!$name || !$title || !$department) {
        $errors[] = "Please fill in all required fields.";
    }

    // Validate file
    if ($file['error'] !== 0) {
        $errors[] = "File upload error.";
    } elseif (mime_content_type($file['tmp_name']) !== 'application/pdf') {
        $errors[] = "Only PDF files are allowed.";
    } elseif ($file['size'] > 5 * 1024 * 1024) { // 5MB max
        $errors[] = "File size should not exceed 5MB.";
    }

    if (empty($errors)) {
        $upload_dir = 'uploads/';
        $unique_name = time() . '_' . preg_replace('/[^a-zA-Z0-9.\-_]/', '', basename($file['name']));
        $target_file = $upload_dir . $unique_name;

        if (move_uploaded_file($file['tmp_name'], $target_file)) {
            $stmt = $conn->prepare("INSERT INTO resources (contributor, title, department, course, filename) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssss", $name, $title, $department, $course, $unique_name);

            if ($stmt->execute()) {
                // Redirect to self with success flag and file link
                header("Location: upload.php?success=1&file=" . urlencode($target_file));
                exit();
            } else {
                echo "<p style='color: red;'>Database error. Try again later.</p>";
            }
        } else {
            echo "<p style='color: red;'>Failed to save file to server.</p>";
        }
    } else {
        foreach ($errors as $error) {
            echo "<p style='color: red;'>$error</p>";
        }
    }
}
?>

<form action="" method="post" enctype="multipart/form-data" style="max-width: 500px;">
    <label>Contributor Name *</label><br>
    <input type="text" name="name" required><br><br>

    <label>Document Title *</label><br>
    <input type="text" name="title" required><br><br>

    <label>Department *</label><br>
    <select name="department" required>
        <option value="">-- Select Department --</option>
        <option value="English">English</option>
        <!-- Add more as needed -->
    </select><br><br>

    <label>Course Code & Title (optional)</label><br>
    <input type="text" name="course"><br><br>

    <label>Upload PDF *</label><br>
    <input type="file" name="pdf" accept="application/pdf" required><br><br>

    <input type="submit" value="Upload Resource">
</form>

<?php include 'inc/footer.php'; ?>
