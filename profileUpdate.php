<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>
	<?php
        require 'loginCheck.php';
        require 'database.php';
		/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
		if(!$connect)
		{
			echo "DB connection issue!!"; die();
		}*/
			


			$query="SELECT \"email\" FROM \"User\" WHERE \"username\"='".$_SESSION["userName"]."' limit 1";
			$res = pg_query($_SESSION["connect"], $query);
			$row = pg_fetch_row($res);
		echo '<form action="executeUpdates.php" method="post" enctype="multipart/form-data">';
		echo "New Password : ".'<input type="password" name="pass" id="pass" />'."<br/>";
		echo "New Password : ".'<input type="password" name="pass2" id="pass2" />'."<br/>";
		echo "E-Mail : ".'<input type="text" name="eMail" id="eMail" value="'.$row[0].'"/>',"<br/>";
		echo "Description:". '<input type="text" name="description"/>'."<br/>";
		echo "Select photo:". '<input type="file" name="file"/>'."<br/>";
		echo '<input type="submit" value="Save" />';
		echo '</form>';


		pg_close($_SESSION["connect"]);
	?>
    <a href=home.php>Home Page</a>
</body>
</html>
