<?php

require 'loginCheck.php';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>User Dashboard</title>
</head>
<body>
	<?php
		require 'database.php';
		echo "Welcome ".$_SESSION["userName"]. "<br/>";

		/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
		if(!$connect)
		{
			echo "DB connection issue!!"; die();
		}*/

		
		
			$userName = $_SESSION["userName"];
		        $query="SELECT \"eMail\" FROM \"User\" WHERE \"userName\"='".$userName."' limit 1";
			$res = pg_query($_SESSION["connect"], $query);
			while($row = pg_fetch_row($res)){
				echo "Your E-mail address is  $row[0]"."<br/>";
			}
			#echo "Your E-Mail address is ".$res."<br>";
			#<form action="profileUpdate.php">
			#<input type="submit" value="Change" />
			#</form>

		


		pg_close($_SESSION["connect"]);
		?>
        <a href=profileUpdate.php>Update Profile</a>
		<a href=logout.php>Logout</a>
</body>
</html>
