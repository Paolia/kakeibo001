<?php

// DB接続用関数
function connect_to_db()
{
    $dbn = 'mysql:dbname=kuratomi_kakeibo;charset=utf8mb4;port=3306;host=localhost';
    $user = 'root';
    $pwd = '';

    try {
        return new PDO($dbn, $user, $pwd);
    } catch (PDOException $e) {
        exit('dbError:' . $e->getMessage());
    }
}
