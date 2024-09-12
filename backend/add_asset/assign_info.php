<?php
require '../connect.php';

$ast_id = mysqli_real_escape_string($con, $_POST["ast_id"]);

// Sanitize user inputs to prevent SQL injection
$ast_asignee = mysqli_real_escape_string($con, $_POST["ast_asignee"]);
$ast_department = mysqli_real_escape_string($con, $_POST["ast_department"]);
$ast_issue_date = mysqli_real_escape_string($con, $_POST["ast_issue_date"]);
$ast_status = mysqli_real_escape_string($con, $_POST["ast_status"]);



// Flag for success
$flag['success'] = 0;

// Proper query with 'UPDATE'
$query = "UPDATE assets 
          SET ast_asignee = '$ast_asignee', 
              ast_department = '$ast_department', 
              ast_issue_date = '$ast_issue_date', 
              ast_status = '$ast_status' 
          WHERE ast_id = '$ast_id'";


// Execute the query
if (mysqli_query($con, $query)) {
    $flag['success'] = 1;
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
