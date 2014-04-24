
	<?php
	session_start();
	if(!isset($_SESSION["login"])){


		echo "Please login first";
		header("Refresh: 3; url=login.php");
		die();

	}
	?>

