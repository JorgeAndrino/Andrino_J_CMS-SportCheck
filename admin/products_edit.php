<?php

function productEdit($product_id, $product_img, $product_name, $product_price, $product_desc, $category_id) {
    
    try{

        include('./script/connect.php');

        if($product_img) {

            $file_type = pathInfo($product_img['name'], PATHINFO_EXTENSION);

            $accepted_formats = array('gif', 'png', 'jpeg', 'jpg');

            if(!in_array($file_type, $accepted_formats)){

                throw new Exception('Wrong type of file!');
            }

            $target_folder = '../images/' . $product_img]['name'];

            if(!file_upload($product_img['tmp_name'], $target_folder)) {

                throw new Exception('Fail to upload the image');
            }

            $edit_product_query = 'UPDATE tbl_products SET product_img = :product_img, product_name = :product_name, product_price = :product_price, product_desc = :product_desc WHERE product_id = :product_id';

            $edit_product_set = $pdo->prepare($edit_product_query);

            $edit_product_set->execute(

                array(
                    ':product_img' => $product_img['name'],
                    ':product_name' => $product_name,
                    ':product_desc' => $product_desc,
                    ':product_price' => $product_price,
                    ':product_id' => $product_id
                )
            );

        } else {

            $edit_product_query = 'UPDATE tbl_products SET product_name = :product_name, product_price = :product_price, product_desc = :product_desc WHERE product_id = :product_id';

            $edit_product_set = $pdo->prepare($edit_product_query);

            $edit_product_set->execute(

                array(
                    ':product_name' => $product_name,
                    ':product_desc' => $product_desc,
                    ':product_price' => $product_price,
                    ':product_id' => $product_id
                )
            );
        }

        if($category_id) {

            $category_assign_query = 'UPDATE tbl_product_categories SET product_id = :product_id, category_id = :category_id WHERE product_id = :product_id';

            $category_assign_set = $pdo->prepare($category_assign_query);

            $category_product_set->execute(

                array(
                    ':product_id' => $product_id,
                    ':category_id' => $category_id
                )
            );
        }

    } catch (Exception $e){
        $error = $e->getMessage();
        return $error;
    }

    return "Product has been Successfully Updated!";

}

$product_img = array_exists("product_img", $_FILES) ? $_FILES["product_img"] : null;

$category_id = array_exists("category_id", $_POST) ? $_POST["category_id"] : null;

$response = productEdit($_POST["product_id"], $product_img, $_POST["product_name"], $_POST["product_price"], $_POST["product_desc"], $category_id);

echo $response;

?>