<?php
$title = "";
$newsId = "";
$image = "";

$etitle = "";
$enewsId = "";
$eimage = "";

if(isset($_POST['submit']))
{
	$title = $_POST['title'];
	$newsId = $_POST['newsId'];
	$image = $_FILES['image'];
	
	$er = 0;
	
	if($title == "")
	{
		$er++;
		$etitle = '<span class="error">Required</span>';
	}
	if($newsId == "0")
	{
		$er++;
		$enewsId = '<span class="error">Required</span>';
	}
	if($image['name'] == "")
	{
		$er++;
		$eimage = '<span class="error">Required</span>';
	}
	
	if($er == 0)
	{
		$sql = "insert into newsImages(title, newsId, image) values('".ms($title)."', ".ms($newsId).", '".ms($image['name'])."')";
		if(mysqli_query($cn, $sql))
		{
			$sp = $image['tmp_name'];
			$dp = "uploads/newsImages/".mysqli_insert_id($cn)."_".$image['name'];
			move_uploaded_file($sp, $dp);
			
			print '<span class="success">Data Saved</span>';
			$title = "";
			$newsId = "";
			$image = array();
		}
		else{
			print '<span class="error">'.mysqli_error($cn).'</span>';
		}
	}
	
}

?>
	<form method="post" action="" enctype="multipart/form-data">

	<label>Title</label><br>
	<input type="text" name="title" value="<?php print $title; ?>"/><?php print $etitle; ?><br><br>

	<label>News</label><br>
	<select name="newsId">
		<option value="0">Select</option>
		<?php
		$sql = "select id, title from pages";
		$table = mysqli_query($cn, $sql);
		
		while($row = mysqli_fetch_assoc($table))
		{
			if($row["id"] == $newsId)
			{
				print "<option value=\"".$row["id"]."\" Selected>".$row["title"]."</option>";
			}
			else{
				print "<option value=\"".$row["id"]."\">".$row["title"]."</option>";
			}
		}
		
		?>
	</select><?php print $enewsId; ?><br><br>

	<label>Image</label><br>
	<input type="file" name="image"/><?php print $eimage; ?><br><br>

	<input type="submit" name="submit" value="Submit"/>

</form>