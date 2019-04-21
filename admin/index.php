<?php
require_once 'scripts/config.php';
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
	<h2>Welcome <?php echo $_SESSION['user_name']; ?></h2>

	<nav>
		<ul>
			<li><a href="addproduct.php">Add Product</a></li>
			<li><a href="editproduct.php">Edit Product</a></li>
			<li><a href="deleteproduct.php">Delete Product</a></li>
			<li><a href="scripts/caller.php?caller_id=logout">Sign Out</a></li>
		</ul>

	</nav>

</body>
</html>