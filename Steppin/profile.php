<?php
require 'connect.php';
$phone =$_GET["phone"];

$flag['success']=0;
if($res = mysqli_query($con,"select * from aqua_drop_users where phone= '$phone'"))
{
$flag['success'] = 1;
 while ($row = mysqli_fetch_assoc($res)) {
 $flag['profile'][] = $row;
 }
}
print(json_encode($flag));
mysqli_close($con);
?>