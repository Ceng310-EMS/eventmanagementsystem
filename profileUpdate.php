<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>
	<?php

		$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
		if(!$connect)
		{
			echo "DB connection issue!!"; die();
		}

			$query="SELECT eMail FROM \"User\" WHERE \"userName\"='".$_SESSION["userName"]."' limit 1";
			$res = pg_query($connect, $query);

		echo '<form action="executeUpdates.php" method="post">';
		echo "New Password : ".'<input type="password" name="pass" id="pass" />';
		echo "New Password : ".'<input type="password" name="pass2" id="pass2" />';
		echo "E-Mail : ".'<input type="text" name="eMail" id="eMail" value="'.$res.'"/>';
		echo '<input type="submit" value="Save" />';
		echo '</form>';

		pg_close($connect);
	?>
</body>
</html>