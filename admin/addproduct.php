<?php
require_once 'scripts/config.php';
confirm_logged_in();

$tbl      = "tbl_category";
$tbl_2    = "tbl_products";
$category_list = getAll($tbl, $tbl_2);

if (isset($_POST['submit'])) {
    $image           = $_FILES['product_img'];
    $name            = $_POST['product_name'];
    $price           = $_POST['product_price'];
    $description     = $_POST['product_desc'];
    $category        = $_POST['category_name'];

    $result  = addProduct($image, $name, $price, $description, $category);
    $message = $result;
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add A Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <?php if (!empty($message)): ?>
        <p><?php echo $message; ?></p>
    <?php endif; ?>
    <form action="addproduct.php" method="post" enctype="multipart/form-data">
        <label for="image">Product Image:</label>
        <input type="file" name="image" value=""><br><br>

        <label for="name">Product Name:</label>
        <input type="text" name="name" value=""><br><br>

        <label for="price">Product Price:</label>
        <input type="price" name="price" value=""><br><br>

        <label for="description">Product Description:</label>
        <textarea name="description"></textarea><br><br>

        <select name="categoryList">
            <option>Please select a Category...</option>
            <?php while ($category = $category_list->fetch(PDO::FETCH_BOTH)): ?>
                <option value="<?php echo $category['category_id']; ?>">
                    <?php echo $category['category_name']; ?>
                </option>
            <?php endwhile; ?>
        </select><br><br>

        <button type="submit" name="submit">Add Product</button>
    </form>
</body>
</html>