<?php
require '../connect.php';

$user_id = mysqli_real_escape_string($con, $_GET["user_id"]);
// Initialize response array
$response = [
    'success' => 0,
    'ict' => []
];

$query = "SELECT * FROM employees WHERE emp_dpt = 'ICT' AND user_id = $user_id";
$result = mysqli_query($con, $query);

if ($result) {
    $response['success'] = 1;

    // Fetch all rows as an associative array
    $response['ict'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// Return the response as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);

// tectally/departments/hr.php
