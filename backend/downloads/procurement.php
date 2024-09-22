<?php
require '../connect.php';

// Set headers to force download as a CSV file
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment;filename=Procurement_employees.csv');

// Open output stream to write the CSV file directly to the browser
$output = fopen('php://output', 'w');

// Set the column headers
fputcsv($output, ['Employee ID', 'Name', 'Department', 'Role', 'Email', 'Phone',]);

// Query the database for Procurement employees
$query = "SELECT * FROM employees WHERE emp_dpt = 'Procurement'";
$result = mysqli_query($con, $query);

// Write data rows to the CSV file
if ($result && mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        fputcsv($output, [$row['emp_id'], $row['emp_name'], $row['emp_dpt'], $row['emp_role'], $row['emp_email'], $row['emp_phone']]);
    }
} else {
    // If no data is found, you can optionally write a message
    fputcsv($output, ['No employees found in the Procurement Department']);
}

// Close the output stream and database connection
fclose($output);
mysqli_close($con);
