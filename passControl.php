<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>

</body>
</html>
<?php
	session_start();

	require 'database.php';

	/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
	if(!$connect)
	{
		echo "DB connection issue!!"; die();
	}*/


	/*if(!isset($_POST["userName"]) or !isset($_POST["pass"]))
	{

		echo "Kullanici Adi ve Sifre Bos Birakilamaz!! <br>";
		header("Refresh: 3; url=testPostgre.php");
	}
	*/

	//else
	//

	$userName=$_POST["userName"];
	$pass=$_POST["pass"];
	#$active = "SELECT * FROM \"User\" WHERE \"username\" ='".$userName."' AND status='1'";
	$notactive = "SELECT * FROM \"User\" WHERE \"username\" ='".$userName."' AND status='0'";
    if(pg_num_rows(pg_query($_SESSION["connect"],$notactive)) > 0){
        echo "Please activate your account with sended mail.";
        header("Refresh: 3; url=index.php");
        die();
    }
    $query="SELECT * FROM \"User\" WHERE \"username\"='".$userName."' AND pass='".$pass."' AND status='1' limit 1";
    #echo $query;
	$isTruee = pg_query($_SESSION["connect"], $query);

	$numRows=pg_num_rows($isTruee);
	if($numRows>0)
	{
		$_SESSION["login"] = true;
		$_SESSION["userName"] = $userName;
		echo "Welcome ".$userName."<br> Wait while redirecting please";
		header("Refresh: 3; url=home.php");

	}
	else
	{
		echo "Wrong User Name Password Combination<br>Redirecting";
		header("Refresh: 3; url=login.php");
	}
//}
pg_close($_SESSION["connect"]);
?>
