<?php
$servername = "127.0.0.1";
$username = "zahan";  // MySQL username
$password = "1234567";  // MySQL root password
$dbname = "sales";  // Name of the database
//

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully to the database.<br>";

// Create a table if it doesn't exist
$sql = "CREATE TABLE IF NOT EXISTS sales (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50)
)";

if ($conn->query($sql) === TRUE) {
    echo "Table sales created successfully.<br>";
} else {
    echo "Error creating table: " . $conn->error . "<br>";
}

// Insert a record into the table
$sql = "INSERT INTO sales (name, email) VALUES ('John Doe', 'john.doe@example.com')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully.<br>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>


