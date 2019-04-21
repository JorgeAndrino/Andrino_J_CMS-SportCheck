<?php
require_once 'scripts/config.php';
//confirm_logged_in();
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Welcome to Your Admin Panel</title>
</head>
<body>
	<h1>Dashboard</h1>
	<h2>Welcome Admin </h2>

	<nav>
		<ul>
			<li><a href="addproduct.php">Add Product</a></li>
		</ul>
		<br>
		<br>
		<br>
		<ul>
			<?php while ($row = $products->fetch(PDO::FETCH_ASSOC)) : ?>
       			<img src="../images/<?php echo $row['product_img']; ?>" alt="">
        			<div>
          				<h3><?php echo $row['product_name']; ?></h3>
          				<p><?php echo trim_length($row['product_description'], 100); ?></p>
          				<a href="admin_editproduct.php?product=<?php echo $row['product_id'] ?>">Edit</a>
          				<a href="admin_deleteproduct.php?delete=<?php echo $row['product_id'] ?>">Delete</a>
        			</div>
    		<?php endwhile; ?>
		</ul>
	<li><a href="scripts/logout.php">Sign Out</a></li>
	</nav>

</body>
</html>