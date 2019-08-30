<?php
session_start();
$cn = mysqli_connect("localhost", "root", "", "edbcms");

function ms($value)
{
	global $cn;
	return mysqli_real_escape_string($cn, strip_tags($value));
}


include('component/HTMLHelper.php');

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>My Sweet Web based software</title>
<link rel="stylesheet" href="css/myStyle.css"/>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link href="css/nivo-slider.css" rel="stylesheet" type="text/css"/>
<link href="css/bar/bar.css" rel="stylesheet" type="text/css"/>
<link href="css/dark/dark.css" rel="stylesheet" type="text/css"/>
<link href="css/default/default.css" rel="stylesheet" type="text/css"/>
<link href="css/light/light.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php

if(isset($_GET['c']) && $_GET['c'] == "logout" )
{
	unset($_SESSION['id']);
	unset($_SESSION['name']);
	unset($_SESSION['email']);
	unset($_SESSION['type']);
}
	
$email = "";
$password = "";

$eemail = "";
$epassword = "";

if(isset($_POST['btnLogin']))
{
	$email = $_POST['email'];
	$password = $_POST['password'];
	
	$er = 0;
	
	if($email == "")
	{
		$er++;
		$eemail = "<span class=\"error\">Required</span>";
	}
	
	if($password == "")
	{
		$er++;
		$epassword = "<span class=\"error\">Required</span>";
	}
	
	if($er == 0)
	{
		$cn = mysqli_connect("localhost", "root", "", "edbcms");
		$sql = "select id, name, email from users where email = '".mysqli_real_escape_string($cn, strip_tags($email))."' and password = password('".mysqli_real_escape_string($cn, strip_tags($password))."')";
		
		$table = mysqli_query($cn, $sql);
		if(mysqli_num_rows($table) > 0)
		{
			
			while($row = mysqli_fetch_assoc($table))
			{
				$sql = "select * from usersActive where userId = ".$row["id"];
				$table2 = mysqli_query($cn, $sql);
				if(mysqli_num_rows($table2))
				{
					$_SESSION['id'] = $row["id"];
					$_SESSION['name'] = $row["name"];
					$_SESSION['email'] = $row["email"];
					$_SESSION['type'] = "A";
				}
				else{
					$_SESSION['active'] = "You have not active your account yet, please active your account first";
				}
				//print '<span class="success">Login was successfull</span>';
				break;
			}
		}
	}
	
}
	
?>


<div class="header">
	<div class="logo">
    	<img src="images/power.png" alt="logo">
    </div>
    <div class="header1">
    	<img src="images/header.jpg" alt="logo">
    </div>
</div>
<div class="main">
    
	<div class="menu">
		<?php include('component/menu.php'); ?>
	</div>
	<br>
	<div class="fix slider-wrapper theme-light">
				<div id="slider" class="nivoSlider">
					<img src="images/1.jpg" alt=""/>
					<img src="images/2.jpg" alt=""/>
					<img src="images/3.jpg" alt=""/>
					<img src="images/4.jpg" alt=""/>
				</div>
	</div>
	
</div>
<div class="content">
		<?php
		
		include('component/controller.php');
		
		?>
</div>


<div class="footer">
	Footer
</div>



<script src="js/jquery-1.7.1.min.js"></script> 
		<script type="text/javascript" src="js/jquery.nivo.slider.js"></script> 
		<script type="text/javascript">
			$(window).load(function() {
				$('#slider').nivoSlider();
			});
			</script> 
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-36251023-1']);
		  _gaq.push(['_setDomainName', 'jqueryscript.net']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
		<script type="text/javascript">
			$(document).ready(function(){
			   var s =$("#sticker");
			   var pos = s.position();
			   $(window).scroll(function(){
					var windowpos = $(window).scrollTop();
					if(windowpos>=pos.top){
					   s.addClass("stick");
					} else {
					    s.removeClass("stick");
					}
				});
			});
		</script>





</body>
</html>
