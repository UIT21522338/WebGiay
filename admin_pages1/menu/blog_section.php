<?php
$mysqli = new mysqli("localhost", "root", "", "dbdoan");

//////////////
// Thống kê tổng số tiền hàng
$sqladmin = "SELECT ngayorder, SUM(tongtien) AS total FROM thanhtoan GROUP BY ngayorder";
$query_admin = $mysqli->query($sqladmin);

$xValues = [];
$yValues = [];

while ($row = $query_admin->fetch_assoc()) {
    // Format the date as dd/mm/yyyy
    $formattedDate = date('d/m/Y', strtotime($row['ngayorder']));

    $xValues[] = $formattedDate;
    $yValues[] = $row['total'];
}

//////////////
// Thống kê tổng số sản phẩm bán ra
$sqladmin1 = "SELECT ngayorder, SUM(soluong) AS total FROM thanhtoanct 
              JOIN thanhtoan ON thanhtoanct.thanhtoanid = thanhtoan.thanhtoanid 
              GROUP BY ngayorder";
$query_admin1 = $mysqli->query($sqladmin1);

$xValues1 = [];
$yValues1 = [];

while ($row = $query_admin1->fetch_assoc()) {
    // Format the date as dd/mm/yyyy
    $formattedDate = date('d/m/Y', strtotime($row['ngayorder']));

    $xValues1[] = $formattedDate;
    $yValues1[] = $row['total'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Thống kê</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Chart -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
    <section class="blog blog-hnm tab-content" id="blog-section">
        <div class="text text-hnm">Thống kê</div>

        <div class="col-md-12">
            <div class="panel panel-default ">
                <div class="panel-heading">
                    <h3>Thống kê tổng số tiền hàng</h3>
                </div>
                <div class="panel-body">
                    <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>Thống kê tổng số sản phẩm bán ra</h3>
                </div>
                <div class="panel-body">
                    <canvas id="myChart1" style="width:100%;max-width:600px"></canvas>
                </div>
            </div>
        </div>

    </section>

    <script>
    function generateRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    const xValuesChart1 = <?php echo json_encode($xValues); ?>;
    const yValuesChart1 = <?php echo json_encode($yValues); ?>;
    const barColorsChart1 = Array.from({ length: xValuesChart1.length }, generateRandomColor);

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValuesChart1,
            datasets: [{
                backgroundColor: barColorsChart1,
                data: yValuesChart1
            }]
        },
        options: {
            legend: {
                display: false
            },
            title: {
                display: true,
                text: "Thống kê tổng số tiền hàng theo ngày"
            }
        }
    });
</script>

<script>
    const xValuesChart2 = <?php echo json_encode($xValues1); ?>;
    const yValuesChart2 = <?php echo json_encode($yValues1); ?>;
    const barColorsChart2 = Array.from({ length: xValuesChart2.length }, generateRandomColor);

    new Chart("myChart1", {
        type: "bar",
        data: {
            labels: xValuesChart2,
            datasets: [{
                backgroundColor: barColorsChart2,
                data: yValuesChart2
            }]
        },
        options: {
            legend: {
                display: false
            },
            title: {
                display: true,
                text: "Thống kê tổng số sản phẩm bán ra theo ngày"
            }
        }
    });
</script>


</body>

</html>
