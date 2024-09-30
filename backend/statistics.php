<?php
require '../connect.php';

$flag = ['success' => 0];

$user_id = mysqli_real_escape_string($con, $_GET["user_id"]);

// Query to count the total number of assets and count assets by category
$count_query = "SELECT 
    COUNT(*) as total_assets, 
    SUM(CASE WHEN ast_category = 'Computer' THEN 1 ELSE 0 END) as computer_assets,
    SUM(CASE WHEN ast_category = 'Mobile' THEN 1 ELSE 0 END) as mobile_assets,
    SUM(CASE WHEN ast_category = 'Networking' THEN 1 ELSE 0 END) as networking_assets,
    SUM(CASE WHEN ast_category = 'Printer' THEN 1 ELSE 0 END) as printer_assets,
    SUM(CASE WHEN ast_category = 'Peripheral' THEN 1 ELSE 0 END) as peripheral_assets,
    SUM(CASE WHEN ast_category = 'Storage' THEN 1 ELSE 0 END) as storage_assets,
    SUM(CASE WHEN ast_category = 'Others' THEN 1 ELSE 0 END) as other_assets
    FROM assets WHERE user_id = $user_id";

$count_result = mysqli_query($con, $count_query);

// Query to count the total number of employees and count employees by emp_dpt
$employee_count_query = "SELECT 
    COUNT(*) as total_employees, 
    SUM(CASE WHEN emp_dpt = 'Board' THEN 1 ELSE 0 END) as board_employees,
    SUM(CASE WHEN emp_dpt = 'PR' THEN 1 ELSE 0 END) as pr_employees,
    SUM(CASE WHEN emp_dpt = 'Finance' THEN 1 ELSE 0 END) as finance_employees,
    SUM(CASE WHEN emp_dpt = 'Human Resource' THEN 1 ELSE 0 END) as hr_employees,
    SUM(CASE WHEN emp_dpt = 'ICT' THEN 1 ELSE 0 END) as ict_employees,
    SUM(CASE WHEN emp_dpt = 'Procurement' THEN 1 ELSE 0 END) as procurement_employees,
    SUM(CASE WHEN emp_dpt = 'Other Departments' THEN 1 ELSE 0 END) as other_department_employees
    FROM employees";

$employee_count_result = mysqli_query($con, $employee_count_query);

if ($count_result && $employee_count_result) {
    $asset_row = mysqli_fetch_assoc($count_result);
    $employee_row = mysqli_fetch_assoc($employee_count_result);

    $flag['success'] = 1;

    // Asset counts
    $flag['total_assets'] = $asset_row['total_assets'];
    $flag['assets_by_category'] = [
        'Computer' => $asset_row['computer_assets'],
        'Mobile' => $asset_row['mobile_assets'],
        'Networking' => $asset_row['networking_assets'],
        'Printer' => $asset_row['printer_assets'],
        'Peripheral' => $asset_row['peripheral_assets'],
        'Storage' => $asset_row['storage_assets'],
        'Others' => $asset_row['other_assets'],
    ];

    // Employee counts
    $flag['total_employees'] = $employee_row['total_employees'];
    $flag['employees_by_department'] = [
        'Board' => $employee_row['board_employees'],
        'PR' => $employee_row['pr_employees'],
        'Finance' => $employee_row['finance_employees'],
        'Human Resource' => $employee_row['hr_employees'],
        'ICT' => $employee_row['ict_employees'],
        'Procurement' => $employee_row['procurement_employees'],
        'Other Departments' => $employee_row['other_department_employees'],
    ];
} else {
    $flag['error'] = 'Failed to count assets or employees: ' . mysqli_error($con);
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
?>
