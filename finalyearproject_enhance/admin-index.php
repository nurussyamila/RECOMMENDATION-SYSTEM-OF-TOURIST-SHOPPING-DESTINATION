<?php
    include './include/config.php';

    $collection = [];

    if(!isset($_SESSION['account_admin'])){
        header("Location: home-login.php");
        exit();
    }

    for($i = 1; $i <= 12; $i++){
        $totalCollection = 0;
        $mon = sprintf("%02d", $i);
        $fetchMonthly = fetchRows("SELECT * FROM `customer_feedback` WHERE MONTH(`created_date`) =".$mon);

        $collection[] = count($fetchMonthly);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<?php include './include/header.php'; ?>
</head>
<body>
    <div class="wrapper">
        <?php include './include/sidebar.php'; ?>

        <div class="main">
            <?php include './include/top-navbar.php'; ?>

            <main class="content">
                <div class="container-fluid p-0">

                    <!--#START HEADER -->
                    <div class="row mb-2 mb-xl-3">
                        <div class="col-auto d-none d-sm-block">
                            <h3><strong>Yearly</strong> Customer Feedback</h3>
                        </div>
                    </div>
                    <!--#END HEADER -->

                    <!--#START Chart -->
                    <div class="row">
						<div class="col-xl-12 col-xxl-12">
							<div class="card flex-fill w-100">
								<div class="card-header"></div>
								<div class="card-body pt-2 pb-3">
                                    <canvas id="chart" class="w-100"></canvas>
								</div>
							</div>
						</div>

                        <div class="col-xl-12 col-xxl-12">
							<div class="card flex-fill w-100">

								<div class="card-body pt-3 pb-3">
                                    <table class="table table-bordered table-striped">
                                        <tr class="shadow-1 border-1">
                                            <th align="center">No.</th>
                                            <th align="center">Picture</th>
                                            <th align="center">Place</th>
                                            <th align="center">
                                                <div class="d-flex text-warning">
                                                    <i class="align-middle" data-feather="star"></i>
                                                </div>
                                            </th>
                                            <th align="center">
                                                <div class="d-flex text-warning">
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                </div>
                                            </th>
                                            <th align="center">
                                                <div class="d-flex text-warning">
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                </div>
                                            </th>
                                            <th align="center">
                                                <div class="d-flex text-warning">
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                </div>
                                            </th>
                                            <th align="center">
                                                <div class="d-flex text-warning">
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                    <i class="align-middle" data-feather="star"></i>
                                                </div>
                                            </th>
                                        </tr>

                                        <?php
                                            $userrecord = fetchRows("SELECT DISTINCT(`place_id`) FROM `customer_feedback`");

                                            foreach($userrecord as $key => $value){

                                                $placedata = fetchRow("SELECT * FROM `places` WHERE `id` = ".$value['place_id']);
                                                $oneStar   = numRows("SELECT * FROM `customer_feedback` WHERE `score` = 1 AND `place_id` = ".$value['place_id']);
                                                $twoStar   = numRows("SELECT * FROM `customer_feedback` WHERE `score` = 2 AND `place_id` = ".$value['place_id']);
                                                $threeStar = numRows("SELECT * FROM `customer_feedback` WHERE `score` = 3 AND `place_id` = ".$value['place_id']);
                                                $fourStar  = numRows("SELECT * FROM `customer_feedback` WHERE `score` = 4 AND `place_id` = ".$value['place_id']);
                                                $fiveStar  = numRows("SELECT * FROM `customer_feedback` WHERE `score` = 5 AND `place_id` = ".$value['place_id']);
                                        ?>
                                        <tr>
                                            <td align="center"><?php echo ($key + 1); ?></td>
                                            <td align="center">
                                                <img style="height: 3rem;" class="card-img-top" src="<?php echo (!empty($value['image_1']) ? $value['image_1'] : 'https://picsum.photos/300/200?random='.$key); ?>" alt="Unsplash">    
                                            </td>
                                            <td align="left"><?php echo $placedata['shopping_name']; ?></td>
                                            <td align="left"><?php echo $oneStar; ?> Reviewer</td>
                                            <td align="left"><?php echo $twoStar; ?> Reviewer</td>
                                            <td align="left"><?php echo $threeStar; ?> Reviewer</td>
                                            <td align="left"><?php echo $fourStar; ?> Reviewer</td>
                                            <td align="left"><?php echo $fiveStar; ?> Reviewer</td>
                                        </tr>
                                        <?php } ?>
                                        
                                        <?php
                                            if(empty($userrecord)){
                                                echo '<tr><td class="p-3" colspan="6">No Record Yet</td></tr>';
                                            }
                                        ?>
                                    </table>
								</div>

							</div>
						</div>
					</div>
                    <!--#END Feedback Chart -->

                </div>
            </main>

            <?php include './include/footer.php'; ?>
        </div>
    </div>

    <script src="./chart.js"></script>
    <script>
        let data = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "Total Feedback",
                backgroundColor: "rgba(34,46,60,1)",
                borderColor: "rgba(34,46,60,1)",
                borderWidth: 2,
                hoverBackgroundColor: "rgba(34,46,60,0.4)",
                hoverBorderColor: "rgba(34,46,60,1)",
                data: JSON.parse(`<?php echo json_encode($collection); ?>`),
            }]
        };

        let options = {
            responsive: false,
            maintainAspectRatio: false,
            scales: {
                y: {
                    ticks: {
                        callback: function(value, index, ticks) {
                            return 'RM ' + value;
                        }
                    },
                    stacked: true,
                    grid: { display: true, color: "rgba(34,46,60,0.2)" }
                },
                x: {
                    grid: { display: false }
                }
            },
            animation: {
                duration: 1,
                onComplete: function({ chart }) {
                    const ctx = chart.ctx;

                    chart.config.data.datasets.forEach(function(dataset, i) {
                        const meta = chart.getDatasetMeta(i);

                        meta.data.forEach(function(bar, index) {
                            const data = dataset.data[index];

                            ctx.fillText(data, bar.x, bar.y - 5);
                        });
                    });
                }
            }
        };

        new Chart('chart', {
            type: 'bar',
            options: options,
            data: data
        });
    </script>
</body>
</html>