<?php
require "connect.php";
$flag['success'] = 0;

if ($res = mysqli_query($con, "select * from aqua_drop_products")) {

 $flag['success'] = 1;
 while ($row = mysqli_fetch_assoc($res)) {
 $flag['products'][] = $row;
 }
}
print(json_encode($flag));
mysqli_close($con);
?>