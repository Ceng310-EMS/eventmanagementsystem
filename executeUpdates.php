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

		if(isset ($_POST["pass"]) and isset($_POST["pass2"]))
		{
			if($_POST["pass"]==$_POST["pass2"])
			{
				$sql = "UPDATE User SET password='".$_POST["pass"]."',eMail='".$_POST["eMail"]."' WHERE userName='".$_SESSION["userName"]."'";
				$isDone = pg_query($connect,$sql);
				if($isDone)
				{
					echo "Your profile has been updated you are being redirected";
					header("Refresh: 3; url=home.php");

				}
				else
				{
					echo "Update FAILED you are being redirected";
					header("Refresh: 3; url=home.php");
				}
			}

		}
		pg_close($connect);


	?>
	
</body>
</html>