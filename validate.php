<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
</head>
<body>
	<?php
		if(!isset($_POST["userName"]) or !isset($_POST["pass"]) or !isset($_POST["pass2"]))
		{
			echo "Gerekli alanlar boş bırakılamaz<br>Yönlendiriliyorsunuz.";
			header("Refresh: 3; url=loginPanel.php");
		}
		else
		{
			if($_POST["pass"]!=$_POST["pass2"])
			{
				echo "Şifreler uyuşmuyor<br>Tekrar deneyin<br>Yönlendiriliyorsunuz";
				header("Refresh: 3; url=loginPanel.php");
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
  						header("Refresh:2;loginPanel.php");
  					}
  					else
  					{	$userID=0;
  						$sql = "INSERT INTO member VALUES ('".$userName."','".$pass."','".$eMail."','".$userID."')";
  						$isExecuted = pg_query($connect,$sql);
  						if($isExecuted)
  						{
  							echo "Üyelik işleminiz tamamlanmıştır sayın ".$userName."<br> Sayfanıza Yönlendiriliyorsunuz";
  						}

  					}
				}
			}
		}
	?>
</body>
</html>
