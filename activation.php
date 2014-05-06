<?php
  session_start();
  include 'database.php';
  $msg='';
  if(!empty($_GET['code']) && isset($_GET['code']))
  {
      $code = $_GET['code'];
      $query="select id from \"User\" where activation='".$code."'";
      $source = pg_query($_SESSION["connect"],$query);
      if(pg_num_rows($source) > 0)
      {
          $count=pg_query($_SESSION["connect"],"select id from \"User\" where activation='$code' and status='0'");

          if(pg_num_rows($count) == 1)
          {
              pg_query($_SESSION["connect"],"update \"User\" SET status='1' where activation='$code'");
              $msg="Your account is activated";
              $url = "login.php";
          }
          else
          {
              $msg ="Your account is already active, no need to activate again";
              $url = "login.php";
          }

      }
      else
      {
          $msg ="Wrong activation code.";
      }

  }
?>
    <?php echo $msg."<br/>";
  echo "You are redirecting.    Please Wait.";
  header("Refresh: 3; url=$url");
?>

