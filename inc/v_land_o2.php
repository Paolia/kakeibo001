<?php
// 接続確認
// var_dump($_POST);
// exit() 

// テーブル名作成 
$expense_table = 'expenses_' . $_POST['year'] . $_POST['month'];

// モジュール読み込み 
include ('functions.php');
$pdo = connect_to_db();
//$sql='SELECT * FROM todo_table ORDER BY deadline ASC' ; 
$sql = 'SELECT 1 FROM ' . $expense_table . ' Limit 1';
$stmt = $pdo->prepare($sql);

/*
try {
$status = $stmt->execute();
} catch (PDOException $e) {
$sql = 'CREATE TABLE ' . $expense_table . ' LIKE expenses_tmpl';
$stmt = $pdo->prepare($sql);
$status = $stmt->execute();
//echo json_encode(["sql error" => "{$e->getMessage()}"]);
//exit();
}*/

$status = $stmt->execute();
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

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$output = "
    <tr>
        <th>何月分</td>
        <th>項目</td>
        <th>金額</td>
        <th>固定費・変動費</td>
        <th>分類</td>
        <th>受益者</td>
        <th>支払期日</td>
        <th>支払い済み<br>（１なら済）</td>
        <th>支払日</td>
        <th>支出元</td>
        <th>誰が払ったか</td>
        <th>備考</td>
        <th>最終更新日</td>
    </tr>";
foreach ($result as $record) {
    $trm = strtotime($record["term"]);
    $trm = date('m月分', $trm);
    $trm2 = ltrim($trm, '0');
    $dl = strtotime($record["deadline"]);
    $dl = date('m/d', $dl);
    $dl2 = ltrim($dl, '0');
    $po = strtotime($record["paid_on"]);
    $po = date('m/d', $po);
    $po2 = ltrim($po, '0');
    $luo = strtotime($record["last_updated_on"]);
    $luo2 = date('m/d', $luo);
    $output .= "
    <tr>
        <td>{$trm2}</td>
        <td>{$record["item"]}</td>
        <td>{$record["amount"]}円</td>
        <td>{$record["fix_or_var"]}</td>
        <td>{$record["category"]}</td>
        <td>{$record["beneficiary"]}</td>
        <td>{$dl2}</td>
        <td>{$record["already_paid"]}</td>
        <td>{$po2}</td>
        <td>{$record["paid_from"]}</td>
        <td>{$record["paid_by"]}</td>
        <td>{$record["note"]}</td>
        <td>{$luo2}</td>
    </tr>
    ";
}
?>
<main>
    <table class="kakeibo_table">
        <?= $output ?>
    </table>

    <form action="todo_create.php" method="POST" id="add_records">
        <fieldset>
            <legend>項目追加</legend>
            <table>
                <tr>
                    <td>
                        何月分: <input type="date" name="term">
                    </td>
                    <td>
                        項目: <input type="text" name="item">
                    </td>
                    <td>
                        金額: <input type="text" name="amount">
                    </td>
                </tr>
                <tr>
                    <td>
                        固定費・変動費
                        <select name="fix_or_var" id="fix_or_var">
                            <option value="fix">固定費</option>
                            <option value="var">変動費</option>
                        </select>
                    </td>
                    <td>
                        分類
                        <select name="category" id="category">
                            <option value="fix">食費</option>
                            <option value="var">衣料費</option>
                            <option value="fix">光熱費</option>
                            <option value="var">教育費</option>
                            <option value="var">医療・美容費</option>
                            <option value="fix">遊興費・雑費</option>
                            <option value="fix">通信費</option>
                            <option value="var">交通費</option>
                            <option value="fix">住宅費</option>
                            <option value="var">税金</option>
                        </select>
                    </td>
                    <td>
                        受益者
                        <select name="fix_or_var" id="fix_or_var">
                            <option value="fix">みんな</option>
                            <option value="var">たみお</option>
                            <option value="fix">オリガ</option>
                            <option value="var">まりや</option>
                            <option value="fix">あんな</option>
                            <option value="var">特になし</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        支払期日: <input type="date" name="deadline">
                    </td>
                    <td>
                        支払い済み
                        <select name="fix_or_var" id="fix_or_var">
                            <option value="1">済</option>
                            <option value="0">未払い</option>
                        </select>
                    </td>
                    <td>
                        支払日: <input type="date" name="deadline">
                    </td>
                </tr>
                <tr>
                    <td>
                        支払元
                        <select name="fix_or_var" id="fix_or_var">
                            <option value="fix">口座引き落とし</option>
                            <option value="fix">生活費</option>
                            <option value="var">たみお</option>
                            <option value="fix">オリガ</option>
                            <option value="var">まりや</option>
                            <option value="fix">あんな</option>
                        </select>
                    </td>
                    <td>
                        誰が払ったか
                        <select name="fix_or_var" id="fix_or_var">
                            <option value="var">たみお</option>
                            <option value="fix">オリガ</option>
                            <option value="var">まりや</option>
                            <option value="fix">あんな</option>
                        </select>
                    </td>
                    <td>
                        備考: <textarea id="note" name="note" rows="3" cols="25"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <button>submit</button>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</main>