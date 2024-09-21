<?php
require '../connect.php';

// Initialize response array
$response = [
    'success' => 0,
    'pr' => []
];

$query = "SELECT * FROM employees WHERE emp_dpt = 'PR'";
$result = mysqli_query($con, $query);

if ($result) {
    $response['success'] = 1;

    // Fetch all rows as an associative array
    $response['pr'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// Return the response as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);

// tectally/departments/hr.php
