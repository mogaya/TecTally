<?php
require 'connect.php';
$productID = $_POST["productID"];
$amount =$_POST["amount"];
$userID =$_POST["phone"];

$flag['success']=0;

if ($res = mysqli_query($con, "select * from aqua_drop_orders")) {
  if(mysqli_num_rows($res) > 0){
      //Not 1st order
      if ($res = mysqli_query($con, "select orderID from aqua_drop_orders order by created_at desc limit 1")) {
          
          while ($row = mysqli_fetch_assoc($res)) {
            $orderID = $row['orderID'];
            $numericPart=substr($orderID, 2);
            $numericPart=$numericPart+1;
            $orderID="AD".$numericPart;
            }
          
      }
  }else {
      $orderID = "AD20241";
  }
}

if($res = mysqli_query($con,"insert into aqua_drop_orders values('','$productID','$orderID','$amount','$userID',now())"))
{
$flag['success']=1;
}
print(json_encode($flag));
mysqli_close($con);
?>