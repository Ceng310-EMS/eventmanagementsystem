<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Validation Pass</title>
</head>
<body>
	<?php
		require 'database.php';

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

				/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
				if(!$connect)
				{
					echo "DB connection issue!!"; die();
				}*/


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
					{	#$id=19;
                        $activation = md5($eMail.time());
                        $sql = "INSERT INTO \"User\"(username,pass,email,activation) VALUES ('".$userName."','".$pass."','".$eMail."','".$activation."')";
  						#$sql = "INSERT INTO \"User\"(username,pass,email) VALUES ('".$userName."','".$pass."','".$eMail."')";
  						$isExecuted = pg_query($_SESSION["connect"],$sql);
						echo pg_last_error($connect);
						if($isExecuted)
  						{
                            include 'mail/Send_Mail.php';
                            $to=$eMail;
                            $subject="Email verification";
                            $body='Hi, <br/> <br/> We need to make sure you are human. Please verify your email and get started using your Website account. <br/> <br/> <a href="'.$base_url.$activation.'">'.$base_url.'activation/'.$activation.'</a>';
                            Send_Mail($to,$subject,$body);
                            $msg= "Registration successful, please activate email.";
  							echo "test";
							#$id++;
  							echo "Thank you. You have done with registiration dear ".$userName."<br> You are redirecting";
							header("Refresh:2;login.php");
  						}
  						else
  						{
							echo "kayıt yapılamadı";

  						}

  					}

			}
		}
		pg_close($_SESSION["connect"]);
	?>
</body>
</html>
