<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .order_list_container {
            margin-top: 60px;
        }

        .order_list {
            text-align: center;
        }

        .order_list tr th {
            color: white;
        }

        .order_list tr td {
            font-weight: bold;
        }

        .order_list th {
            background-color: #ff5f17;
        }

        .bx-receipt {
            font-size: 1.3em;
            color: black;
        }

        .bx-receipt:hover {
            color: #ff5f17;
        }
    </style>
</head>

<body>
    <?php
    $sql_lietke_danhmuc_dh = "SELECT thanhtoanid,khachhangid,DATE_FORMAT(ngayorder, '%d/%m/%Y') AS ngayorder,hinhthucthanhtoan,magiamgiaid,tongtien,trangthai
                        FROM thanhtoan tt";
    $query_lietke_danhmuc_dh = $mysqli->query($sql_lietke_danhmuc_dh);
    ?>
    <section class="home home-hnm" id="order-section">
        <div class="text text-hnm">Đơn hàng</div>
        <div class="order_list_container">
            <input class="form-control mb-4" id="tableSearch" type="text" placeholder="Tìm kiếm">
            <table class="table table-bordered table-striped product_list order_list" border="1" style="border-collapse:collapse;width:100%">
                <thead>
                    <th>ID đơn hàng</th>
                    <th>ID khách hàng</th>
                    <th>Ngày đặt hàng</th>
                    <th>Hình thức thanh toán</th>
                    <th>ID mã giảm giá</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Chi tiết</th>
                </thead>
                <?php
                while ($row = mysqli_fetch_array($query_lietke_danhmuc_dh)) {
                    $trangthai = $row['trangthai'];
                    $trangthaiStyle = 'background-color: white';

                    if ($trangthai == "Đã xác nhận") {
                        $trangthaiStyle = "background-color: white";
                    } else if ($trangthai == "Chờ xác nhận") {
                        $trangthaiStyle = "background-color: #CCEABB";
                    }
                ?>
                    <tbody id="myTable">
                        <tr style="<?php echo $trangthaiStyle; ?>">
                            <td id="id_order_list_idorder" name="id_order_list_idorder"> <?php echo $row['thanhtoanid']; ?> </td>
                            <td id="id_order_list_idcustomer" name="id_order_list_idcustomer"> <?php echo $row['khachhangid']; ?> </td>
                            <td id="id_order_list_orderdate" name="id_order_list_orderdate"> <?php echo $row['ngayorder']; ?> </td>
                            <td id="id_order_list_purchasetype" name="id_order_list_purchasetype"> <?php echo $row['hinhthucthanhtoan']; ?> </td>
                            <td id="id_order_list_idpromotion" name="id_order_list_idpromotion"> <?php echo $row['magiamgiaid']; ?> </td>
                            <td id="id_order_list_tongtien" name="id_order_list_tongtien"> <?php echo $row['tongtien']; ?>₫</td>
                            <td id="id_order_list_trangthai" name="id_order_list_trangthai"> <?php echo $row['trangthai']; ?></td>
                            <td><a href="order_detail.php?thanhtoanid=<?php echo $row['thanhtoanid']; ?>"><i class='bx bx-receipt'></i></a></td>
                        </tr>
                    <?php
                }
                    ?>
                    </tbody>
            </table>
        </div>
    </section>
    <script>
        $(function() {
            $("#tableSearch").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>

</html>