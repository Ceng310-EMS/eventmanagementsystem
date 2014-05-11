<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <?php
    require 'loginCheck.php';
    require 'database.php';
  ?>
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
</head>

<body onload="MM_preloadImages('malzemeler/ylogo1.png')">
  <?php
    
    $eventid=$_GET["eid"];    
    $sql = "SELECT * FROM event WHERE e_id='".$eventid."'";
    $res=pg_query($_SESSION["connect"], $sql);
    while($row=pg_fetch_array($res))
    {
    $eid=$row[0];
    $title=$row[1];
    $type=$row[2];
    $topic=$row[3];
    $location=$row[4];
    
    $description=$row[7];
    $quato=$row[9];  
    }
  ?>
<div id="container">
  <div id="header">
    <div id="logo"></div>
    <div id="menu">
      <ul>
       <li><a href="createEvent.php">Create Event</a></li>
        <li><a href="myevent.php">My Events</a></li>        
        <li><a href="home.php">My Profile</a></li>
        <li><a href="account.html">Account</a></li>
        <li><a href="logout.php">Logout</a></li>
        <li><a href="home.php">Home</a></li>
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
    	<form class="well" action="executeEditEvent.php" method="post" enctype="multipart/form-data">
        <label><h3>Add Event Details</h3></label>
        <div id="ceventpanelalt">
        <label><h5>Event Title<span style="color:#F00">*</span></h5></label>
        <?php echo '<input type="text" name = "title" class="span7" value="'. $title.'" required="required" />';?>
        <label><h5>Event Type<span style="color:#F00">*</span></h5></label>
        <select name="type" class="form-control" required="required" >
        <option value="" disabled selected style="display:none;">Select the type of Event </option>
        <option value="Conferance">Conferance</option>
        <option value="Dinner or Gala">Dinner or Gala</option>
        <option value="Meeting">Meeting</option>
        <option value="Seminar or Talk">Seminar or Talk</option>
        <option value="Tournement">Tournament</option>
        <option value="Festival">Festival</option>
        <option value="Other">Other</option>
        </select>
        <label><h5>Event Topic<span style="color:#F00">*</span></h5></label>
        <select class="form-control">
        <select name="topic" class="form-control">
        <option value="" disabled selected style="display:none;">Select a Topic </option>
        <option value="Business & Professional">Business & Professional</option>
        <option value="Community & Culture">Community & Culture</option>
        <option value="Family & Education">Family & Education</option>
        <option value="Fashion & Beauty">Fashion & Beauty</option>
        <option value="Film, Media & Entertainment">Film, Media & Entertainment</option>
        <option value="Food& Drink">Food& Drink</option>
        <option value="Government & Politics">Government & Politics</option>
        <option value="Health & Wellness">Health & Wellness</option>
        <option value="Hobbies & Special Interest">Hobbies & Special Interest</option>
        <option value="Home & Lifestyle">Home & Lifestyle</option>
        <option value="Music">Music</option>
        <option value="Religion">Religion</option>
        <option value="Science & Technology">Science & Technology</option>
        <option value="Holiday">Holiday</option>
        <option value="Sports & Fitness">Sports & Fitness</option>
        <option value="Travel & Outdoor">Travel & Outdoor</option>
        <option value="Other">Other</option>
        
        </select>
        <label><h5>Location</h5></label><br>
        <?php echo '<input type="text" class="span7" name="location" id="location" value="'.$location.'" required="required" />'."<br>";?>
        <label><h5>Date and Time<span style="color:#F00">*</span></h5></label>
        <input type="datetime-local" name="startDate" id="startDate" required="required"/>&nbsp;&nbsp;&nbsp;
       <input type="hidden" name="eid" id="hiddenField" value=<?php echo $eid; ?> />
        <label><h5>Event Description</h5></label>
       <?php echo '<textarea style="resize:none" class="span7" cols="200" rows="7" name="description" id="description" placeholder="'.$description.'" ></textarea>'."<br/>";?>
       <label><h5>Quato </h5></label>
        <input type="text" class="span7" name="quato" placeholder="Please write number of visitor"/>
        <label><h5>Organizer name</h5></label>
        <input type="text" class="span7" name="createdBy" id="createdBy" placeholder="Let your attendees know who's organizing or hosting this event" />
        <label><h5>Organizer description</h5></label>
        <textarea style="resize:none" class="span7" rows="5" name="organizer" id="organizer" placeholder="Give a brief overview of yourself or your organization"></textarea><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success">Save</button>
        </div> 
        </form>
        
    </div>
   
</div>
<script src "js/bootstrap.js"></script>
</body>
</html>