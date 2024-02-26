<!DOCTYPE html>
<html lang="en">

<head>
	<?php
		include './include/config.php';
        include './include/header.php';
    ?>

	<link rel="stylesheet" href="vendor/slick-slider/css/slick.css">

	<style>
		.fullscreen-carousel{
			position: relative;
		}

		.fullscreen-carousel .slick-prev,
		.fullscreen-carousel .slick-next{
			position: absolute;
			top: 0;
			z-index: 99;
			border: none;
			height: 100%;
			background: #fff0;
		}

		.fullscreen-carousel .slick-next{
			right: 0;
		}

		.fullscreen-carousel .slick-prev{
			left: 0;
		}

		.fullscreen-carousel .info-caption{
			position: absolute;
			z-index: 50;
			top: 0;
			left: 0;
		}

		.fullscreen-carousel .slick-slide {
			position: relative;
		}

		.card-product{
			position: relative;
		}
	</style>
</head>

<body>
	<div class="wrapper">
		<?php include './include/sidebar.php'; ?>

		<div class="main">
			<?php include './include/top-navbar.php'; ?>

			<main class="content p-0">
				<div class="container-fluid p-0">

					<div class="row">
						<div class="col-12">
							<div class="fullscreen-carousel">

								<!-- Screen slider 1 -->
								<div>
									<img style="object-fit: cover;height: 50vh;" src="https://images.unsplash.com/photo-1680961335134-cc38dc4d2efa?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="w-100"/>
									
									<div class="d-flex flex-column w-100 h-100 info-caption align-items-center justify-content-center">
										<h2 class="text-lg text-white">Most Famous Place</h2>
										<h1 class="text-xl text-white mt-2 text-uppercase">Berjaya Times Square</h1>
										<a href="./place-list.php" class="btn btn-primary btn-lg mt-3">View More</a>
									</div>
								</div>

								<!-- Screen slider 2 -->
								<div>
									<img style="object-fit: cover;height: 50vh;" src="https://images.unsplash.com/photo-1489348611450-4c0d746d949b?q=80&w=2346&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="w-100"/>

									<div class="d-flex flex-column w-100 h-100 info-caption align-items-center justify-content-center">
										<h2 class="text-lg text-white">Most Visited All The Time</h2>
										<h1 class="text-xl text-white mt-2 text-uppercase">Langkawi Craft Complex</h1>
										<button class="btn btn-primary btn-lg mt-3">View More</button>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="row p-3">
						<div class="d-flex flex-column w-100 h-100 info-caption align-items-center justify-content-center py-3">
							<h3 class="text-primary">Most Rated by Visitors</h3>
						</div>
						<?php
							$pictures = [
								'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/83/30/caption.jpg?w=600&h=-1&s=1',
								'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/83/d6/dd/the-honey-peark-milk.jpg?w=1100&h=-1&s=1',
								'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/a9/kee-ann-food-street.jpg?w=700&h=-1&s=1',
								'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/5a/c8/dc/handmade-lampshades-at.jpg?w=1200&h=-1&s=1',
							];
							
							$topPlaces = fetchRows("SELECT DISTINCT(`place_id`) FROM `customer_feedback` LIMIT 0,4");
							
							for ($i = 0; $i < 4; $i++)
							{
								$placeTitle = 'Somewhere Else';
								$redirectURL = '#';

								if (!empty($topPlaces[$i]))
								{
									$data = fetchRow("SELECT * FROM `places` WHERE `id`=" . $topPlaces[$i]['place_id']);
									$imageSource = !empty($data['image_1']) ? $data['image_1'] : $pictures[$i];
									$placeTitle = !empty($data['shopping_name']) ? $data['shopping_name'] : $placeTitle;
									$redirectURL = !empty($data) ? "./place-view.php?id=".$data['id'] : $redirectURL;
								}
								else
								{
									$imageSource = $pictures[$i];
								}
							
								echo '
								<a href="'.$redirectURL.'" class="col-3">
									<img style="object-fit: cover;height: 30vh;" class="w-100 img img-responsize img-thumbnail" src="' . $imageSource . '">
									<h5 class="w-100 text-center text-secondary py-2">'.$placeTitle.'</h5>
								</a>';
							}
						?>
					</div>

				</div>
			</main>

			<?php include './include/footer.php'; ?>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="vendor/slick-slider/js/slick.min.js"></script>

	<script>
		$('.fullscreen-carousel').slick({
            arrows: true,
			autoplay: false,
            prevArrow: `
				<button type='button' class='slick-prev'>
					<i class='align-middle text-muted' data-feather='chevron-left' style="height: 60px; width: 60px;"></i>
				</button>
			`,
            nextArrow: `
				<button type='button' class='slick-next'>
					<i class='align-middle text-muted' data-feather='chevron-right' style="height: 60px; width: 60px;"></i>
				</button>
			`
		});
	</script>
</body>
</html>
