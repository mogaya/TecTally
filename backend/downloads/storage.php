<?php
require '../connect.php';

// Set headers to force download as a CSV file
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment;filename=storage_assets.csv');

// Open output stream to write the CSV file directly to the browser
$output = fopen('php://output', 'w');

// Set the column headers
fputcsv($output, ['Asset ID', 'Name', 'Tag', 'Serial', 'Category', 'Purchase Date', 'Price', 'Supplier', 'Warranty', 'Licence', 'Licence Date', 'Licence Expiry', 'Licence No', 'Assignee', 'Department', 'Issue Date', 'Status']);

// Query the database for Storage assets
$query = "SELECT * FROM assets WHERE ast_category = 'Storage'";
$result = mysqli_query($con, $query);

// Write data rows to the CSV file
if ($result && mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        fputcsv($output, [$row['ast_id'], $row['ast_name'], $row['ast_tag'], $row['ast_serial'], $row['ast_category'], $row['ast_purchase_date'],$row['ast_price'],$row['ast_supplier'],$row['ast_warranty'],$row['ast_licence'],$row['ast_licence_date'],$row['ast_licence_expiry'],$row['ast_licence_no'],$row['ast_asignee'],$row['ast_department'],$row['ast_issue_date'],$row['ast_status']]);
    }
} else {
    // If no data is found, you can optionally write a message
    fputcsv($output, ['No assets found in the Storage category']);
}

// Close the output stream and database connection
fclose($output);
mysqli_close($con);
