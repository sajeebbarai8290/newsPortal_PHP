<a href="?p=news_images_new">New News Image</a><br><hr><br>
<?php
$sql = "select ni.id, ni.title, p.title as news, ni.image, ni.dateTime
		from newsImages as ni
		left join pages as p on ni.newsId = p.id";


$table = mysqli_query($cn, $sql);

print "<table class=\"table-responsive\">";
print "<tr><th>Id</th><th>Title</th><th>News</th><th>Image</th><th>DateTime</th></tr>";
while($row = mysqli_fetch_assoc($table))
{
	print "<tr>";
	print "<td>".htmlentities($row["title"])."</td>";
	print "<td>".htmlentities($row["news"])."</td>";
	print '<td><img src="uploads/newsImages/'.$row["id"].'_'.htmlentities($row["image"]).'" height="120px"/></td>';
	print '<td>'.htmlentities($row["dateTime"]).'</td>';
	print "</tr>";
}
print "</table>";

?>

