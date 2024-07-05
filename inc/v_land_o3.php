<?php

// テーブル名作成 
$expense_table = 'expenses_' . $_POST['year'] . $_POST['month'];

// モジュール読み込み 
include ('functions.php');
$pdo = connect_to_db();
$sql = 'SELECT 1 FROM ' . $expense_table . ' Limit 1';
$stmt = $pdo->prepare($sql);

// $status = $stmt->execute();
/*
if ($status == true) {
    $sql = 'SELECT * FROM ' . $expense_table . ' ORDER BY id ASC';
    $stmt = $pdo->prepare($sql);
    $status = $stmt->execute();
} else {
    //$sql = 'CREATE TABLE ' . $expense_table . ' LIKE expenses_tmpl';
    //$sql = 'CREATE TABLE expenses_202407 (SELECT * FROM expenses_202406)';
    $sql = 'CREATE TABLE expenses_202806 LIKE expenses_tmpl';
    $stmt = $pdo->prepare($sql);
    $status = $stmt->execute();
}
*/

try {
    $status = $stmt->execute();
} catch (PDOException $e) {
    $sql = 'CREATE TABLE ' . $expense_table . ' LIKE expenses_tmpl';
    $stmt = $pdo->prepare($sql);
    $status = $stmt->execute();
    //echo json_encode(["sql error" => "{$e->getMessage()}"]);
//exit();
}

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<main>

</main>