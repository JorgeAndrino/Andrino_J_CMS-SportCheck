<?php
require_once 'scripts/config.php';
confirm_logged_in();

$user_tbl = 'tbl_user';
$users    = getAll($user_tbl);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Delete Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <h2>Which Product Will Have To Go?</h2>
    <?php while ($product = $products->fetch(PDO::FETCH_ASSOC)): ?>
        <?php echo $product['product_name']; ?>
        <a href="scripts/caller.php?caller_id=delete&id=<?php echo $user['product_id']; ?>">Delete</a>
        <br>
    <?php endwhile; ?>
</body>
</html>