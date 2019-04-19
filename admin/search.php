<?php

function searchFilter($requestSearch){

    include('script/connect.php');

    if (isset($requestSearch)){
        $requestSearch = htmlentities($requestSearch);

        $get_search_product = 'SELECT product_id, product_img, product_name, product_price FROM tbl_products WHERE product_name LIKE "%'.$requestSearch.'%"';

        $get_search_set = $pdo->prepare($get_search_product);

        $get_search_set->execute();

        $results = $get_search_set->fetchAll(PDO::FETCH_ASSOC);

        $filtered_products = json_encode($results);

        return $filtered_products;
    }
}

$response = searchFilter($_GET["requestSearch"]);

echo $response;

?>