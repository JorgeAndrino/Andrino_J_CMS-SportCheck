<?php

function login($user_email, $user_password){

    require('../script/connect.php');

    $check_exist_query = 'SELECT COUNT(*) FROM tbl_users WHERE user_email = :user_email';  
    $check_user_set = $pdo->prepare($check_exist_query);
    $check_user_set->execute(
        array(
            ':user_email' => $user_email
            )
    );

    if(($check_user_set->fetchColumn())>0) {

        $get_user_query = 'SELECT * FROM tbl_users WHERE user_email = :user_email AND user_password = :user_password';
        $get_user_set = $pdo->prepare($get_user_query);
        
        $get_user_set->execute(
            array(
                ':user_email' => $user_email,
                ':user_password' => $user_password
            )
        );

        while($found_user = $get_user_set->fetch(PDO::FETCH_ASSOC)){
            $id = $found_user['user_id'];
            $_SESSION['current_user'] = $found_user;
            $message = "Welcome!";
        }

        if(empty($id)) {
            $message = "Fail To Login, Please Try Again";
            return json_encode($message);
        } 

    } else {
        $message = 'Fail To Login, Please Try Again';
        return json_encode($message);
    }

$response = login($_POST["user_email"], $_POST["user_password"]);

echo $response;

?>
