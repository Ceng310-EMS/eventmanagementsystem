<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Validation Pass</title>
</head>
<body>
	<?php
		if(!isset($_POST["userName"]) or !isset($_POST["pass"]) or !isset($_POST["pass2"]))
		{
			echo "Required fields cant be blank<br>You are redirecting.";
			header("Refresh: 3; url=signup.php");
		}
		else
		{
			if($_POST["pass"]!=$_POST["pass2"])
			{
                echo "Password must be same<br>Try again<br>You are redirecting";
				header("Refresh: 3; url=signup.php");
			}
			else
			{
				$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
				if(!$connect)
				{
					echo "DB connection issue!!"; die();
				}
				else
				{
					$userName = $_POST["userName"];
					$pass = $_POST["pass"];
					$eMail = $_POST["eMail"];
					if (!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$eMail))
  					{
  						$emailErr = "Invalid email format";
  						echo $emailErr;
  						header("Refresh:2;signup.php");
  					}
  					else
					{	$id=0;
  						$sql = "INSERT INTO \"User\" VALUES ('".$id."','".$userName."','".$pass."','".$eMail."')";
  						$isExecuted = pg_query($connect,$sql);
						echo pg_last_error($connect);
						if($isExecuted)
  						{
							
  							echo "test";
							$id++;
  							echo "Thank you. You have done with registiration dear ".$userName."<br> You are redirecting";
							header("Refresh:2;login.php");
  						}

  					}
				}
			}
		}
	?>
</body>
</html>
