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
		echo "Welcome ".$_SESSION["userName"]. "<br/>";
		?>
		<a href=logout.php>Logout</a>
</body>
</html>
