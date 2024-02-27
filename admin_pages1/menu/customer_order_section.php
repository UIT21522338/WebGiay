
<style>
    .customer_order_list_container {
        margin-top: 60px;
    }

    .customer_order_list {
        text-align: center;
    }

    .customer_order_list tr th {
        background-color: #ff5f17;
        color: white;
    }

    .customer_order_list tr td {
        background-color: white;
        font-weight: bold;
    }
    .bx-receipt{
        font-size: 1.3em;
        color: black;
    }
    .bx-receipt:hover{
        color:#ff5f17;
    }
</style>
<section class="home home-hnm" id="customer-order-section">
    <div class="text text-hnm">Đơn hàng của khách</div>
    <div class="customer_order_list_container">
        <table class="customer_order_list" border="1" style="border-collapse:collapse;width:100%">
            <tr>
                <th>ID đơn hàng</th>
                <th>Ngày đặt hàng</th>
                <th>Hình thức thanh toán</th>
                <th>ID mã giảm giá</th>
                <th>Tổng tiền</th>
                <th>Chi tiết</th>
            </tr>
            <?php
                // include ('../../config/config.php');
                // SELECT `thanhtoanid`, `khachhangid`, `ngayorder`, `magiamgiaid`, `tongtien`, `hinhthucthanhtoan` FROM `thanhtoan` WHERE 1
                $sql = "SELECT thanhtoanid, ngayorder, hinhthucthanhtoan, magiamgiaid, tongtien FROM thanhtoan WHERE khachhangid = '$_GET[id]'; ";
                $rs = $mysqli->query($sql);
                if($rs->num_rows > 0)
                {
                    while($row = $rs->fetch_row())
                    {

                    
            ?>
            <tr>
                <td id="id_customer_order_list_idorder" name="id_customer_order_list_idorder"><?php echo $row[0] ?></td>
                <td id="id_customer_order_list_orderdate" name="id_customer_order_list_orderdate"><?php echo $row[1] ?></td>
                <td id="id_customer_order_list_purchasetype" name="id_customer_order_list_purchasetype"><?php echo $row[2] ?></td>
                <td id="id_customer_order_list_idpromotion" name="id_customer_order_list_idpromotion"><?php echo $row[3] ?></td>
                <td id="id_customer_order_list_tongtien" name="id_customer_order_list_tongtien"><?php echo number_format($row[4], 0, '', '.')  ?>₫</td>
                <td><a href="./order_detail.php?thanhtoanid=<?php echo $row[0] ?>"><i class='bx bx-receipt'></i></a></td>
            </tr>

            <?php
                }
            }else
            {

            ?>
            <tr>
                <td colspan="6" >Khách hàng chưa có hóa đơn</td>
            </tr>
            <?php
            }
            ?>
        </table>
    </div>
</section>