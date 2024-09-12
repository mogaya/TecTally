<?php
require '../connect.php';

$ast_id = mysqli_real_escape_string($con, $_POST["ast_id"]);

// Sanitize user inputs to prevent SQL injection
$ast_purchase_date = mysqli_real_escape_string($con, $_POST["ast_purchase_date"]);
$ast_price = mysqli_real_escape_string($con, $_POST["ast_price"]);
$ast_supplier = mysqli_real_escape_string($con, $_POST["ast_supplier"]);
$ast_warranty = mysqli_real_escape_string($con, $_POST["ast_warranty"]);



// Flag for success
$flag['success'] = 0;

// Proper query with 'UPDATE'
$query = "UPDATE assets 
          SET ast_purchase_date = '$ast_purchase_date', 
              ast_price = '$ast_price', 
              ast_supplier = '$ast_supplier', 
              ast_warranty = '$ast_warranty' 
          WHERE ast_id = '$ast_id'";


// Execute the query
if (mysqli_query($con, $query)) {
    $flag['success'] = 1;
}

// Return the result as JSON
echo json_encode($flag);

// Close the database connection
mysqli_close($con);
