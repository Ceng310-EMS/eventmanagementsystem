<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
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
	text-align: right;
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
<div id="container">
  <div id="header">
    <div id="logo"></div>
    <div id="menu">
      <ul>
        <li><a href="events.php">Find events</a></li>
        <li><a href="createEvent.php">Create Event</a></li>
        <li><a href="index.php">Top Events</a></li>
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
  
    <div id="log">
    <form class="well" name="login" action="passControl.php" method="post">
      <div id="log1">Login</div>
      <div id="or"><a href="signup.php">Or, Sign Up</a></div>

      <div id="mailarea"><input type="text" class="span3" name="userName" id="userName"  placeholder="e.g..Zeynep Orhan" required="required" /></div>
      <div id="passwordarea"><input type="password" class="span3" name="pass" id="pass" placeholder="Password" required="required" /></div>
      <div id="loginbtn"><button type="submit" class="btn btn-info" value="login"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Log in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4></button></div>
      <div id="remfor">
      <div id="rem"><input type="checkbox" class="icon-check" /> Remember me</div>
      <div id="for"><a href="resetpassword.php">Forget Password?</a></div>
 		     
      </div>
  </form>
  </div>
  
</div>
<script src "js/bootstrap.js"></script>
</body>
</html>