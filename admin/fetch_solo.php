<?php

function soloFetch($product_id) {

    include('script/connect.php');

    if (isset($product_id)) {

        $get_solo_product =
        '
        SELECT
            p.product_id,
            p.product_img,
            p.product_name,
            p.product_price,
            p.product_desc
        FROM
            tbl_products p
        WHERE
            p.product_id = :product_id
        ';

        $get_product_set = $pdo->prepare($get_solo_product);

        $get_product_set->execute(

            array(

                ':product_id' => $product_id
            )
        );

        $results = $get_product_set->fetchAll(PDO::FETCH_ASSOC);

        $solo_products = json_encode($results);

        return $solo_products;
    }
}

$response = soloFetch($_GET["product_id"]);

echo $response;

?>