<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Update</title>
</head>
<body>
	<?php
		
		
        require 'loginCheck.php';
        require 'database.php';
        
		
		

		if ((isset($_POST["pass"]) and isset($_POST["pass2"])) and ($_POST["pass"]!="" and $_POST["pass2"]!=""))
		{	
			
			if($_POST["pass"]==$_POST["pass2"])
			{ 
				$sql = "UPDATE \"User\" SET pass='".$_POST["pass"]."',\"email\"='".$_POST["eMail"]."' WHERE \"username\"='".$_SESSION["userName"]."'";
				$isDone = pg_query($_SESSION["connect"],$sql);
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
		else
		{
					
				if(($_POST["pass"]!="" and $_POST["pass2"]=="") or ($_POST["pass"]=="" and $_POST["pass2"]!=""))
				{
					echo "One of the oassword field is left empty.<br>Redirecting";
					header("Refresh: 3; url=home.php");
				}
				else
				{
					$sql = "UPDATE \"User\" SET \"email\"='".$_POST["eMail"]."' WHERE \"username\"='".$_SESSION["userName"]."'";
					$isDone = pg_query($_SESSION["connect"],$sql);
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
		pg_close($_SESSION["connect"]);
		

		

	?>
</body>
</html>
