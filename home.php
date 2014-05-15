<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OlayVar</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link type ="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<style type="text/css">
a:link {
text-decoration: none;
}
a:visited {
text-decoration: none;
}
a:hover {
text-decoration: none;
}
a:active {
text-decoration: none;
}
</style>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
 var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
   var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
   if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
 var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
 var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
   d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
 if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
 for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
 if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
 var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
  if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>

<body onload="MM_preloadImages('malzemeler/ylogo1.png')">
 <?php
   require 'loginCheck.php';
   require 'database.php';
   
 ?>
<div id="container">
 <div id="header">
   <a href="index.php"><div id="logo"></div></a>
   <div id="menu">
     <ul>
       <li><a href="createEvent.php">Create Event</a></li>
        <li><a href="myevent.php">My Events</a></li>        
        <li><a href="events.php">Find Events</a></li>
        <li><a href="account.html">Account</a></li>
        <li><a href="logout.php">Logout</a></li>
        <li><a href="home.php">My Profile</a></li>
     </ul>
   </div>
 </div>
 <div id="clear-header"></div>
 <div id="banner">
   <div id="login"></div>
   <div id="resimgecis">
     <marquee width="100%" scrollamount="5">
     </marquee>
   </div>
 </div>
 <div id="divider"><img src="malzemeler/divider.png" width="980" height="26" /></div>
 <div id="panel">
<div id="homepanel">
   <div id="homepanelleft">
   	<form class="well">
      <?php
      $userName = $_SESSION["userName"];
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
            echo "<br/>".'<img src="'.$path.'" with="100" height="100"/>';
      ?>

       
       </form>
       </div>
       <div id="homepanelright">
         <?php
         $userName = $_SESSION["userName"];
           $query="SELECT \"email\" FROM \"User\" WHERE \"username\"='".$userName."' limit 1";
           $res = pg_query($_SESSION["connect"], $query);
           /*while($row = pg_fetch_row($res)){
           echo "Your E-mail address is  $row[0]"."<br/>";
     }*/
           $row = pg_fetch_array($res, NULL, PGSQL_ASSOC);
           $query="SELECT \"description\" FROM \"User\" WHERE \"username\"='".$userName."' limit 1";
           $res2 = pg_query($_SESSION["connect"], $query);
           $row2 = pg_fetch_array($res2, NULL, PGSQL_ASSOC);


     ?>
       <form class="well">
       	<label><h5>User Name : <?php echo $_SESSION["userName"]; ?></h5></label><br/> 
         <div hidden="homepanelright"></div>
           
            <label><h5>E-Mail : <?php echo $row["email"]; ?></h5></label><br/> <!--echo $row["email"];-->
           <label><h5>Description : <?php echo $row2["description"]; ?></h5></label><br/>

           <?php
             $u_id = $_SESSION["id"];
            $sql = "select event.title from event,participate where $u_id = participate.u_id and event.e_id = participate.e_id ";
            $source = pg_query($_SESSION["connect"], $sql);
            echo '<label><h5>Joined Event</h5></label>';
            while($data = pg_fetch_row($source)){
                echo '<label><h6>'."$data[0]".'</h5></label>';
            }
            
            ?>         
           
       </form>
       </div>
   </div>
  
</div>

<?php pg_close($_SESSION["connect"]); ?>
<script src "js/bootstrap.js"></script>
</body>
</html>