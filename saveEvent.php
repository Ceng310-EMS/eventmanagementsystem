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
    $u_id = $_SESSION["id"];
	$sql="INSERT INTO event (title, type, topic, location, date, logo_id, description, u_id, quato) VALUES ('".$_POST["title"]."','".$_POST["type"]."','".$_POST["topic"]."','".$_POST["location"]."','".$_POST["startDate"]."','"."1"."','".$_POST["description"]."','".$u_id."','".$_POST["quato"]."')";
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
