<?php
    include './include/config.php';

    $collection = [];

    if(!isset($_SESSION['account_admin'])){
        header("Location: home-login.php");
        exit();
    }

    if(isset($_GET['id'])){
        $placedata = fetchRow("SELECT * FROM `places` WHERE `id` =".$_GET['id']);
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
                            <h3><strong>Add</strong> New Place</h3>
                        </div>
                    </div>
                    <!--#END HEADER -->

                    <!--#START Creation Form -->
                    <div class="row">
						<div class="col-xl-8 col-xxl-8">
							<div class="card flex-fill">

                                <!--#START Content -->
								<div class="card-body pt-4 pb-3">
                                    <form method="POST" enctype="multipart/form-data">

                                        <div class="d-flex gap-3 mb-3 border border-top-0 border-start-0 border-end-0 pb-4">
                                            <div class="flex-grow-1">
                                                <label class="form-label">Name</label>
                                                <input required type="text" name="place_name" placeholder="Enter Place Name" class="form-control" value="<?php echo (!empty($placedata['shopping_name']) ? $placedata['shopping_name'] : ''); ?>"/>
                                            </div>

                                            <div class="flex-grow-2">
                                                <label class="form-label">Operating</label>
                                                <input required type="text" name="place_operate" placeholder="Enter Operating Hour" class="form-control" value="<?php echo (!empty($placedata['operating']) ? $placedata['operating'] : ''); ?>"/>
                                            </div>

                                            <div class="flex-grow-3">
                                                <label class="form-label">Category</label>
                                                <input required type="text" name="place_category" placeholder="Enter Category" class="form-control" value="<?php echo (!empty($placedata['category']) ? $placedata['category'] : ''); ?>"/>
                                            </div>
                                        </div>

                                        <div class="d-flex gap-3 mb-3 border border-top-0 border-start-0 border-end-0 pb-4">
                                            <div class="flex-grow-1">
                                                <label class="form-label">Picture 1</label>
                                                <input type="text" name="place_picture_1" placeholder="Enter Picture 1" class="form-control" value="<?php echo (!empty($placedata['image_1']) ? $placedata['image_1'] : ''); ?>"/>
                                            </div>

                                            <div class="flex-grow-1">
                                                <label class="form-label">Picture 2</label>
                                                <input type="text" name="place_picture_2" placeholder="Enter Picture 2" class="form-control" value="<?php echo (!empty($placedata['image_2']) ? $placedata['image_2'] : ''); ?>"/>
                                            </div>

                                            <div class="flex-grow-1">
                                                <label class="form-label">Picture 3</label>
                                                <input type="text" name="place_picture_3" placeholder="Enter Picture 3" class="form-control" value="<?php echo (!empty($placedata['image_3']) ? $placedata['image_3'] : ''); ?>"/>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">State</label>
                                            <input required type="text" name="place_state" placeholder="Enter State" class="form-control" value="<?php echo (!empty($placedata['state']) ? $placedata['state'] : ''); ?>"/>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <textarea class="form-control" name="place_address" placeholder="Enter Address"><?php echo (!empty($placedata['address']) ? $placedata['address'] : ''); ?></textarea>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Website</label>
                                            <input type="text" name="place_web" placeholder="Enter Website" class="form-control" value="<?php echo (!empty($placedata['website']) ? $placedata['website'] : ''); ?>"/>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Direction</label>
                                            <textarea class="form-control" name="place_direction" placeholder="Enter Direction"><?php echo (!empty($placedata['direction']) ? $placedata['direction'] : ''); ?></textarea>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Description</label>
                                            <textarea class="form-control" name="place_description" placeholder="Enter Description"><?php echo (!empty($placedata['description']) ? $placedata['description'] : ''); ?></textarea>
                                        </div>
                                       
                                        <button type="submit" name="place_upload" class="btn btn-primary">Save & Publish</button>
                                    </form>

								</div>
                                <!--#END Content -->

							</div>
						</div>
					</div>
                    <!--#END Creation Form -->

                </div>
            </main>

            <?php include './include/footer.php'; ?>
        </div>
    </div>

    <?php
        if(isset($_POST['place_upload'])){
            $place_name        = addslashes($_POST['place_name'] ?? null);
            $place_picture_1   = addslashes($_POST['place_picture_1'] ?? '');
            $place_picture_2   = addslashes($_POST['place_picture_2'] ?? '');
            $place_picture_3   = addslashes($_POST['place_picture_3'] ?? '');
            $place_state       = addslashes($_POST['place_state'] ?? '');
            $place_category    = addslashes($_POST['place_category'] ?? '');
            $place_address     = addslashes($_POST['place_address'] ?? '');
            $place_operate     = addslashes($_POST['place_operate'] ?? '');
            $place_web         = addslashes($_POST['place_web'] ?? '');
            $place_direction   = addslashes($_POST['place_direction'] ?? '');
            $place_description = addslashes($_POST['place_description'] ?? '');

            if(isset($_GET['id'])){
                runQuery("UPDATE `places` SET `shopping_name` = '$place_name', `state` = '$place_state', `category` = '$place_category', `address` = '$place_address', `operating` = '$place_operate', `website` = '$place_web', `description` = '$place_description', `direction` = '$place_direction', `image_1` = '$place_picture_1', `image_2` = '$place_picture_2', `image_3` = '$place_picture_3' WHERE `places`.`id` = ".$_GET['id']);

                ToastMessage('Success', 'Product Saved', 'success', "admin-place.php");
            }else{
                runQuery("INSERT INTO `places` (`id`, `shopping_name`, `state`, `category`, `address`, `operating`, `review`, `website`, `description`, `direction`, `image_1`, `image_2`, `image_3`, `is_active`) VALUES (NULL, '".$place_name."', '".$place_state."', '".$place_category."', '".$place_address."', '".$place_operate."', NULL, '".$place_web."', '".$place_description."', '".$place_direction."', '".$place_picture_1."', '".$place_picture_2."', '".$place_picture_3."', '1')");

                ToastMessage('Success', 'Product Added', 'success', 'admin-place.php');
            }
        }
    ?>
</body>
</html>