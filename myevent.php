<?php
    require 'loginCheck.php';
    require 'database.php';
?>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>Document</title>
</head>
<body>
    <?php
    $id = $_SESSION["id"];
    $resource = pg_query($_SESSION["connect"],"select * from event where u_id = $id");
    while($row=pg_fetch_array($resource)){
        echo "Ticket Number: ".$row[0]."<br/>";
        echo "Title: ".$row[1]."<br/>";
        echo "Type: ".$row[2]."<br/>";
        echo "Topic: ".$row[3]."<br/>";
        echo "Location: ".$row[4]."<br/>";
        echo "Date: ".$row[5]."<br/>";
        echo "Logo id: ".$row[6]."<br/>";
        echo "Description: ".$row[7]."<br/>";
        echo "User id: ".$row[8]."<br/>";
        echo "Quato: ".$row[9]."<br/>";
        echo "<hr/>";
    }
   ?>
   <a href=home.php>Home Page</a>
</body>
</html>
</body></title>
</head>
