<?php

$db_dsn = array(
    'host'    => 'localhost',
    'dbname'  => 'db_cms',
    'charset' => 'utf8',
);

$dsn = 'mysql:' . http_build_query($db_dsn, '', ';');

// Set up connection credentials
$db_user = 'root';
$db_pass = '';

// Check connection
try {
    $pdo = new PDO($dsn, $db_user, $db_pass);
} catch (PDOException $exception) {
    echo 'Connection Error: ' . $exception->getMessage();
    exit();
}
