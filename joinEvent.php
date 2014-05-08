<?php
 require 'loginCheck.php';
 require 'database.php';
?>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>Document</title>
</head>
<body>
     <form action="submitEvent.php" method="POST">
     <td><select name="selectedEvent"></td>
<?php
     $sql = "SELECT e_id,description from event";
     $resource = pg_query($_SESSION["connect"],"SELECT e_id,title FROM event");

    while ($row = pg_fetch_row($resource))
            {
              echo "<option value='". $row[0] ."'>" . $row[1] . "</option>";
            }
        pg_close($_SESSION["connect"]);
?>
    <input type="submit" value="Join"/>
</form>
</body>
</html>
