<?php

function sessionTest($user_id, $user_token) {

    require('../script/connect.php');

    $test_session_query = 'SELECT user_token FROM tbl_users WHERE user_id = :user_id';

    $test_session_set = $pdo->prepare($test_session_query);

    $test_session_set->execute(

        array(

            ':user_id' => $user_id
        )
    );

    $result = $$check_session_set->fetchAll(PDO::FETCH_ASSOC);

    id($results[0]['user_token'] != $user_token) {

        return false;
    } else {

        return true;
    }
}

$response = sessionTest($_POST['user_id'], $_POST['user_token']);

echo $response;

?>