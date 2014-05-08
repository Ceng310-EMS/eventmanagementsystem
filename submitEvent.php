<?php
    require 'loginCheck.php';
    require 'database.php';


    $u_id = $_SESSION["id"];
    $e_id = $_POST["selectedEvent"];

    $insert = "Insert into participate values($u_id,$e_id)";
    $update = "update event set quato=quato-1 where e_id = $e_id";

    pg_query($_SESSION["connect"],$insert);
    pg_query($_SESSION["connect"],$update);

    echo "Event registiration successfull";

    pg_close($_SESSION["connect"]);

?>
