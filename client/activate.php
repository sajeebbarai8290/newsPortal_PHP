<?php
$cn = mysqli_connect("localhost", "root", "", "edbcms");

if(isset($_GET['id']))
{
	$sql = "select u.id, u.name, u.email, u.createDate, u.createIP, u.type from users as u where id = ".$_GET['id'];
	$table = mysqli_query($cn, $sql);
	if(mysqli_num_rows($table) > 0)
	{
		while($row = mysqli_fetch_assoc($table))
		{
			$sql = "insert into usersActive(userId, IP) values(".$row["id"].", '".$_SERVER['REMOTE_ADDR']."')";
			if(mysqli_query($cn, $sql))
			{
				print "Your account is activate now";
			}
			else{
				print "You are already active user";
			}
			break;
		}
	}
	else{
		print 'Invalid request, request generated by vua ID';
	}
}
else{
	print 'Invalid Request';
}
?>