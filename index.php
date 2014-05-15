<?php


require 'database.php';
?>

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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
		$(".icerik").hide();
		$("#slider li:first").addClass("secili").show();
		$(".icerik:first").show();
			$("#slider li").hover(function(){
				$("#slider li").removeClass("secili");
				$(this).addClass("secili");
				$(".icerik").hide();
				
				var a = $(this).find("a").attr("href");
					$(a).show();
				});	
	})
</script>
<style type="text/css">
	#bosluk{	
		margin-top:10px;
		height:0px;}
	a{text-decoration:none}
	ul,li{
	padding: 0;
margin0;	list-style-type: none;
	margin-left: 0px;
}
	img{border:none}
	#slider{ background-color:#333; height:auto; width:800px; float:left;}
	#slider li {padding:7px; float:left;}
	#slider li a{color:#fff; padding:2px; float:left;}
	#slider li.secili a{color:yellow; font-weight: bold; float:left;}
	.icerik{float:left; border:1px solid #222;}
	.icerikimg{float:left}
	.yazi{z-index:1; position:absolute; background-color: #000; width:800px; opacity:0.6; height:45px;}
	.yazi strong{ color:yellow; margin-left:10 px;}
	.yazi span{color:#fff; margin-left:10px; display:block}
</style>
</head>

<body onload="MM_preloadImages('malzemeler/ylogo1.png')">
<div id="container">
  <div id="header">
    <a href="index.php"><div id="logo"></div></a>
    <div id="menu">
      <ul>
        <li><a href="events.php">Find events</a></li>
        <li><a href="createEvent.php">Create Events</a></li>        
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
<div id="bosluk"></div>
		<div id="myevents">        
		<div id="slider">        
   		  <ul id="slider">
            	<li><a href="#s1">1</a></li>
                <li><a href="#s2">2</a></li>
                <li><a href="#s3">3</a></li>
                <li><a href="#s4">4</a></li>
                <li><a href="#s5">5</a></li>
            </ul>
            <?php

            $sql1 = "select path from logo order by l_id desc limit 5";
            $source1 = pg_query($_SESSION["connect"], $sql1);

            $sql2 = "select title,description from event order by e_id desc limit 5";
            $source2 = pg_query($_SESSION["connect"], $sql2);
            $i = 1 ;
            while($data1 = pg_fetch_row($source1)){
                $data2 = pg_fetch_row($source2);
                $path= "logo/".$data1[0];
                
                $title = $data2[0];
                $description = $data2[1];
                
            echo "
          <div id=\"s$i\" class=\"icerik\">
          		<img src=\"$path\" width=\"500px\" height=\"100px\"/>
          			<div class=\"yazi\">
                		<strong>$title</strong>
                    	<span>$description</span>
                	</div>
          </div> 
          "; 
           $i++;
        }
          ?>  
        </div>
</div>
<script src "js/bootstrap.js"></script>
</body>
</html>