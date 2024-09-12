<?php
require '../connect.php';

// Sanitize user inputs to prevent SQL injection
$ast_name = mysqli_real_escape_string($con, $_POST["ast_name"]);
$ast_tag = mysqli_real_escape_string($con, $_POST["ast_tag"]);
$ast_serial = mysqli_real_escape_string($con, $_POST["ast_serial"]);
$ast_category = mysqli_real_escape_string($con, $_POST["ast_category"]);



// Flag for success
$flag['success'] = 0;

// Proper query with 'INSERT INTO'
$query = "INSERT INTO assets (ast_id, ast_name, ast_tag, ast_serial, ast_category)
          VALUES ('', '$ast_name', '$ast_tag', '$ast_serial', '$ast_category')";

// Execute the query
if (mysqli_query($con, $query)) {
    $flag['success'] = 1;
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
