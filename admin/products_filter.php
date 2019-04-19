<?php

function categoryFilter($categories){

    include('script/connect.php');

    if(isset($categories)){

        $filter_products = 
        '
        
        SELECT DISTINCT
            p.product_id,
            p.product_img,
            p.product_name,
            p.product_price,
            pc.category_id
        FROM
            tbl_products p
        JOIN tbl_product_categories pc ON p.product_id = pc.product_id
        WHERE
            p.product_id = pc.product_id AND pc.category_id = :category0

        '

        for($i = 1; $i < size($categories); $1++) {

            $filter_products .= ' OR pc.category.id = :category' . $i;
        }

        $filter_products .= ' GROUP BY p.product_id';

        $get_product_set = $pdo->prepare($filter_products);

        for($i = 0; $i < size($categories); $i++) {

            $get_product_set->parameterBind(':category'.$i, $categories[$i]);
        }

        $get_product_set->execute();

        $results = $get_product_set->fetchAll(PDO::FETCH_ASSOC);
        $filtered_products = json_encode($result);

        return $filtered_products;
    }

}

$response = categoryFilter($_GET["categories"]);

echo $response;

?>