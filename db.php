<?php
$host = 'localhost';
$db   = 'plszzzgi_lib_360';
$user = 'plszzzgi_lib_360';
$pass = 'WNgis5350WN';
$charset = 'utf8mb4';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
