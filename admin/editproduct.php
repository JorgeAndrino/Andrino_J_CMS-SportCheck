<?php
require_once 'scripts/config.php';
confirm_logged_in();

//How do we pull the current user's info?

$id             = $_SESSION['product_id'];
$tbl            = 'tbl_products';
$col            = 'product_id';
$found_product_set = getSingle($tbl, $col, $id);

if (isset($_POST['submit'])) {
    $name        = trim($_POST['product_name']);
    $price       = trim($_POST['product_price']);
    $description = trim($_POST['product_desc']);
    $image       = trim($_POST['product_img']);

    //Validation??
    if (empty($name) || empty($price) || empty($description) || empty($image)) {
        $message = 'Please fill the required fields!';
    } else {
        //Edit 
        $result  = editProduct($id, $name, $price, $description, $image);
        $message = $result;
    }
}

if (is_string($found_product_set)) {
    $messsage = 'Failed to get user info!';
}

?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Edit Product</title>
</head>
<body>
	<h2>Edit Product</h2>
	<?php if (!empty($message)): ?>
		<p><?php echo $message; ?></p>
	<?php endif; ?>
	<?php if ($found_product = $found_product_set->fetch(PDO::FETCH_ASSOC)): ?>
		<form action="editproduct.php" method="post">
			<label for="name">Name:</label>
			<input type="text" name="name" value="<?php echo $found_product['product_name']; ?>" id="name"><br><br>

			<label for="price">Price:</label>
			<input type="text" name="price" value="<?php echo $found_product['product_price']; ?>" id="price"><br><br>

			<label for="description">Description:</label>
			<input type="text" name="description" value="<?php echo $found_product['product_desc']; ?>" id="description"><br><br>

			<label for="image">Image:</label>
			<input type="file" name="image" value="<?php echo $found_product['product_img']; ?>" id="image"><br><br>

			<button type="submit" name="submit">Edit Product</button>
		</form>
	<?php endif; ?>
</body>
</html>
