<?php

function addProduct($image, $name, $price, $description, $category)
{
    try {
        //Plan things out...
        //1. Connect to the DB
        include 'connect.php';

        //2. Validate the uploaded file
        $file_type      = pathinfo($image['name'], PATHINFO_EXTENSION);
        $accepted_types = array('gif', 'jpg', 'jpe', 'jpeg', 'png');
        if (!in_array($file_type, $accepted_types)) {
            throw new Exception('Wrong file types!');
        }

        //3. Move the uploaded file around
        $target_path = '../images/' . $image['name'];
        if (!move_uploaded_file($image['tmp_name'], $target_path)) {
            throw new Exception('Failed to move uploaded file, check permission!');
        }

        $th_copy = '../images/TH_' . $cover['name'];
        //TODO:Generate the thumbnail in PHP...
        if (!copy($target_path, $th_copy)) {
            throw new Exception('Whoops, the copy failed!');
        }

        //4. Insert into DB (tbl_movies as well as tbl_mov_genre)
        $insert_product_query = 'INSERT INTO tbl_product(product_img, product_name, product_price, product_desc';
        $insert_product_query .= ' VALUES(:product_img, :product_name, :product_price, :product_desc';

        $insert_product  = $pdo->prepare($insert_product_query);
        $insert_result = $insert_product->execute(
            array(
                ':product_img'      => $image['name'],
                ':product_name'     => $title,
                ':product_price'    => $year,
                ':product_desc'     => $description,
            )
        );

        if (!$insert_result) {
            throw new Exception('Failed to insert the new movie!');
        }

        $last_id            = $pdo->lastInsertId();
        $update_category_query = 'INSERT INTO tbl_product_categories(product_id, category_id)';
        $update_category_query .= ' VALUES(:product_id, :category_id)';
        $update_category = $pdo->prepare($update_category_query);
        $update_category->execute(
            array(
                ':product_id' => $product_id,
                ':category_id'  => $category,
            )
        );

        if (!$update_category->rowCount()) {
            throw new Exception('Failed to set category!');
        }

        //5. If all of above works, redirect user to index.php
        redirect_to('index.php');

    } catch (Exception $e) {
        // Otherwise return a error message
        $error = $e->getMessage();
        return $error;
    }
}
