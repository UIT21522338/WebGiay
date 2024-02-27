
<style>
    .div_cart_detail {
        max-width: 500px;
        width: 100%;
    }

    .text-hnm {
        font-size: 1.5em;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .cart_list_container {
        margin-top: 60px;
    }

    .cart_list {
        text-align: center;
    }

    .cart_list tr th {
        background-color: #ff5f17;
        color: white;
    }

    .cart_list tr td {
        background-color: white;
        font-weight: bold;
    }
</style>
<section class="cart cart-hnm tab-content" id="cart-section">
    <div id="div_cart_detail">
        <div class="text text-hnm">Chi tiết giỏ hàng</div>
        <div class="cart_list_container">
            <table class="cart_list" border="1" style="border-collapse:collapse;width:100%;">
                <tr>
                    <th>STT</th>
                    <th>PROCOLORID</th>
                    <th>Kích thước</th>
                    <th>Số lượng</th>
                </tr>
                <?php
                    $sql = "SELECT productcolorid, size, soluong from giohangct where khachhangid = '$_GET[idcart]';";
                    $rs = $mysqli->query($sql);
                    
                    if($rs ->num_rows > 0)
                    {
                        $stt = 0;
                        while($row = $rs->fetch_row()){
                            $stt += 1;
                ?>
                <tr>
                    <td id="td_cart_productord" name="td_cart_productord"><?php echo $stt ?></td>
                    <td id="td_cart_procolorid" name="td_cart_procolorid"><?php echo $row[0] ?></td>
                    <td id="td_cart_productsize" name="td_cart_productsize"><?php echo $row[1] ?></td>
                    <td id="td_cart_productquantity" name="td_cart_productquantity"><?php echo $row[2] ?></td>
                </tr>
                <?php
                        }
                    }else
                    {
                ?>
                <tr>
                    <td colspan="4">Chưa có sản phẩm trong giỏ hàng</td>
                </tr>
                <?php
                    }
                ?>
            </table>
        </div>
    </div>
</section>