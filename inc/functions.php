<?php

function handle_upload() {
    global $conn;

    if (isset($_POST['upload'])) {
        $name = trim($_POST['name']);
        $title = trim($_POST['title']);
        $dept = trim($_POST['department']);
        $course = trim($_POST['course']);
        $file = $_FILES['pdf'];

        // Ensure all fields are filled
        if (!$name || !$title || !$dept || !$course || !$file['name']) {
            echo "<p style='color:red;'>All fields are required.</p>";
            return;
        }

        // Validate file type
        $allowed_types = ['application/pdf'];
        if (!in_array($file['type'], $allowed_types)) {
            echo "<p style='color:red;'>Only PDF files are allowed.</p>";
            return;
        }

        // Create unique filename
        $filename = time() . '_' . basename($file['name']);
        $target = "uploads/" . $filename;

        // Move file and store info in database
        if (move_uploaded_file($file['tmp_name'], $target)) {
            $stmt = $conn->prepare("INSERT INTO resources (contributor, title, department, course, filename) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssss", $name, $title, $dept, $course, $filename);
            $stmt->execute();
            echo "<p style='color:green;'>Upload successful!</p>";
        } else {
            echo "<p style='color:red;'>File upload failed.</p>";
        }
    }
}


/*function display_resources() {
    global $conn;

    $limit = 12;
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $offset = ($page - 1) * $limit;

    $res = $conn->query("SELECT * FROM resources ORDER BY id DESC LIMIT $offset, $limit");

    if ($res->num_rows > 0) {
        while ($row = $res->fetch_assoc()) {
            $title = htmlspecialchars($row['title']);
            $dept = htmlspecialchars($row['department']);
            $course = htmlspecialchars($row['course']);
            $contributor = htmlspecialchars($row['contributor']);
            $filename = htmlspecialchars($row['filename']);
            $file_url = "uploads/" . $filename;

            echo "<div>
                    <strong>$title</strong><br>
                    <small>$course | $dept</small><br>
                    <small>Uploaded by: $contributor</small><br>
                    <a href='$file_url' target='_blank'>🔍 View PDF</a> |
                    <a href='$file_url' download>⬇️ Download</a>
                  </div><hr>";
        }
    } else {
        echo "<p>No resources available yet.</p>";
    }
}*/

function display_resources() {
    global $conn;

    $limit = 12;
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $offset = ($page - 1) * $limit;

    $res = $conn->query("SELECT * FROM resources ORDER BY id DESC LIMIT $offset, $limit");

    if ($res->num_rows > 0) {
        echo "<div class='resource-grid'>";


        while ($row = $res->fetch_assoc()) {
            $title = htmlspecialchars($row['title']);
            $dept = htmlspecialchars($row['department']);
            $course = htmlspecialchars($row['course']);
            $contributor = htmlspecialchars($row['contributor']);
            $filename = htmlspecialchars($row['filename']);
            $file_url = "uploads/" . $filename;
            $canvas_id = 'canvas_' . $row['id'];

            echo "
            <div style='width: 300px; border: 1px solid #ccc; padding: 10px;'>
                <strong>$title</strong><br>
                <small>$course | $dept</small><br>
                <small>Uploaded by: $contributor</small><br><br>
                <canvas id='$canvas_id' style='width: 100%; border:1px solid #ddd;'></canvas><br>
                <a href='$file_url' target='_blank'>🔍 View PDF</a> |
                <a href='$file_url' download>⬇️ Download</a>
            </div>

            <script>
                const loadingTask_$canvas_id = pdfjsLib.getDocument('$file_url');
                loadingTask_$canvas_id.promise.then(pdf => {
                    return pdf.getPage(1);
                }).then(page => {
                    const scale = 1.2;
                    const viewport = page.getViewport({ scale: scale });
                    const canvas = document.getElementById('$canvas_id');
                    const context = canvas.getContext('2d');
                    canvas.height = viewport.height;
                    canvas.width = viewport.width;

                    const renderContext = {
                        canvasContext: context,
                        viewport: viewport
                    };
                    page.render(renderContext);
                });
            </script>
            ";
        }

        echo "</div>";
    } else {
        echo "<p>No resources available yet.</p>";
    }
}



function search_resources() {
    global $conn;

    $keyword = $_GET['keyword'] ?? '';
    $department = $_GET['department'] ?? '';

    echo "<form method='get'>
        Keyword: <input type='text' name='keyword' value='" . htmlspecialchars($keyword) . "'>
        Department: <select name='department'>
            <option value=''>-- All Departments --</option>
            <option value='English'" . ($department == 'English' ? ' selected' : '') . ">English</option>
            <option value='Mathematics'" . ($department == 'Mathematics' ? ' selected' : '') . ">Mathematics</option>
            <option value='Physics'" . ($department == 'Physics' ? ' selected' : '') . ">Physics</option>
            <option value='Chemistry'" . ($department == 'Chemistry' ? ' selected' : '') . ">Chemistry</option>
        </select>
        <input type='submit' value='Search'>
    </form><hr>";

    $sql = "SELECT * FROM resources WHERE 1";
    if ($keyword) {
        $key = $conn->real_escape_string($keyword);
        $sql .= " AND (title LIKE '%$key%' OR course LIKE '%$key%')";
    }
    if ($department) {
        $dept = $conn->real_escape_string($department);
        $sql .= " AND department='$dept'";
    }

    $res = $conn->query($sql);

    if ($res->num_rows > 0) {
        while ($row = $res->fetch_assoc()) {
            $title = htmlspecialchars($row['title']);
            $dept = htmlspecialchars($row['department']);
            $course = htmlspecialchars($row['course']);
            $contributor = htmlspecialchars($row['contributor']);
            $filename = htmlspecialchars($row['filename']);
            $file_url = "uploads/" . $filename;

            echo "<div>
                    <strong>$title</strong><br>
                    <small>$course | $dept</small><br>
                    <small>Uploaded by: $contributor</small><br>
                    <a href='$file_url' target='_blank'>🔍 View PDF</a> |
                    <a href='$file_url' download>⬇️ Download</a>
                  </div><hr>";
        }
    } else {
        echo "<p>No resources match your search.</p>
        <p>Do a deeper search in <a href='archive.php'>Archives</a>";
    }
}

?>
