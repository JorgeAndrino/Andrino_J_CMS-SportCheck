<?php 
function fetchAll(){

    include('script/connect.php');

    $get_all_categories = 'SELECT * FROM tbl_categories';

    $get_all_set = $pdo->prepare($get_all_categories);

    $get_categories_set->execute();

    $results = $get_categories_set->fetchAll(PDO::FETCH_ASSOC);

    $categories_all = json_encode($results);

    $get_all_products = 'SELECT product_id, product_img, product_name, product_price FROM tbl_products';

    $get_products_set = $pdo->prepare($get_all_products);

    $get_products_set->execute();

    $results = $get_products_set->fetchAll(PDO::FETCH_ASSOC);

    $produtcs_all = json_encode($results);

    return [$categories_all, $produtcs_all];

}

$response = json_encode(fetchALL());

echo $response;

?>