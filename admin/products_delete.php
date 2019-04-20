<?php

function productDelete($product_id) {

    include('./script/connect.php');

    $product_delete_query = 'DELETE FROM tbl_products WHERE product_id = :product_id';

    $product_delete_set = $pdo->prepare($delete_product_query);

    $product_delete_set->execute(

        array(
            ':product_id' => $product_id
        )
    );

    echo "Item Removed from the site"
}

$response = productDelete($_POST["product_id"]);

echo $response;

?>