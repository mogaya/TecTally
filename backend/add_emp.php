<?php
require 'connect.php';


// Sanitize user inputs to prevent SQL injection
$user_id = mysqli_real_escape_string($con, $_POST["user_id"]);
$emp_name = mysqli_real_escape_string($con, $_POST["emp_name"]);
$emp_dpt = mysqli_real_escape_string($con, $_POST["emp_dpt"]);
$emp_role = mysqli_real_escape_string($con, $_POST["emp_role"]);
$emp_email = mysqli_real_escape_string($con, $_POST["emp_email"]);
$emp_phone = mysqli_real_escape_string($con, $_POST["emp_phone"]);


// Flag for success
$flag['success'] = 0;

// Proper query with 'INSERT INTO'
$query = "INSERT INTO employees (emp_id, emp_name, emp_dpt, emp_role, emp_email, emp_phone, user_id)
          VALUES ('', '$emp_name', '$emp_dpt', '$emp_role', '$emp_email','$emp_phone', '$user_id')";

// Execute the query
if (mysqli_query($con, $query)) {
    $flag['success'] = 1;
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
