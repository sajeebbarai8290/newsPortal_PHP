<?php
$search = "";
if(isset($_POST['btnSearch']))
{
	$search = $_POST['search'];
}
?>
<form method="post" action="">
	<fieldset>
		<legend>Search Area</legend>
		<input type="text" name="search" value="<?php print $search; ?>"/>
		<input type="submit" name="btnSearch" value="Search"/>
	</fieldset>
	
</form>


<?php
$cn = mysqli_connect("localhost", "root", "", "edbcms");


if(isset($_GET['id']))
{
	$sql = "insert into pagesLike(userId, pageId, dateTime) values(".$_SESSION['id'].", ".ms($_GET['id']).", '".date('Y-m-d')."')";
	mysqli_query($cn, $sql);
}


if(isset($_GET['ctg']))
{
	$sql = "select name from category where id = ".$_GET['ctg'];
	$table = mysqli_query($cn, $sql);
	while($row = mysqli_fetch_assoc($table))
	{
		print '<h1>'.$row["name"].'</h1>';
	}
}


$sql = "select p.id, p.title, p.tag, p.createDate, u.name as users, 
		c.name as category, p.count
		from pages as p 
		left join category c on p.categoryId = c.id
		left join users u on p.userId = u.id where p.id > 0 ";

if(isset($_GET['ctg']))
{
	$a[] = $_GET['ctg'];
	findSubCategory($_GET['ctg'], $a);
	$sql .= " and p.categoryId in (".implode(", ", $a).")";
}

if($search != "")
{
	$sql .= " and (p.title like '%".$search."%' or p.tag like '%".$search."%')";
}

$page = 1;

if(isset($_GET['page']))
{
	$page = $_GET['page'];
}

$table = mysqli_query($cn, $sql);

$totalRow= mysqli_num_rows($table);

print '<div class="summery"><h2>Total <b>'.((($page - 1) * 3) + 1).' - '.((($page - 1) * 3) + 3).' / '.$totalRow.'</b> Article Found</h2><h3>';

if($page > 1){
	print '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'">First </a>';
	print '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'&page='.($page - 1).'"> Previous </a>';
}

$lastPage = $totalRow % 3;
if($lastPage == 0)
{	
	$lastPage = $totalRow / 3;
}
else
{
	$lastPage = ($totalRow / 3) + 1;
}

if($page < $lastPage)
{
	print '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'&page='.($page + 1).'"> Next </a>';
	print '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'&page='.$lastPage.'"> Last</a>';
}

print '</h3></div>';

print '<div><h3>';
for($i= 1; $i <= $lastPage; $i++){
	print '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'&page='.$i.'">Page'.$i.' </a>';
}
print '</h3></div>';

$sql .= "limit ".(($page - 1) * 3).", 3";

$table = mysqli_query($cn, $sql);

while($row = mysqli_fetch_assoc($table))
{
	print "<div class=\"articleDetails\">";
	print "<h2>".$row["title"]."</h2>";
	print "<h3><b>".$row["users"]."</b> in <b>".$row["category"]."</b> on <i>".$row["createDate"]."</i></h3>";
	
	$fileName = "article/".str_replace(" ", "_", trim(strtolower( $row["title"]))).".html";
	
	$file = fopen($fileName, "r");
	
	$content = fread($file, filesize($fileName));
	
	print "<div>";
	findImage($row["id"]);
	print substr(strip_tags($content), 0, 400)."......<br><a href=\"?c=articleDetails&id=".$row["id"]."\">Read More</a></div>";
	print '<div>'.findLike($row['id']).'</div>';
	print "</div>";
}		


function findImage($nid)
{
	global $cn;
	$sql = "select id, title, image from newsImages where newsId = ".$nid." limit 0, 1";
	$table = mysqli_query($cn, $sql);
	while($row = mysqli_fetch_assoc($table))
	{
		print '<img src="uploads/newsImages/'.$row["id"].'_'.$row["image"].'" />';
	}
	
}

function findLike($nid)
{
	global $cn;
	$a = array();
	$users = "";
	$s = '';
	$sql = "select pl.userId, u.name, pl.dateTime from pagesLike as pl left join users as u on pl.userId = u.id where pl.pageId = ".$nid;
	$table = mysqli_query($cn, $sql);
	while($row = mysqli_fetch_assoc($table))
	{
		$a[] = $row["userId"];
		$users  .= $row["name"]."\n";
	}

	if(isset($_SESSION['type']))
	{
		if(in_array($_SESSION['id'], $a))
		{
			$s .= '<a href="#" >You Liked</a>';
		}
		else{
			$s .= '<a href="?c='.$_GET['c'].'&ctg='.$_GET['ctg'].'&id='.$nid.'">Like</a>';
		}
	}
	else
	{
		$s .= '<a href="#">Like</a> ';	
	}
	
	$s .= ': <a href="#" title="'.$users.'">'.mysqli_num_rows($table).'</a>';
	return $s;
}


function findSubCategory($pid, &$a)
{
	global $cn;
	$sql = "select id from category where categoryId = ".$pid;
	$table = mysqli_query($cn, $sql);
	while($row = mysqli_fetch_assoc($table))
	{
		$a[] = $row["id"];
		findSubCategory($row["id"], $a);
	}
}
?>