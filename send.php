<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Email Send</title>
</head>
<body>
	<?php
		$sub=$_POST["subject"];
		$body=$_POST["body"];
		include 'mail/Send_Mail.php';
                            $to="muhammednurekin@gmail.com";
                            $subject=$sub;
                            
                            Send_Mail($to,$subject,$body);
                            $msg= "Thanks for contrubuting";
  							
  							echo $userName;
							header("Refresh:2;login.php");
	?>
</body>
</html>