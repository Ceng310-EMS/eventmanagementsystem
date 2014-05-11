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
		require 'database.php';
		echo "Welcome ".$_SESSION["userName"]. "<br/>";
        echo "User id ".$_SESSION["id"]."<br/>";
		/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
		if(!$connect)
		{
			echo "DB connection issue!!"; die();
		}*/



			$userName = $_SESSION["userName"];
		        $query="SELECT \"email\" FROM \"User\" WHERE \"username\"='".$userName."' limit 1";
			$res = pg_query($_SESSION["connect"], $query);
			while($row = pg_fetch_row($res)){
				echo "Your E-mail address is  $row[0]"."<br/>";
			}
			#echo "Your E-Mail address is ".$res."<br>";
			#<form action="profileUpdate.php">
			#<input type="submit" value="Change" />
            #</form>
            $u_id = $_SESSION["id"];
            $sql = "select event.title from event,participate where $u_id = participate.u_id and event.e_id = participate.e_id ";
            $source = pg_query($_SESSION["connect"], $sql);
            echo "------Joined evet------"."<br/>";
            while($data = pg_fetch_row($source)){
                echo "$data[0] - ";
            }
            echo "<br/>"."------------------------"."<br/>";
            $getId = "select p_id from \"User\" where \"username\" = '".$userName."' limit 1 ";

            $data = pg_query($_SESSION["connect"], $getId);
            while($val = pg_fetch_array($data)){
            	$value = $val[0];
            }

            $sql = "select path from photo,\"User\" where  photo.p_id ="."$value";
            $source = pg_query($_SESSION["connect"], $sql);
            while($data = pg_fetch_row($source)){
                $path= "photo/".$data[0];

            }
            echo "<br/>".'<img src="'.$path.'"/>';


		pg_close($_SESSION["connect"]);
		?>
        <br/><a href=profileUpdate.php>Update Profile</a><br/>
        <a href=createEvent.php>Create Event</a><br/>
        <a href=myevent.php>My event</a><br/>
        <a href=joinEvent.php>Show events</a><br/>
        <a href=logout.php>Logout</a>
</body>
</html>
