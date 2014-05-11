<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>
	<?php
	require 'database.php';
	//session_start(); database.php de session var zaten

	$sql="INSERT INTO event (title, type, topic, location, startDate, endDate, logoID, description, createdBy) VALUES ('".$_POST["title"]."','".$_POST["type"]."','".$_POST["topic"]."','".$_POST["location"]."','".$_POST["startDate"]."','".$_POST["endDate"]."','"."1"."','".$_POST["description"]."','".$_SESSION["userName"]."')";
	$isExecuted=pg_query($_SESSION["connect"], $sql);
	if($isExecuted)
	{
		echo "saved";
	}
	else
	{
		echo "error";
	}
	pg_close($_SESSION["connect"]);
	?>
	
</body>
</html>