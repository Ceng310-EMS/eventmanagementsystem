<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Email Send</title>
</head>
<body>
	<?php
	require 'database.php';
		$email=$_POST["email"];
		
		include 'mail/Send_Mail.php';
                            $to=$email;

                            $pass=mt_rand(1000,10000);
                            $subject="password Reset";
                            $body="Your new password is ".$pass;
                            Send_Mail($to,$subject,$body);
                            $msg= "Password reset";
  							$query="UPDATE \"User\" SET pass='".$pass."' WHERE \"email\"='".$email."'";
  							$isDone = pg_query($_SESSION["connect"],$query);
				if($isDone)
				{
					echo $msg;
							header("Refresh:2;login.php");

				}
				else
				{
					echo "Update FAILED you are being redirected";
					header("Refresh: 3; url=login.php");
				}	
  							
	?>
</body>
</html>