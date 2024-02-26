<!DOCTYPE html>
<html lang="en">

<head>
	<?php
		include './include/config.php';
        include './include/header.php';
    ?>

    <link rel="stylesheet" href="./vendor/select-picker/picker.min.css?1">
</head>

<body>
	<div class="wrapper">
		<?php include './include/sidebar.php'; ?>

		<div class="main">
			<?php include './include/top-navbar.php'; ?>

			<main class="content">
				<div class="container-fluid p-0">

					<!--#START Login Container -->
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-6 mx-auto d-table h-100">
							<div class="d-table-cell align-middle">

								<div class="card">
									<div class="card-body">
										<div class="m-sm-4">

                                            <!--#START Header -->
                                            <div class="mb-4">
                                                <h1 class="h3 d-inline align-middle">Create Account</h1>
                                            </div>
                                            <!--#END Header -->

                                            <!--#START Form -->
											<form method="POST">
                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Name</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" placeholder="Name" name="fullname">
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Email</label>
                                                    <div class="col-sm-9">
                                                        <input type="email" class="form-control" placeholder="Email" name="email">
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Phone</label>
                                                    <div class="col-sm-9">
                                                        <input type="tel" class="form-control" placeholder="Phone" name="phone">
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Address</label>
                                                    <div class="col-sm-9">
                                                        <textarea class="form-control" placeholder="Address" rows="3" name="address"></textarea>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Favourite Interest</label>
                                                    <div class="col-sm-9">
                                                        <select id="ex-basic" name="fav-category[]" multiple class="form-control">
                                                            <option disabled>Select Favourite</option>
                                                            <?php
                                                                $category = fetchRows("SELECT DISTINCT(`category`) FROM `places`");

                                                                foreach($category as $c){
                                                                    echo "<option value='".$c['category']."'>".$c['category']."</option>";
                                                                }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-form-label col-sm-3 text-sm-end">Password</label>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control" placeholder="Password" name="password">
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <div class="col-sm-9 ms-sm-auto">
                                                        <button name="create_account" type="submit" class="btn btn-primary">Register Now</button>
                                                        <div class="mt-3">
                                                            <a href="home-login.php" class="text-left w-100 m-1">Already have account?</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--#END Form -->

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!--#END Login Container -->

				</div>
			</main>

			<?php include './include/footer.php'; ?>
		</div>
	</div>

    <script type="text/javascript" src="./vendor/select-picker/picker.min.js"></script>
    <script type="text/javascript">
        $('#ex-basic').picker();
    </script>
</body>

<?php
	if(isset($_POST['create_account'])){
        $name = $_POST['fullname'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $favcategory = $_POST['fav-category'];

        $result = runQuery("INSERT INTO `login` (`id`, `name`, `email`, `password`, `type`, `phone`, `address`, `interest`) VALUES (NULL, '$name', '$email', '$password', '2', '$phone', '$address', '".json_encode($favcategory)."')");

        ToastMessage('Success', 'Account created successfully', 'success', 'home-login.php');
    }
?>
</html>
