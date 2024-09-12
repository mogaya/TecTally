<?php
require '../connect.php';

$ast_id = mysqli_real_escape_string($con, $_POST["ast_id"]);

// Sanitize user inputs to prevent SQL injection
$ast_licence = mysqli_real_escape_string($con, $_POST["ast_licence"]);
$ast_licence_date = mysqli_real_escape_string($con, $_POST["ast_licence_date"]);
$ast_licence_expiry = mysqli_real_escape_string($con, $_POST["ast_licence_expiry"]);
$ast_licence_no = mysqli_real_escape_string($con, $_POST["ast_licence_no"]);



// Flag for success
$flag['success'] = 0;

// Proper query with 'UPDATE'
$query = "UPDATE assets 
          SET ast_licence = '$ast_licence', 
              ast_licence_date = '$ast_licence_date', 
              ast_licence_expiry = '$ast_licence_expiry', 
              ast_licence_no = '$ast_licence_no' 
          WHERE ast_id = '$ast_id'";


// Execute the query
if (mysqli_query($con, $query)) {
    $flag['success'] = 1;
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
