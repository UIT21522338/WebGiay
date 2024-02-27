

<style>
    .customer_list_container {
        margin-top: 60px;
    }

    .btn-add-customer-container {
        position: absolute;
        right: 0;
    }

    .customer_list {
        text-align: center;
    }

    .customer_list tr th {
        background-color: #ff5f17;
        color: white;
    }

    .customer_list tr td {
        background-color: white;
        font-weight: bold;
    }
    .bx-cart{
        font-size: 1.3em;
        color: black;
    }
    .bx-cart:hover{
        color:#ff5f17;
    }
    .bx-receipt{
        font-size: 1.3em;
        color: black;
    }
    .bx-receipt:hover{
        color:#ff5f17;
    }
</style>

<section class="customer customer-hnm tab-content" id="customer-section">
    <div class="text text-hnm">Khách hàng</div>
    <div class="customer_list_container">
        <table class="customer_list" border="1" style="border-collapse:collapse;width:100%">
            <tr>
                <th>ID</th>
                <th>Họ tên khách hàng</th>
                <th>Giới tính</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <!-- <th>Giỏ hàng</th> -->
                <th>Đơn mua</th>
            </tr>
            <?php
            $sql = "SELECT distinct khachhangid, hoten, gioitinh, diachi, tinhthanh,  quanhuyen,  phuongxa, sodt, email FROM khachhang ORDER BY khachhangid asc ";
            // SELECT  khachhangid ,  hoten ,  diachi ,  tinhthanh ,  quanhuyen ,  phuongxa ,  sodt ,  email ,  password ,  gioitinh  FROM  khachhang  WHERE 1
            $rs = $mysqli->query($sql);
            if ($rs->num_rows > 0) 
                {
                    while($row = $rs->fetch_row()) 
                    {   
                    
        ?>
            <tr>
                <td id="td_customerid" name="td_customerid"><?php echo $row[0]  ?></td>
                <td id="td_customername" name="td_customername"><?php echo $row[1]  ?></td>
                <td id="td_customersex" name="td_customersex"><?php echo $row[2]  ?></td>
                <td id="td_customeraddress" name="td_customeraddress"><?php echo $row[3].", ".$row[4].", ".$row[5].", ".$row[6] ?></td>
                <td id="td_customerphonenumber" name="td_customerphonenumber"><?php echo $row[7]?></td>
                <td id="td_customeremail" name="td_customeremail"><?php echo $row[8]?></td>
                <!-- <td><a href="carts_management.php?idcart=<?php echo $row[0]?>"><i class='bx bx-cart'></i></a></td> -->
                <td><a href="../orders/customer_orders_management.php?id=<?php echo $row[0] ?>"><i class='bx bx-receipt'></i></a></td>
            </tr>
        <?php
            }
        } 
        else {
            ?>
            <tr>
                <td colspan="8" >Chưa có dữ liệu khách hàng</td>
            </tr>

            <?php
        }
        ?>


        </table>

    </div>
</section>
