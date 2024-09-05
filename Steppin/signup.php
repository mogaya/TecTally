<?php
require 'connect.php';
$username =$_POST["username"];
$phone =$_POST["phone"];
$email =$_POST["email"];
$password =md5($_POST["password"]);
$flag['success']=0;
if($res = mysqli_query($con,"insert into aqua_drop_users values('','$username','$phone',0,'$email','$password','ProfilePic.png',now(),'')"))
{
$flag['success']=1;
}
print(json_encode($flag));
mysqli_close($con);
?>