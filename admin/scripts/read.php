<?php

function getAll($tbl)
{
    include 'connect.php';
    $queryAll = 'SELECT * FROM ' . $tbl;

    $runAll = $pdo->query($queryAll);

    if ($runAll) {
        return $runAll;
    } else {
        $error = 'There was a problem';
        return $error;
    }
}

function filterResults($tbl, $tbl_2, $tbl_3, $col, $col_2, $col_3, $filter)
{
    include 'connect.php';
    $queryAll = 'SELECT * FROM ' .$tbl.' as a, ';
    $queryAll.= $tbl2.' as b, ';
    $queryAll.= $tbl3.' as c ';
    $queryAll.= 'WHERE a.' .$col.' = c.'.$col;
    $queryAll.= ' AND b.' .$col2.' = c.'.$col2;
    $queryAll.= ' AND b.' .$col3.' = "'.$filter.'"';

    // echo $queryAll;exit;

    $runAll = $pdo->query($queryAll);

    if ($runAll) {
        return $runAll;
    } else {
        $error = 'There was a problem';
        return $error;
    }
}

function getSingle($tbl, $col, $value)
{
    include 'connect.php';

    $query = 'SELECT * FROM ' . $tbl . ' WHERE ' . $col . '=' . $value;

    $runQuery = $pdo->query($query);
    if ($runQuery) {
        return $runQuery;
    } else {
        $error = 'There was a problem';
        return $error;
    }
}
