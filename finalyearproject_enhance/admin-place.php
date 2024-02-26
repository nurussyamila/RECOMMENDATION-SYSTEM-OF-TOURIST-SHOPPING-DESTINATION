<?php
    include './include/config.php';

    $collection = [];

    if(!isset($_SESSION['account_admin'])){
        header("Location: home-login.php");
        exit();
    }

    $searchkey = (isset($_GET['key']) ? $_GET['key'] : '');
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
                            <h3><strong>Manage</strong> Places</h3>
                        </div>

                        <div class="col-auto ms-auto text-end mt-n1">
							<a href="admin-add-place.php" class="btn btn-primary">Add Places</a>
						</div>
                    </div>
                    <!--#END HEADER -->

                    <!--#START BODY -->
                    <div class="row">
						<div class="col-xl-12 col-xxl-12">
							<div class="card flex-fill w-100">

                                <!--#START Content -->
								<div class="card-body pt-4 pb-3">
                                    <form method="GET">
										<div class="mb-3 row">
											<label class="col-form-label col-sm-2 text-sm-start fw-bold">Search Place Name:</label>
											<div class="col-sm-10">
												<input type="search" autofocus value="<?php echo $searchkey; ?>" name="key" class="form-control" placeholder="Enter place name and hit 'Enter'">
											</div>
										</div>
									</form>

                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover table-md w-100">
                                            <tr class="shadow-1 border-1">
                                                <th>No.</th>
                                                <th>Picture</th>
                                                <th>Name</th>
                                                <th>State</th>
                                                <th>Category</th>
                                                <th>Address</th>
                                                <th>Operating</th>
                                                <th>Website</th>
                                                <th>Direction</th>
                                                <th>Action</th>
                                            </tr>

                                            <?php
                                                $dataset = fetchRows("SELECT * FROM `places` WHERE `is_active` = 1 AND `shopping_name` LIKE '%".$searchkey."%' ORDER BY `category`");

                                                if(!empty($dataset)){
                                                    foreach($dataset as $key => $value){
                                                        echo '<tr>
                                                            <td class="text-left">'.($key + 1).'</td>
                                                            <td class="text-left p-0">
                                                                <img style="object-fit: cover;height: 40px;" src="'.(!empty($value['image_1']) ? $value['image_1'] : 'https://picsum.photos/300/200?random='.$key).'" class="img-fluid w-100 bg-secondary"/>
                                                            </td>
                                                            <td class="text-left">'.(!empty($value['shopping_name']) ? $value['shopping_name'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['state']) ? $value['state'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['category']) ? $value['category'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['address']) ? $value['address'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['operating']) ? $value['operating'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['website']) ? $value['website'] : '-').'</td>
                                                            <td class="text-left">'.(!empty($value['direction']) ? $value['direction'] : '-').'</td>
                                                            <td class="text-left">
                                                                <div class="w-full flex flex-column gap-2">
                                                                    <a class="text-sm surface-100 p-2 no-underline" href="admin-place-deactive.php?id='.$value['id'].'">
                                                                        <i class="align-middle" data-feather="eye"></i>
                                                                    </a>

                                                                    <a class="text-sm surface-100 p-2 no-underline" href="admin-add-place.php?id='.$value['id'].'">
                                                                        <i class="align-middle" data-feather="edit"></i>
                                                                    </a>
                                                                </div>
                                                            </td>
                                                        </tr>';
                                                    }
                                                }else{
                                                    echo '<tr><td class="p-3" colspan="10">No Record Yet</td></tr>';
                                                }
                                            ?>
                                        </table>
                                    </div>

								</div>
                                <!--#END Content -->

							</div>
						</div>
					</div>
                    <!--#END BODY -->

                </div>
            </main>

            <?php include './include/footer.php'; ?>
        </div>
    </div>
</body>
</html>