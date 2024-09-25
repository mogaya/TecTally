<?php
require '../connect.php';

// Sanitize input to prevent SQL injection
$user_id = mysqli_real_escape_string($con, $_GET["user_id"]);

$flag = ['success' => 0];

// Use a prepared statement to prevent SQL injection
$query = "SELECT * FROM users WHERE user_id = ?";
$stmt = mysqli_prepare($con, $query);
mysqli_stmt_bind_param($stmt, 's', $user_id);

if (mysqli_stmt_execute($stmt)) {
    $result = mysqli_stmt_get_result($stmt);
    if (mysqli_num_rows($result) > 0) {
        $flag['success'] = 1;
        while ($row = mysqli_fetch_assoc($result)) {
            $flag['profile'] = $row;
        }
    } else {
        $flag['error'] = 'No user found with the provided user_id.';
    }
} else {
    // Handle errors more gracefully
    $flag['error'] = 'Failed to retrieve user data: ' . mysqli_error($con);
}

// Return the result as JSON
echo json_encode($flag);

// Close the statement and database connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
