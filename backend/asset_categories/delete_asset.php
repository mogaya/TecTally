<?php
require '../connect.php';

// Sanitize input to prevent SQL injection
$ast_id = mysqli_real_escape_string($con, $_GET["ast_id"]);

$flag = ['success' => 0];

// Use a prepared statement to prevent SQL injection
$query = "DELETE FROM assets WHERE ast_id = ?";
$stmt = mysqli_prepare($con, $query);
mysqli_stmt_bind_param($stmt, 'i', $ast_id);

if (mysqli_stmt_execute($stmt)) {
    $flag['success'] = 1;
} else {
    // Handle errors more gracefully
    $flag['error'] = 'Failed to delete asset: ' . mysqli_error($con);
}

// Return the result as JSON
echo json_encode($flag);

// Close the statement and database connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>