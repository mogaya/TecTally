<?php
require 'connect.php';
$orderID =$_GET["orderID"];

$flag['success']=0;
if($res = mysqli_query($con,"delete from aqua_drop_orders where orderID= '$orderID'"))
{
$flag['success']=1;
}
print(json_encode($flag));
mysqli_close($con);
?>