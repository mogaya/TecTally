<?php
require "connect.php";
$flag['success'] = 0;

if ($res = mysqli_query($con, "select * from aqua_drop_orders left join aqua_drop_products on aqua_drop_products.id=aqua_drop_orders.productID left join aqua_drop_users on aqua_drop_users.phone=aqua_drop_orders.userID")) {

 $flag['success'] = 1;
 while ($row = mysqli_fetch_assoc($res)) {
 $flag['orders'][] = $row;
 }
}
print(json_encode($flag));
mysqli_close($con);
?>