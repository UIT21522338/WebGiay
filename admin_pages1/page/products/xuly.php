<?php
$mysqli = new mysqli("localhost","root","","dbdoan");

if (isset($_POST['suasanpham'])) {
    // Update existing product
    $sanphamid = $_GET['sanphamid'];
    $colorid = $_GET['colorid'];
    $tensanpham = mysqli_real_escape_string($mysqli, $_POST['input_sua_tensanpham']);
    $giasanpham = $_POST['input_sua_giasanpham'];
    $danhmucsanpham = $_POST['select_sua_danhmucsanpham'];
    $dongsanpham = $_POST['select_sua_dongsanpham'];
    $styleid = $_POST['select_sua_kieudang'];
    $thongtinsanpham = $_POST['textarea_sua_thongtinsanpham'];
    // Map values using associative arrays
    $dongsp_mapping = [
        'Basas' => 'dongsp1',
        'Vintas' => 'dongsp2',
        'Urbas' => 'dongsp3',
        'Pattas' => 'dongsp4',
        'Creas' => 'dongsp5',
        'Track 6' => 'dongsp6',
    ];
    $style_mapping = [
        'Low Top' => 'style1',
        'High Top' => 'style2',
        'Mid Top' => 'style3',
        'Mule' => 'style4',
    ];
    $dongsanpham = $dongsp_mapping[$dongsanpham] ?? '';
    $styleid = $style_mapping[$styleid] ?? '';

    $sql_sua_sanpham = "UPDATE sanpham 
                        SET tensp = '" . $tensanpham . "',  
                            giasp = '" . $giasanpham . "',  
                            danhmuc = '" . $danhmucsanpham . "', 
                            dongspid = '" . $dongsanpham . "', 
                            styleid = '" . $styleid . "', 
                            thongtinsp = '" . $thongtinsanpham . "'                                           
                        WHERE sanphamid = '" . $sanphamid . "'";

    $anc_sua_sanpham =  mysqli_query($mysqli, $sql_sua_sanpham);

    // Handle picture updates
    $hinhanh1 = $_FILES['input_sua_upload_anh_1']['name'];
    $hinhanh_tmp1 = $_FILES['input_sua_upload_anh_1']['tmp_name'];

    $hinhanh2 = $_FILES['input_sua_upload_anh_2']['name'];
    $hinhanh_tmp2 = $_FILES['input_sua_upload_anh_2']['tmp_name'];

    $hinhanh3 = $_FILES['input_sua_upload_anh_3']['name'];
    $hinhanh_tmp3 = $_FILES['input_sua_upload_anh_3']['tmp_name'];

    $hinhanh4 = $_FILES['input_sua_upload_anh_4']['name'];
    $hinhanh_tmp4 = $_FILES['input_sua_upload_anh_4']['tmp_name'];

    if ($hinhanh1 != "") {
        move_uploaded_file($hinhanh_tmp1, 'uploads/' . $hinhanh1);
        $sql_sua_hinhanh = "UPDATE productcolor 
                        SET img1 = '" . $hinhanh1 . "'
                        WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "'";
    } else if ($hinhanh2 != "") {
        move_uploaded_file($hinhanh_tmp2, 'uploads/' . $hinhanh2);
        $sql_sua_hinhanh = "UPDATE productcolor 
                        SET img2 = '" . $hinhanh2 . "'
                        WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "'";
    } else if ($hinhanh3 != "") {
        move_uploaded_file($hinhanh_tmp3, 'uploads/' . $hinhanh3);
        $sql_sua_hinhanh = "UPDATE productcolor 
                        SET img3 = '" . $hinhanh3 . "'
                        WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "'";
    } else if ($hinhanh4 != "") {
        move_uploaded_file($hinhanh_tmp4, 'uploads/' . $hinhanh4);
        $sql_sua_hinhanh = "UPDATE productcolor 
                        SET img4 = '" . $hinhanh4 . "'
                        WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "'";
    } else if ($hinhanh1 != "" && $hinhanh2 != "" && $hinhanh3 != "" && $hinhanh4 != "") {
        move_uploaded_file($hinhanh_tmp4, 'uploads/' . $hinhanh4);
        move_uploaded_file($hinhanh_tmp3, 'uploads/' . $hinhanh3);
        move_uploaded_file($hinhanh_tmp2, 'uploads/' . $hinhanh2);
        move_uploaded_file($hinhanh_tmp1, 'uploads/' . $hinhanh1);
        $sql_sua_hinhanh = "UPDATE productcolor 
                        SET img1 = '" . $hinhanh1 . "', img2 = '" . $hinhanh2 . "', img3 = '" . $hinhanh3 . "', img4 = '" . $hinhanh4 . "'
                        WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "'";
    }else{
        $sql_sua_hinhanh = "5";
        
    }

    
    if($sql_sua_hinhanh != "5"){
        $anc_sua_hinhanh =  mysqli_query($mysqli, $sql_sua_hinhanh);
    }else{
        $anc_sua_hinhanh = "4";
    }
    


    // Handle quantity updates
    $sizes = ['36', '37', '38', '39', '40', '41', '42', '43', '44'];
    foreach ($sizes as $size) {
        $quantity = $_POST['input_sua_size' . $size];
        $sql_sua_soluong = "UPDATE procolorsize
                             SET sl='" . $quantity . "'
                             WHERE procolorid = (SELECT productcolorid FROM productcolor WHERE productid = '" . $sanphamid . "' AND colorid='" . $colorid . "') AND size = '" . $size . "'";
        
        
        $anc_sua_soluong =  mysqli_query($mysqli, $sql_sua_soluong);
        
    }

    if ($anc_sua_sanpham  && $anc_sua_hinhanh && $anc_sua_soluong ) {
        echo "<script>alert('Cập nhật sản phẩm thành công');</script>";
        header('Location: ../products/products_management.php');
    } else {
        echo "<script>alert('Lỗi! Cập nhật sản phẩm thất bại.\\nVui lòng thử lại sau.');</script>";
    }
} else {
    // Delete existing product

    $sanphamid = $_GET['sanphamid'];
    $colorid = $_GET['colorid'];

    $sql_xoa_hinhanh = "SELECT * FROM productcolor WHERE productid = '" . $sanphamid . "' AND  colorid = '" . $colorid . "' LIMIT 1";
    $query_xoa_hinhanh = mysqli_query($mysqli, $sql_xoa_hinhanh);

    while ($row = mysqli_fetch_array($query_xoa_hinhanh)) {
        unlink('uploads/' . $row['img1']);
        unlink('uploads/' . $row['img2']);
        unlink('uploads/' . $row['img3']);
        unlink('uploads/' . $row['img4']);
    }

    $cnt = "select count(productcolorid) as cnt FROM productcolor WHERE productid = '" . $sanphamid . "'";
    $cnt_1 = mysqli_query($mysqli, $cnt);

    while($row1 = mysqli_fetch_array($cnt_1)){
        $tmp = $row1['cnt'];
    }
    if($tmp == 1){
        $sql_xoa_sanpham = "DELETE FROM sanpham WHERE sanphamid = '" . $sanphamid . "'";
        $anc_xoa_sanpham = mysqli_query($mysqli, $sql_xoa_sanpham);
    }else{
        $sql_xoa_productcolor = "DELETE FROM productcolor WHERE productid = '" . $sanphamid . "' and colorid = '" . $colorid . "'";
        $anc_xoa_productcolor = mysqli_query($mysqli, $sql_xoa_productcolor);
        $sql_xoa_procolorsize = "DELETE FROM procolorsize WHERE procolorid IN (SELECT productcolorid FROM productcolor WHERE productid = '" . $sanphamid . "' and colorid = '" . $colorid . "')";
        $anc_xoa_procolorsize = mysqli_query($mysqli, $sql_xoa_procolorsize);
    }
    
    

    echo "<script>alert('Xóa sản phẩm thành công');</script>";
    header('Location: ../products/products_management.php');
}
