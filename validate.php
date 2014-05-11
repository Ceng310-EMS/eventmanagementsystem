<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>olayVar</title>
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
  
  
  require 'database.php';
  if(!isset($_POST["userName"]) or !isset($_POST["pass"]) or !isset($_POST["pass2"]))
		{
			$message = "Required fields cant be blank<br>You are redirecting.";
			$value = 0;
			//header("Refresh: 3; url=signup.php");
		}
		else
		{
			if($_POST["pass"]!=$_POST["pass2"])
			{
                $message = "Password must be same<br>Try again<br>You are redirecting";
				$value = 1;//header("Refresh: 3; url=signup.php");
			}
			else
			{

				/*$connect = pg_connect("host=localhost port=5432 dbname=olayvar user=ceng310 password=eksibir");
				if(!$connect)
				{
					echo "DB connection issue!!"; die();
				}*/


					$userName = $_POST["userName"];
					$pass = $_POST["pass"];
					$eMail = $_POST["eMail"];
					if (!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$eMail))
  					{
  						$emailErr = "Invalid email format";
  						$message = $emailErr;
  						$value = 2;//header("Refresh:2;signup.php");
  					}
  					else
					{	#$id=19;
                        $activation = md5($eMail.time());
                        $sql = "INSERT INTO \"User\"(username,pass,email,activation) VALUES ('".$userName."','".$pass."','".$eMail."','".$activation."')";
  						#$sql = "INSERT INTO \"User\"(username,pass,email) VALUES ('".$userName."','".$pass."','".$eMail."')";
  						$isExecuted = pg_query($_SESSION["connect"],$sql);
						echo pg_last_error($connect);
						if($isExecuted)
  						{
                            include 'mail/Send_Mail.php';
                            $to=$eMail;
                            $subject="Email verification";
                            $body='Hi, <br/> <br/> We need to make sure you are human. Please verify your email and get started using your Website account. <br/> <br/> <a href="'.$base_url.$activation.'">'.$base_url.'activation/'.$activation.'</a>';
                            Send_Mail($to,$subject,$body);
                            $message = "Registration successful, please activate your account with the link in your email.<br>";
  							
							#$id++;
  							$message = $message."Thank you. You have done with registiration dear ".$userName."<br> You are redirecting";
							$value = 3;//header("Refresh:2;login.php");
  						}
  						else
  						{
							$message = "Registration Failed";
							$value = 4;

  						}

  					}

			}
		}
  ?>
<div id="container">
  <div id="header">
    <a href="index.php"><div id="logo"></div></a>
    <div id="menu">
      <ul>
        <li><a href="events.php">Find events</a></li>
        <li><a href="createEvent.php">Create Event</a></li>
        <li><a href="topevents.php">Top Events</a></li>
        <li><a href="contact.php">Contact Us</a></li>
        <li><a href="login.php">Login</a></li>
        <li><a href="signup.php">Sign Up</a></li>
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
	<div id="ceventpanel">
    	<form class="well">
        	<div id="log">


  <?php //kontrol noktasi
 
	pg_close($_SESSION["connect"]);
  
  	if($value==0)
  	{
				echo "<label><h4>". $message. "</h4></label>";
  				header("Refresh: 3; url=signup.php");
  	}
  	else if($value==1)
  	{
  		echo "<label><h4>". $message. "</h4></label>";
  		header("Refresh: 3; url=signup.php");
  	}
  	else if($value==2)
  	{
  		echo "<label><h4>". $message. "</h4></label>";
  		header("Refresh:3;signup.php");
  	}
  	else if($value==3)
  	{
  		echo "<label><h4>". $message. "</h4></label>";
  		header("Refresh:3;login.php");
  	}
  	else if($value==4)
  	{
  		echo "<label><h4>". $message. "</h4></label>";
  		header("Refresh:3;signup.php");
  	}
  ?>
            </div>
        </form>
        
    </div>
   
</div>
<script src "js/bootstrap.js"></script>

</body>
</html>