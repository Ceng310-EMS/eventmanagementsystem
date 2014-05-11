<?php
    require 'loginCheck.php';
    require 'database.php';


    $u_id = $_SESSION["id"];
    $e_id = $_POST["selectedEvent"];

    echo $e_id;

    $insert = "Insert into participate values($u_id,$e_id)";
    $update = "update event set quato=quato-1 where e_id = $e_id";

    pg_query($_SESSION["connect"],$insert);
    pg_query($_SESSION["connect"],$update);

    echo "Event registiration successfull";
    header("Refresh:3; url=home.php");
    pg_close($_SESSION["connect"]);

?>
