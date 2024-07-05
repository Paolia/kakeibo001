<main>
    <div id="conf">
        <h2>以下の内容で登録します。よろしいですか？</h2>
    </div>

    <div id="confirm">
        <table>
            <tr>
                <td>項目：<?php echo $_POST["item"]; ?></td>
                <td>金額：<?php echo $_POST["amount"]; ?></td>
                <td>固定費・変動費：<?php echo $_POST["fix_or_var"]; ?></td>
                <td>分類：<?php echo $_POST["category"]; ?></td>
            </tr>
            <tr>
                <td>受益者：<?php echo $_POST["beneficiary"]; ?></td>
                <td>支払期日：<?php echo $_POST["deadline"]; ?></td>
                <td>支払い済み：<?php echo $_POST["already_paid"]; ?></td>
                <td>支払日：<?php echo $_POST["paid_on"]; ?></td>
            </tr>
            <tr>
                <td>支払元：<?php echo $_POST["paid_from"]; ?></td>
                <td>誰が払ったか：<?php echo $_POST["paid_by"]; ?></td>
                <td colspan="2">備考：<?php echo $_POST["note"]; ?></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <?php
                    echo
                        '<form id="form2" action="register.php" method="POST">
        <input type="hidden" name="year" value="' . $_POST["year"] . '">
        <input type="hidden" name="month" value="' . $_POST["month"] . '">
        <input type="hidden" name="item" value="' . $_POST["item"] . '">
        <input type="hidden" name="amount" value="' . $_POST["amount"] . '">
        <input type="hidden" name="fix_or_var" value="' . $_POST["fix_or_var"] . '">
        <input type="hidden" name="category" value="' . $_POST["category"] . '">
        <input type="hidden" name="beneficiary" value="' . $_POST["beneficiary"] . '">
        <input type="hidden" name="deadline" value="' . $_POST["deadline"] . '">
        <input type="hidden" name="already_paid" value="' . $_POST["already_paid"] . '">
        <input type="hidden" name="paid_on" value="' . $_POST["paid_on"] . '">
        <input type="hidden" name="paid_from" value="' . $_POST["paid_from"] . '">
        <input type="hidden" name="paid_by" value="' . $_POST["paid_by"] . '">
        <input type="hidden" name="note" value="' . $_POST["note"] . '">
        <button type="submit" id="registar">登録</button>
    </form>'
                        ?>
                    <?php

                    echo
                        '<form id="form_back" action="view_land.php" method="POST">
        <input type="hidden" name="year" value="' . $_POST["year"] . '">
        <input type="hidden" name="month" value="' . $_POST["month"] . '">
        <button type="submit" id="registar">戻る</button>
    </form>'
                        ?>
                </td>
                </td>
        </table>
    </div>
</main>