<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Update</title>
</head>
<body>
	<?php
		
		
        require 'loginCheck.php';
        require 'database.php';
        
        $directory = $_SERVER['DOCUMENT_ROOT'] . '/photo/';
    	echo $directory;
    	$allowedExts = array("gif", "jpeg", "jpg", "png");
	    $temp = explode(".", $_FILES["file"]["name"]);
	    $extension = end($temp);

		     if ((($_FILES["file"]["type"] == "image/gif")
		    || ($_FILES["file"]["type"] == "image/jpeg")
		    || ($_FILES["file"]["type"] == "image/jpg")
		    || ($_FILES["file"]["type"] == "image/pjpeg")
		    || ($_FILES["file"]["type"] == "image/x-png")
		    || ($_FILES["file"]["type"] == "image/png"))
		    && ($_FILES["file"]["size"] < 2000000)
		    && in_array($extension, $allowedExts)) {
		      if ($_FILES["file"]["error"] > 0) {
		        echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
		      } else {
		        echo "Upload: " . $_FILES["file"]["name"] . "<br>";
		        echo "Type: " . $_FILES["file"]["type"] . "<br>";
		        echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
		        echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";
		        if (file_exists($directory . $_FILES["file"]["name"])) {
		          echo $_FILES["file"]["name"] . " already exists. ";
		        } else {
		          $fname  = $_FILES["file"]["name"];
		          $fname  = str_replace(" ","",$fname);

		          move_uploaded_file($_FILES["file"]["tmp_name"],
		          $directory . $fname);
		          echo "Stored in: " . $directory . $fname;
		          $path = $fname;
		        }
		      }
		       $id = $_SESSION["id"];
		       $insert = "INSERT INTO photo(path) VALUES('".$path."')";

			      pg_query($_SESSION["connect"],$insert);
			    } else {
			      echo "Invalid file";
			    }
			    $description = $_POST["description"];
				$insertDescription = "Update \"User\" set description ="."'$description'"." where id="."$id";
				echo $insertDescription;
				pg_query($_SESSION["connect"],$insertDescription);


				$getId = "select p_id from photo where path = "."'$path'";
			    echo $getId;
			    $resource = pg_query($_SESSION["connect"],$getId);
			    while($p_id = pg_fetch_array($resource)){
			      $photo_id = $p_id[0];
			      echo $photo_id;
			    }
			    
			    $insertPhotoid = "Update \"User\" set p_id ="."$photo_id"." where id="."$id";
			    echo $insertPhotoid;
			    pg_query($_SESSION["connect"],$insertPhotoid);
		

		if ((isset($_POST["pass"]) and isset($_POST["pass2"])) and ($_POST["pass"]!="" and $_POST["pass2"]!=""))
		{	
			
			if($_POST["pass"]==$_POST["pass2"])
			{ 
				$sql = "UPDATE \"User\" SET pass='".$_POST["pass"]."',\"email\"='".$_POST["eMail"]."' WHERE \"username\"='".$_SESSION["userName"]."'";
				$isDone = pg_query($_SESSION["connect"],$sql);
				if($isDone)
				{
					echo "Your profile has been updated you are being redirected";
					header("Refresh: 3; url=home.php");

				}
				else
				{
					echo "Update FAILED you are being redirected";
					header("Refresh: 3; url=home.php");
				}
			}

		}
		else
		{
					
				if(($_POST["pass"]!="" and $_POST["pass2"]=="") or ($_POST["pass"]=="" and $_POST["pass2"]!=""))
				{
					echo "One of the oassword field is left empty.<br>Redirecting";
					header("Refresh: 3; url=home.php");
				}
				else
				{
					$sql = "UPDATE \"User\" SET \"email\"='".$_POST["eMail"]."' WHERE \"username\"='".$_SESSION["userName"]."'";
					$isDone = pg_query($_SESSION["connect"],$sql);
					if($isDone)
					{
						echo "Your profile has been updated you are being redirected";
						header("Refresh: 3; url=home.php");

					}
					else
					{
						echo "Update FAILED you are being redirected";
						header("Refresh: 3; url=home.php");
					}
				}
		}
		pg_close($_SESSION["connect"]);
		

		

	?>
</body>
</html>
