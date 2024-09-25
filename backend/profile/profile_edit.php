<?php
require 'connect.php';

// Sanitize user inputs to prevent SQL injection
$userId = mysqli_real_escape_string($con, $_POST["userId"]);
$userName = mysqli_real_escape_string($con, $_POST["userName"]);
$userPhone = mysqli_real_escape_string($con, $_POST["userPhone"]);
$userEmail = mysqli_real_escape_string($con, $_POST["userEmail"]);
$userOrganization = mysqli_real_escape_string($con, $_POST["userOrganization"]);

$flag = ['success' => 0];

// Correct SQL query with placeholders for the prepared statement
$query = "UPDATE users SET user_name = ?, user_phone = ?, user_email = ?, user_organization = ? WHERE user_id = ?";
$stmt = mysqli_prepare($con, $query);

if ($stmt) {
    // Bind the parameters to the query (correct order and types)
    mysqli_stmt_bind_param($stmt, 'ssssi', $userName, $userPhone, $userEmail, $userOrganization, $userId);

    // Execute the query
    if (mysqli_stmt_execute($stmt)) {
        $flag['success'] = 1;
    } else {
        $flag['error'] = 'Update failed: ' . mysqli_stmt_error($stmt);
    }

    // Close the prepared statement
    mysqli_stmt_close($stmt);
} else {
    $flag['error'] = 'Failed to prepare the SQL statement: ' . mysqli_error($con);
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
?>
