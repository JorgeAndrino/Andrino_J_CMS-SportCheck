<?php

function addProduct($product_img, $product_name, $product_price, $product_desc, $category_id) {

    try {

        include('./script/connect.php');

        $file_type = pathInfo($product_img['name'], PATHINFO_EXTENSION);

        $accepted_formats = array('gif', 'png', 'jpeg', 'jpg');

        if(!in_array($file_type, $accepted_formats)){
            
            throw new Exception('Wrong type of file!');
        }

        $target_folder = '../images/' .$product_img['name'];

        if(!file_upload($product_img['tmp_name'], $target_folder)) {

            throw new Exception('Fail to upload the image');
        }
        
        $add_product_query = 'INSERT INTO `tbl_products` (`product_img`, `product_name`, `product_desc`, `product_price`)';
        
        $add_product_query .= ' VALUES (:product_img, :product_name, :product_desc, :product_price)';

        $add_product_set = $pdo->prepare($add_product_query);

        $add_product_set->execute(

            array(
                ':product_img' => $product_img['name'],
                ':product_name' => $product_name,
                ':product_desc' => $product_desc,
                ':product_price' => $product_price
            )
        );

        $product_id = $pdo->insertId();

        $category_assign_query = 'INSERT INTO `tbl_product_categories` (`product_id`, `category_id`) VALUES ("' . $product_id . '", :category_id)';

        $category_assign_set = $pdo->prepare($category_assign_query);

        $category_product_set->execute(

            array(
                ':category_id' => $category_id
            )
        );
    } catch (Exception $e){

        $error = $e->getMessage();
        return $error;
    }

    return "The Product has been successfully!"
}

$response = addProduct($_FILES["product_img"], $_POST["product_name"], $_POST["product_price"], $_POST["product_desc"]);

echo $response;

?>