<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>
<?php
	$connect = pg_connect("host=localhost port=5432 dbname=olayVar user=postgres password=mnekin1905");
	if(!$connect)
	{
		echo "DB connection issue!!"; die();
	}
	$userName=$_POST["userName"];
	$pass=$_POST["pass"];
	$query="SELECT adminName, password FROM Admin WHERE adminname='".$userName;
	$query.="' AND password= '".$pass."'";
	$isTruee = pg_query($connect, $query);
	$numRows=pg_num_rows($isTruee);
	if($numRows>0)
	{
		echo "Welcome ".$userName;

	}
	else
	{

		echo "Wrong User Name Password Combination";
	}
?>
</body>
</html>