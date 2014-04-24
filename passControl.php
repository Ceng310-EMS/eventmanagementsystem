
<?php
	session_start();
	$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
	if(!$connect)
	{
		echo "DB connection issue!!"; die();
	}
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
	$query="SELECT * FROM \"User\" WHERE \"userName\"='".$userName."' AND pass='".$pass."' limit 1";
	$isTruee = pg_query($connect, $query);
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
pg_close($connect);
?>
