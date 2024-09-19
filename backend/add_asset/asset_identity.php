<?php
require '../connect.php';

// Sanitize user inputs to prevent SQL injection
$ast_name = mysqli_real_escape_string($con, $_POST["ast_name"]);
$ast_tag = mysqli_real_escape_string($con, $_POST["ast_tag"]);
$ast_serial = mysqli_real_escape_string($con, $_POST["ast_serial"]);
$ast_category = mysqli_real_escape_string($con, $_POST["ast_category"]);

$response = [
// Initialize the response flag
    'success' => 0,
    'ast_id' => null,  // Include ast_id in the response
];

// Proper query with 'INSERT INTO'
$query = "INSERT INTO assets (ast_name, ast_tag, ast_serial, ast_category)
          VALUES ('$ast_name', '$ast_tag', '$ast_serial', '$ast_category')";

// Execute the query
if (mysqli_query($con, $query)) {
    $response['success'] = 1;
    $response['ast_id'] = mysqli_insert_id($con);  // Get the last inserted ID
}

// Return the result as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);
