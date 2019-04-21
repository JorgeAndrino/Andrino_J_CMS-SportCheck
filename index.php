<?php require_once 'admin/scripts/config.php';

if (isset($_GET['filter'])) {
    $tbl     = 'tbl_product';
    $tbl_2   = 'tbl_categories';
    $tbl_3   = 'tbl_product_categories';
    $col     = 'product_id';
    $col_2   = 'category_id';
    $col_3   = 'category_name';
    $filter  = $_GET['filter'];
    $results = filterResults($tbl, $tbl_2, $tbl_3, $col, $col_2, $col_3, $filter);
} else {
    $results = getAll('tbl_products');
}
?>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Sport Check</title>
</head>
<body>
	<?php include 'templates/header.php'; ?>

	<?php while ($row = $results->fetch(PDO::FETCH_ASSOC)) : ?>
		<div>
			<img src="images/<?php echo $row['product_img']; ?>" alt="">	
			<h2><?php echo $row['product_name']; ?></h2>
			<h4><?php echo $row['product_price']; ?></h4>
			<p><?php echo $row['product_desc']; ?></p>
		</div>
	<?php endwhile; ?>
	<?php include 'templates/footer.php'; ?>
</body>
</html>