<?php
// 受信データを確認。
//var_dump($_POST);
//exit();
include ('inc/functions.php');
$pdo = connect_to_db('kuratomi_kakeibo');
// POSTデータ確認
if (
    !isset($_POST['year']) || $_POST['year'] === '' ||
    !isset($_POST['month']) || $_POST['month'] === '' ||
    !isset($_POST['item']) || $_POST['item'] === '' ||
    !isset($_POST['amount']) || $_POST['amount'] === '' ||
    !isset($_POST['fix_or_var']) || $_POST['fix_or_var'] === '' ||
    !isset($_POST['category']) || $_POST['category'] === '' ||
    !isset($_POST['beneficiary']) || $_POST['beneficiary'] === '' ||
    !isset($_POST['deadline']) || $_POST['deadline'] === '' ||
    !isset($_POST['already_paid']) || $_POST['already_paid'] === '' ||
    !isset($_POST['paid_on']) || $_POST['paid_on'] === '' ||
    !isset($_POST['paid_from']) || $_POST['paid_from'] === '' ||
    !isset($_POST['paid_by']) || $_POST['paid_by'] === ''
) {
    exit('ParamError');
}

// $_POSTより各項目データを取得
$year = $_POST['year'];
$month = $_POST['month'];
$item = $_POST['item'];
$amount = $_POST['amount'];
$fix_or_var = $_POST['fix_or_var'];
$category = $_POST['category'];
$beneficiary = $_POST['beneficiary'];
$deadline = $_POST['deadline'];
$already_paid = $_POST['already_paid'];
$paid_on = $_POST['paid_on'];
$paid_from = $_POST['paid_from'];
$paid_by = $_POST['paid_by'];
$note = $_POST['note'];

// DB接続のための項目設定
// ちなみに3306がMySQLの標準的なポートだそうです。
/*
$dbn = 'mysql:dbname=kuratomi_kakeibo;charset=utf8mb4;port=3306;host=localhost';
$user = 'root';
$pwd = '';

// DB接続（コピペ）
try {
    $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
    echo json_encode(["db error" => "{$e->getMessage()}"]);
    exit();
}
*/

// SQL作成&実行
$table_name = 'expenses_' . $year . $month;

$sql = 'INSERT INTO ' . $table_name . ' (id, term, item, amount, fix_or_var, category, beneficiary, deadline, already_paid, paid_on, paid_from, paid_by, note, last_updated_on) VALUES  (NULL, :term, :item, :amount, :fix_or_var, :category, :beneficiary, :deadline, :already_paid, :paid_on, :paid_from, :paid_by, :note, now());';

// phpMyAdminのSQLウィンドウで確認後コピペ＆バインド関数設定
$stmt = $pdo->prepare($sql);

// バインド変数を設定、毎回同じだそうなので、これもコピペ
$stmt->bindValue(':term', $term, PDO::PARAM_STR);
$stmt->bindValue(':item', $item, PDO::PARAM_STR);
$stmt->bindValue(':amount', $amount, PDO::PARAM_STR);
$stmt->bindValue(':fix_or_var', $fix_or_var, PDO::PARAM_STR);
$stmt->bindValue(':category', $category, PDO::PARAM_STR);
$stmt->bindValue(':beneficiary', $beneficiary, PDO::PARAM_STR);
$stmt->bindValue(':deadline', $deadline, PDO::PARAM_STR);
$stmt->bindValue(':already_paid', $already_paid, PDO::PARAM_STR);
$stmt->bindValue(':paid_on', $paid_on, PDO::PARAM_STR);
$stmt->bindValue(':paid_from', $paid_from, PDO::PARAM_STR);
$stmt->bindValue(':paid_by', $paid_by, PDO::PARAM_STR);
$stmt->bindValue(':note', $note, PDO::PARAM_STR);

// SQL実行（実行に失敗すると `sql error ...` が出力される）
try {
    $status = $stmt->execute();
} catch (PDOException $e) {
    echo json_encode(["sql error" => "{$e->getMessage()}"]);
    exit();
}

// 入力トップページに戻る
header('Location: view_land.php', true, 307);
exit();
?>