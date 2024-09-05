<?php
require 'connect.php';
$phone =$_POST["phone"];

$username =$_POST["username"];
$del_location =$_POST["del_location"];
$email =$_POST["email"];

$flag['success']=0;
if($res = mysqli_query($con,"UPDATE aqua_drop_users SET username='$username', del_location='$del_location', email='$email' where phone= '$phone'"))
{
$flag['success'] = 1;
}
print(json_encode($flag));
mysqli_close($con);
?>