<?php
require __DIR__ . '/vendor/autoload.php'; // You need Google Client SDK

$client = new Google_Client();
$client->setAuthConfig(__DIR__ . '/credentials.json');
$client->addScope(Google_Service_Drive::DRIVE);
$service = new Google_Service_Drive($client);

// Get form inputs
$title = htmlspecialchars($_POST['title'] ?? 'Untitled');
$desc = htmlspecialchars($_POST['desc'] ?? '');
$file = $_FILES['file'];

// Check if file was uploaded
if ($file['error'] !== UPLOAD_ERR_OK) {
    die('File upload failed!');
}

// Define file metadata
$fileMetadata = new Google_Service_Drive_DriveFile([
    'name' => $file['name'],
    'description' => "$title\n\n$desc",
    'parents' => ['YOUR_FOLDER_ID_HERE'] // Replace with Submissions folder ID
]);

$content = file_get_contents($file['tmp_name']);

$uploadedFile = $service->files->create($fileMetadata, [
    'data' => $content,
    'mimeType' => $file['type'],
    'uploadType' => 'multipart',
    'fields' => 'id, webViewLink'
]);

echo "<h3>✅ File uploaded successfully!</h3>";
echo "<p><a href='" . $uploadedFile->getWebViewLink() . "' target='_blank'>📂 View on Drive</a></p>";
