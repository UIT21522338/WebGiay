
<?php
$mysqli = new mysqli("localhost", "root", "", "dbdoan");
// LOAD CSDL (LIỆT KÊ SẢN PHẨM)
$sql_lietke_danhmuc_sp = "
                            SELECT *
                            FROM (
                                SELECT sp.sanphamid, sp.tensp, sp.giasp, sp.danhmuc, sp.thongtinsp, dsp.tendongsp, st.stylename,pc.img1,cl.colorname,cl.colorid
                                FROM sanpham sp
                                JOIN productcolor pc ON pc.productid = sp.sanphamid
                                JOIN dongsp dsp ON dsp.dongspid = sp.dongspid
                                JOIN style st ON st.styleid = sp.styleid
                                JOIN color cl ON cl.colorid = pc.colorid
                                ORDER BY sp.sanphamid ASC
                            ) AS result
                            ORDER BY result.sanphamid ASC
                        ";
$query_lietke_danhmuc_sp = $mysqli->query($sql_lietke_danhmuc_sp);
?>

<style>
    .product_list tr #td_productimage img {
        width: 120px;
        height: 90px;
    }

    .product_list tr th {
        background-color: #ff5f17;
        color: white;
    }

    .product_list tr td {
        background-color: white;
        font-weight: bold;
    }

    .bx-trash,
    .bx-edit {
        color: black;
        font-size: 1.3em;
    }

    .bx-trash:hover {
        color: #ff5f17;
    }

    .bx-edit:hover {
        color: #ff5f17;
    }

    .product_list {
        text-align: center;
    }

    .product_list_container {
        margin-top: 60px;
    }

    .product-hnm .btn-add-product {
        display: flex;
        height: 35px;
        padding: 0;
        background: #ff5f17;
        border: none;
        outline: none;
        border-radius: 5px;
        overflow: hidden;
        font-family: "Quicksand", sans-serif;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
    }

    .product-hnm .btn-add-product:hover {
        background: #d54e10;
    }

    .product-hnm .btn-add-product .btn-add-product-text,
    .btn-add-product-icon {
        display: inline-flex;
        align-items: center;
        padding: 0 5px;
        color: #fff;
        height: 100%;
    }

    .product-hnm .btn-add-product .btn-add-product-icon {
        font-size: 1.5em;
        background: rgba(0, 0, 0, 0.08);
    }

    .btn-add-product-container {
        position: absolute;
        right: 0;
    }

    #themsanpham_text {
        text-decoration: none;
    }
</style>
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
</head>

<body>
    <section class="product product-hnm tab-content" id="product-section">
        <div class="text text-hnm">Sản phẩm</div>
        <div class="btn-add-product-container">
            <a href="products_add.php" id="themsanpham_text">
                <button type="button" class="btn-add-product">
                    <span class="btn-add-product-text"><b>Thêm sản phẩm</b></span>
                    <span class="btn-add-product-icon">
                        <i class='bx bx-plus'></i>
                    </span>
                </button>
            </a>
        </div>

        
        <div class="product_list_container">
            <input class="form-control mb-4" id="tableSearch" type="text" placeholder="Tìm kiếm">

            <form method="post" action="../page/products/xuly.php">

                <table class="table table-bordered table-striped product_list" border="1" style="border-collapse: collapse; width:100%;">

                    <thead>
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Ảnh minh họa</th>
                        <th>Dòng</th>
                        <th>Kiểu dáng</th>
                        <th>Màu sắc</th>
                        <th>Danh mục</th>
                        <th>Giá</th>
                        <th>Xóa / Sửa</th>
                    </thead>
                    <tbody id="myTable">
                        <!-- (LIỆT KÊ SẢN PHẨM) -->
                        <?php
                        $i = 1;
                        while ($row = mysqli_fetch_array($query_lietke_danhmuc_sp)) {
                        ?>
                            <tr>
                                <td id="td_productnumber" name="td_productnumber"><?php echo $i; ?></td>
                                <td id="td_productname" name="td_productname"><?php echo $row['tensp']; ?></td>
                                <td id="td_productimage" name="td_productimage">
                                    <img src="../../../uploads/<?php echo $row['img1']; ?>" alt="<?php echo $row['img1']; ?>">
                                </td>
                                <td id="td_productline" name="td_productline"><?php echo $row['tendongsp']; ?></td>
                                <td id="td_productstyle" name="td_productstyle"><?php echo $row['stylename']; ?></td>
                                <td id="td_color" name="td_color"><?php echo $row['colorname']; ?></td>
                                <td id="td_productportfolio" name="td_productportfolio"><?php echo $row['danhmuc']; ?></td>
                                <td id="td_productprice" name="td_productprice"><?php echo $row['giasp']; ?>₫</td>
                                <td>
                                    <a href="xuly.php?sanphamid=<?php echo $row['sanphamid']; ?>&colorid=<?php echo $row['colorid']; ?>" id="xoasanpham_text">
                                        <i class='bx bx-trash'></i>
                                    </a>
                                    |
                                    <a href="products_edit.php?sanphamid=<?php echo $row['sanphamid']; ?>&colorid=<?php echo $row['colorid']; ?>" id="suasanpham_text">
                                        <i class='bx bx-edit'></i>
                                    </a>
                                </td>
                            </tr>
                        <?php
                            $i++;
                        }
                        ?>
                    </tbody>
                </table>
            </form>
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