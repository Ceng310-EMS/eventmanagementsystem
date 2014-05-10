<?php
    require 'loginCheck.php';
	require 'database.php';
    //session_start(); database.php de session var zaten
    $userName = $_SESSION["userName"];
    #$sqlid = "select id from \"User\" where \"username\" = '".$userName."'";
    #$resource = pg_query($_SESSION["connect"],$sqlid);
    #while($row = pg_fetch_row($resource)){
    #    $u_id = $row[0];
    #}
 $directory = $_SERVER['DOCUMENT_ROOT'] . '/logo/';
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

      $insert = "INSERT INTO logo(path) VALUES('".$path."')";

      pg_query($_SESSION["connect"],$insert);
    } else {
      echo "Invalid file";
    }

    $getId = "select l_id from logo where path = "."'$path'";
    echo $getId;
    $resource = pg_query($_SESSION["connect"],$getId);
    while($l_id = pg_fetch_array($resource)){
      $logo_id = $l_id[0];
    }
    echo $logo_id;
    $u_id = $_SESSION["id"];
    $_POST["title"] = htmlspecialchars($_POST["title"]);
    $_POST["type"] = htmlspecialchars($_POST["type"]);
    $_POST["topic"] = htmlspecialchars($_POST["topic"]);
    $_POST["location"] = htmlspecialchars($_POST["location"]);
    $description = htmlspecialchars($_POST["description"]);
	$sql="INSERT INTO event (title, type, topic, location, date, logo_id, description, u_id, quato) VALUES ('".$_POST["title"]."','".$_POST["type"]."','".$_POST["topic"]."','".$_POST["location"]."','".$_POST["startDate"]."','".$logo_id."','".$_POST["description"]."','".$u_id."','".$_POST["quato"]."')";
	$isExecuted=pg_query($_SESSION["connect"], $sql);
	if($isExecuted)
	{
		echo "Event created";
        header("Refresh: 2; url=myevent.php");
	}
	else
	{
		echo "Something go wrong while creating event";
        header("Refresh: 2; url=createEvent.php");
	}
	pg_close($_SESSION["connect"]);
	?>

</body>
</html>
