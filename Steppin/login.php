<?php
require "connect.php";
$flag['success'] = 0;
$phone = $_GET['phone'];
$password = $_GET['password'];
$encrypted_password=md5($password);

$flag['data'] = array();

if ($res = mysqli_query($con, "select * from aqua_drop_users where phone='$phone' and password='$encrypted_password' limit 1")) {
  if(mysqli_num_rows($res) > 0){
 $flag['success'] = 1;
  }
 while ($row = mysqli_fetch_assoc($res)) {
 $flag['userdata'][] = $row;
 }
}
print(json_encode($flag));
mysqli_close($con);
?>