<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Database Connection</title>
</head>
<body>
	<?php
		$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=erkoc password=6465");
		$_SESSION["connect"] = $connect;
		if(!$connect)
		{
			echo "DB connection issue!!"; die();
		}
    $base_url='http://localhost:8080/activation.php?code=';
	?>
</body>
</html>
