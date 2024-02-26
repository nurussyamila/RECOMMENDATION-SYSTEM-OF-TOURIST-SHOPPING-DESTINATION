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
                            <h3><strong>Search</strong> History</h3>
                        </div>
                    </div>
                    <!--#END HEADER -->

                    <!--#START Body Content -->
                    <div class="row">
						<div class="col-xl-12 col-xxl-12">
							<div class="card flex-fill w-100">

                                <!--#START Table -->
								<div class="card-body pt-4 pb-3">

                                    sd

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