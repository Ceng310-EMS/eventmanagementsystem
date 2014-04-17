<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
	<script>
		function isEmpty()
		{
			var field = document.forms["login"]["userName"].value;
			var field2= document.forms["login"]["pass"].value;
			if ((field==null || field=="") || (field2==null || field2==""))
			{
				alert("Kullanıcı Adı ve Şifre boş bırakılamaz");
				return false;
			}
		}
	</script>
</head>
<body>
		<form name="login" action="passControl.php" onsubmit="return isEmpty()" method="post">
			<label for="Kullanici_Adi">Kullanıcı Adı</label>
			<input type="text" name="userName" id="userName" /><br>
			<label for="Password">Şifre</label>
			<input type="password" name="pass" id="pass" /><br>
			<input type="submit" value="Submitt" />
		</form>

</body>
</html>