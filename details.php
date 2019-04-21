<?php require_once 'admin/scripts/config.php';
if (isset($_GET['id'])) {
    $tbl     = 'tbl_product';
    $col     = 'product_id';
    $id      = $_GET['id'];
    $results = getSingle($tbl, $col, $id);
} else {
    echo 'Missing Product ID';
    exit;
}
?>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Movie Details</title>
</head>
<body>
	<?php include 'templates/header.php'; ?>

	<?php while ($row = $results->fetch(PDO::FETCH_ASSOC)) : ?>
		<div>
			<img src="images/<?php echo $row['product_img']; ?>" alt="">	
			<h2>Product Name: <?php echo $row['movies_name']; ?></h2>
			<p>Product Price: <?php echo $row['movies_year']; ?></p>
			<p>Product Description: <?php echo $row['product_desc']; ?></p>
		</div>
	<?php endwhile; ?>
	<?php include 'templates/footer.php'; ?>
</body>
</html>