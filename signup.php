<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Sign Up</title>
</head>
<body>
	Create an account <br>
	<?php
	echo '<form action="validate.php" method="post">'."<br>";
	echo "Username".'<input type="text" name="userName" id="userName" />'."<br>";
	echo "Password".'<input type="password" name="pass" id="pass" />'."<br>";
	echo "Password Again".'<input type="password" name="pass2" id="pass2" />'."<br>";
	echo "E-Mail".'<input type="text" name="eMail" id="eMail" />'."<br>";
	echo '<input type="submit" value="Submit" />';
	echo '</form>';
	?>
</body>
</html>
