<?php
    include './include/config.php';

    $collection = [];

    if(!isset($_SESSION['account_session'])){
        header("Location: home-login.php");
        exit();
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
                            <h3><strong>Review</strong> History</h3>
                        </div>
                    </div>
                    <!--#END HEADER -->

                    <!--#START Body Content -->
                    <div class="row">
						<div class="col-xl-12 col-xxl-12">
							<div class="card flex-fill w-100">

                                <!--#START Table -->
								<div class="card-body pt-4 pb-3">

                                    <table class="w-100 table table-bordered table-striped">
                                        <tr>
                                            <th class="py-2 surface-0 px-3 border-bottom-1 border-300 bg-yellow-400">No.</th>
                                            <th class="py-2 surface-0 px-3 border-bottom-1 border-300 bg-yellow-400">Place Name</th>
                                            <th class="py-2 surface-0 px-3 border-bottom-1 border-300 bg-yellow-400">Score</th>
                                        </tr>

                                        <?php
                                            $reviewScoreDB = fetchRows("SELECT * FROM `customer_feedback` WHERE `user_id` = ".$profileid);

                                            if(empty($userrecord)){
                                                foreach($reviewScoreDB as $key => $value){

                                                    $placedata = fetchRow("SELECT * FROM `places` WHERE `id` = ".$value['place_id']);

                                                    echo '<tr>
                                                        <td class="py-2 surface-0 px-3 border-bottom-1 border-300">'.($key + 1).'</td>
                                                        <td class="py-2 surface-0 px-3 border-bottom-1 border-300">
                                                            <a href="./place-view.php?id='.$placedata['id'].'">'.$placedata['shopping_name'].'</a>
                                                        </td>
                                                        <td class="py-2 surface-0 px-3 border-bottom-1 border-300">'.$value['score'].' Stars</td>
                                                    </tr>';
                                                }
                                            }else{
                                                echo '<tr><td class="p-3" colspan="6">No review Yet</td></tr>';
                                            }
                                        ?>
                                    </table>

								</div>
                                <!--#END Table -->

							</div>
						</div>
					</div>
                    <!--#END Body Content -->

                </div>
            </main>

            <?php include './include/footer.php'; ?>
        </div>
    </div>
</body>
</html>