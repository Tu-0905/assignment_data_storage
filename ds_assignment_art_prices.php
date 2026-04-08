<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);

?><html>
<head>
</head>
<body>

<p>This is a system for following art prices. The owner wishes to be able to record the last sale for various pieces of art they are interested in.</p> 

<p>NOTE: This is not a well designed database (at first), so don't use this as a model for your own databases. This is not the right way to implement an application, but works well enough for the purposes of this assignment.</p>

<p>General instructions: The code below is missing a lot of queries. By adding them, you can remove error messages and move deeper into the assignment. The more queries you can add and get to work, the better the grade. Easy. For a five, you need to get everything mostly right, for a three you need to get everything more or less right up until 13 and for a 1 you need to show that you can do the basic queries of the first handful of questions.</p>

<p>Each query should be added to variables called $query, which are used when the queries are ran. In PHP variables are more freeform than in C#, for example, but they can be identified by the $-sign in front of it. The queries are stored as strings and they need to be demarkated by quotation marks ("this is a string"). Two strings can be concatenated (meaning combined into one string) with a period ("this is a string"."this is also a string" becomes "this is a stringthis is also a string"). Some of the queries are already in place and you should note that $query variable is not always in the same place.</p>

<p>In some parts of the assignment, variable are received through forms. As these forms have the method GET (which you shouldn't use in this context in real life, but again, this is for the purposes of this assignment). This means that they can be found in the $_GET array. Arrays are associative in PHP. In other words, they are more flexible than in many other languages. You can use indexes other than strictly limited numbers. You can even use strings as keys. If a form returns the parameter player_id (which is set in a form by giving the input a name), you can access the parameter in code by using $_GET['player_id'], but if you read the code, you can see that in most cases these values have been moved to other variables, which you can use. You can combine these with strings same as above (meaning using a period for concatenation).</p>

<p>Be careful with quotation marks and apostrophies. By putting them into the wrong places or in the wrong order, you can easily break your application.</p>

<p>Running a PHP program is easy, if you have a web server (such as Apache as part of XAMPP) and a browser. By placing the file into the document root (C:/xampp/htdocs/ by default) and opening it from the browser (localhost/ds_assignment_art_prices.php or localhost:80/ds_assignment_art_prices.php). Use phpMyAdmin to create your database by opening it and using the Import functionality with the sql file you can find next to this on the Moodle page.</p>

<p>If you get stuck on a specific spot, you can comment it out and continue on the rest of the assignment, but note that 9-13 form a whole, which is needed to work properly in order to do any of the parts after it.</p>

<p>Use this link to load the page again, if you have used the form and the browser's address line includes unwanted parameters: <a href="ds_assignment_art_prices.php">Reload</a></p>

<?php

// otetaan yhteys tietokantaan / connect to the database
$connection = mysqli_connect('127.0.0.1', 'root', '', 'ds_assignment_art_prices');

?>

<br><br>1a. Fetch the names of all artists in the system
<br>Note: You won't need the primary key of the table at this stage, but include it in the result as it will be used later on

<?php

$query = "SELECT artist_id, artist_name FROM artist";

$artists = mysqli_query($connection, $query);
echo mysqli_error($connection);

echo "<br>";

if(!empty($artists))
{
	while($artist = mysqli_fetch_array($artists))
	{
		echo $artist['artist_name']."<br>";
	}
}

echo "<br>";

?>

<br><br>1b. Fetch the names of all buyers in the system
<br>Note: You won't need the primary key of the table at this stage, but include it in the result as it will be used later on

<?php

$query = "SELECT buyer_id, buyer_name FROM buyer";

$buyers = mysqli_query($connection, $query);
echo mysqli_error($connection);

echo "<br>";

if(!empty($buyers))
{
	while($buyer = mysqli_fetch_array($buyers))
	{
		echo $buyer['buyer_name']."<br>";
	}
}

echo "<br>";

?>


<br><br>2. Add a buyer using the variable obtained through the form below

<form method="GET" action="ds_assignment_art_prices.php">
Nimi / Name. <input name="buyer_name"><input type="submit">
</form>

<?php

if(isset($_GET['buyer_name']))
{
	$buyer_name = $_GET['buyer_name'];
	
	$query = "INSERT INTO buyer (buyer_name) VALUES ('$buyer_name')";
	
	mysqli_query($connection, $query);
	echo mysqli_error($connection);
}

?>


<br><br>3. Add a new sale by using the data from the form below
<br>NOTE: This won't work properly after 13, but if your query looks good, I'll believe that it's correct

<form method="GET" action="ds_assignment_art_prices.php">
	Price: <input name="amount">
	<select name="artist_id">
		<?php 
			if(!empty($artists))
			{
				$artists->data_seek(0);
				while($artist = mysqli_fetch_array($artists))
				{
					echo '<option value="'.$artist['artist_id'].'">'.$artist['artist_name'].'</option>';
				}
			}
		?>
	</select>
	<select name="buyer_id">
		<?php
			if(!empty($buyers))
			{
				$buyers->data_seek(0);
				while($buyer = mysqli_fetch_array($buyers))
				{
					echo '<option value="'.$buyer['buyer_id'].'">'.$buyer['buyer_name'].'</option>';
				}
			}
		?>
	</select>
	Name of piece: </select><input name="name_of_work">
	<input type="submit">
</form>

<?php

if(isset($_GET['amount']) AND isset($_GET['artist_id']) AND isset($_GET['name_of_work']) AND isset($_GET['buyer_id']))
{
	$amount = $_GET['amount'];
	$ref_artist = $_GET['artist_id'];
	$ref_buyer = $_GET['buyer_id'];
	$name_of_work = $_GET['name_of_work'];
	
	$query = "INSERT INTO sale (price, ref_artist, ref_buyer, name_of_work, sale_date) 
			VALUES ('$amount', '$ref_artist', '$ref_buyer', '$name_of_work', NOW())";

	mysqli_query($connection, $query);
	echo mysqli_error($connection);
}

?>

<br><br>4. Which artist made the most expensive work of art?

<?php

$query = "SELECT artist.artist_name 
          FROM sale 
          JOIN artist ON sale.ref_artist = artist.artist_id 
          ORDER BY sale.price DESC 
          LIMIT 1";

$result = mysqli_query($connection, $query);
echo mysqli_error($connection);

if(!empty($result))
{
	echo "<table>";
	while($row = mysqli_fetch_array($result))
	{
		echo "<tr><td>".$row['artist_name']."</td></tr>";
	}
	echo "</table>";
}

?>

<br><br>5. List buyers who have not made any purchases<br><br>

<?php

$query = "SELECT buyer.buyer_name 
          FROM buyer 
          LEFT JOIN sale ON buyer.buyer_id = sale.ref_buyer 
          WHERE sale.ref_buyer IS NULL";

$result = mysqli_query($connection, $query);

while($row = mysqli_fetch_array($result))
{
	echo $row['buyer_name']."<br>";
}

?>

<br><br>NOTE: The next three parts can be difficult. If you can't solve them, you can comment them out and continue to the next part.

<br><br>6. List all artists who's works were sold in the last full month

<?php

$query = "SELECT artist.artist_name, COUNT(sale.sale_id) AS total_sold 
          FROM artist 
          LEFT JOIN sale ON artist.artist_id = sale.ref_artist 
          GROUP BY artist.artist_id";

$result = mysqli_query($connection, $query);
echo mysqli_error($connection);
if(!empty($result))
{
	echo "<table>";
	while($row = mysqli_fetch_array($result))
	{
		echo "<tr><td>".$row['artist_name']."</td></tr>";
	}
	echo "</table>";
}

?>

<br><br>7. List all months in the system in order of sales made in that month, from highest to lowest, including the number of sales. Check the names of the rows for the result from the input below<br>

<?php

$query = "";

$result = mysqli_query($connection, $query);
echo mysqli_error($connection);

echo "<br>";

if(!empty($result))
{
	echo "<table>";

	while($row = mysqli_fetch_array($result))
	{
		echo "<tr><td>".$row['month']."</td><td>".$row['no_of_sales']."</td></tr>";
	}
	
	echo "</table>";
}


?>


<br><br>8. Who has sold most art?<br>
NOTE: This is purposefully very hard.<br>
NOTE: "Who" in this case is from the buyer table.<br>

<?php

$query = "";

$result = mysqli_query($connection, $query);

if(!empty($result))
{
	$row = mysqli_fetch_array($result);
	echo "<br>".$row['buyer_name']."<br>";
}

?>

<br><br>9a. Create a new table for the works of art named work_of_art (these are currently in the sales table). Infer the structure and the names for the fields from the parts below. Either do this in a way where the table isn't added everytime you reload the page or comment this out after the table has been created
<br>NOTE: In reality, you would also move the reference to the artist into the new table, but considering the damage this would do to the parts above, we won't be doing this, but that is bad design.

<?php

$query = "";

mysqli_query($connection, $query);
echo mysqli_error($connection);

?>

<br><br>10. Copy the names of the works of art from the sale table into the newly created table
<br>Note: Comment these out after doing this, unless you want the same names in the table multiple times (or, alternatively, find a workaround for this)

<?php

$query = "";

mysqli_query($connection, $query);
echo mysqli_error($connection);

?>

<br><br>11. Add a new field into the sale table for referencing the newly created table

<?php

$query = "";

mysqli_query($connection, $query);
echo mysqli_error($connection);

?>

<br><br>12. Match the names from the newly created table to the correct rows in the sale table. (You should comment this out as well, as it won't work after the next part.)

<?php

$query = "";

mysqli_query($connection, $query);
echo mysqli_error($connection);

?>


<br><br>13. Remove the now unneeded field from the sale table (comment this out as well)

<?php

$query = "";

mysqli_query($connection, $query);
echo mysqli_error($connection);

?>

<br><br>NOTE: The following won't be graded unless you have done 9-13 successfully.

<br><br>14. List all works of art which have been owned by the same buyer multiple times.<br>

<?php

$query = "";

$result = mysqli_query($connection, $query);
echo mysqli_error($connection);

echo "<br>";

if(!empty($result))
{
	while($row = mysqli_fetch_array($result))
	{
		echo $row['name_of_work']."<br>";
	}
}

echo "<br>";

?>

<br><br>15. Add columns for first and last names in the artist table. (NOTE: Comment these out after running them)

<?php

$query = "";

mysqli_fetch_array(mysqli_query($connection, $query));
echo mysqli_error($connection);

?>

<br><br>16. Copy first and last name of each artist into the newly created columns (you can assume all artists have exactly two names and comment this one out as well after running it)

<?php

$query = "";

mysqli_fetch_array(mysqli_query($connection, $query));
echo mysqli_error($connection);

?>

<br><br>17. Create a new table for auction house. Infer the structure from later parts (remember to include a primary key). Add the commented rows from below into the table and remember to comment out unnecessary parts after they are no longer needed


<?php

$query = "";

mysqli_query($connection, $query);

/*

mysqli_query($connection, "INSERT INTO auction_house (auction_house_name, auction_house_specialty) VALUES ('Lahti Auction House', 'newly created works')");
mysqli_query($connection, "INSERT INTO auction_house (auction_house_name, auction_house_specialty) VALUES ('Arvinen High Art', 'Classic Greek statues')");
mysqli_query($connection, "INSERT INTO auction_house (auction_house_name, auction_house_specialty) VALUES ('Helsinki Antiques', 'Rococo furniture')");

*/

?>

<br><br>18. Create a table, where auction houses can be linked to specific sales (check below for structure and remember to comment this out). 

<?php

$query = "";

mysqli_query($connection, $query);

?>

<br><br>19. Store category links to top categories with the information from the form below

<form method="GET" action="ds_assignment_art_prices.php">

<br>Auction house: <select name="auction_house_id">

<?php

$auction_houses = mysqli_query($connection, "SELECT * FROM auction_house");

while($auction_house = mysqli_fetch_array($auction_houses))
{
	echo "<option value=".$auction_house['auction_house_id'].">".$auction_house['auction_house_name']."</option>";
}

?>
</select>

<br>Sales: <select name="sale_id">

<?php

$sales = mysqli_query($connection, "SELECT * FROM sale, work_of_art WHERE ref_work_of_art=work_of_art_id");

while($sale = mysqli_fetch_array($sales))
{
	echo "<option value=".$sale['sale_id'].">".$sale['name_of_work']." (".$sale['sale_date'].")</option>";
}

?>
</select>
<input type="submit">
</form>

<?php

if(isset($_GET['sale_id']) AND isset($_GET['auction_house_id']))
{
	$sale_id = $_GET['sale_id'];
	$auction_house_id = $_GET['auction_house_id'];
	
	$query = "";

	mysqli_query($connection, $query);
}


?>

<br><br>20. Which auction house has been able to gain the highest jump in price percent-wise from one sale to the next
<br>NOTE: You will need to input some test data to figure this out

<?php

$query = "";

$result = mysqli_query($connection, $query);

if(!empty($result))
{
	$row = mysqli_fetch_array($result);
	echo $row['auction_house_name'];
}

?>

</body>
</html>