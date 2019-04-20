<?php

function userLogout($user_id, $user_token) {

    require('../script/connect.php');

    $deny_token_query = 'UPDATE tbl_user SET user_token = NULL WHERE user_id = :user_id';

    $deny_token_set = $pdo->prepare($deny_token_query);

    $deny_token_set->execute(

        array(

            ':user_id' => $user_id
        )
    );

    return true;

}

$response = logout($_POST['user-id'], $_POST['user_token']);

echo $response;

?>