<?php
require_once 'scripts/config.php';

$products = getAll('tbl_products');

confirm_logged_in();
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
			<?php while ($row = $products->fetch(PDO::FETCH_BOTH)) : ?>
       			<img src="../images/<?php echo $row['product_img']; ?>" alt="">
        			<div>
          				<h3><?php echo $row['product_name']; ?></h3>
          				<p><?php echo $row['product_desc']; ?></p>
          				<a href="editproduct.php?product=<?php echo $row['product_id'] ?>">Edit</a>
          				<a href="deleteproduct.php?delete=<?php echo $row['product_id'] ?>">Delete</a>
        			</div>
    		<?php endwhile; ?>
		</ul>
	<li><a href="scripts/caller.php?caller_id=logout">Sign Out</a></li>
	</nav>

</body>
</html>