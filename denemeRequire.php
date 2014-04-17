
	<?php
	session_start();
	if(!isset($_SESSION["login"])){


		echo "ilk once giris yap gavat";
		header("Refresh: 3; url=testPostgre.php");
		die();

	}
	?>
	
