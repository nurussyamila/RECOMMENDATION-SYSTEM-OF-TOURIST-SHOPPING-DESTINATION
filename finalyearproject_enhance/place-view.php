<!DOCTYPE html>
<html lang="en">

<head>
	<?php
		include './include/config.php';
        include './include/header.php';

		$id = ($_GET['id'] ?? '');
		$imagekey = ($_GET['key'] ?? 0);

		$currentScore = 0;
		$data = fetchRow("SELECT * FROM `places` where id=".$id);
		$customerFeedback = fetchRows("SELECT * FROM `customer_feedback` WHERE `place_id` =".$id);

		if(empty($data)){
			header('Location: place-list.php');exit;
		}

		function picturesGallery(){
			$arrayOfString = [];
			$pictures = fetchRows("SELECT * FROM `pictures`");
	
			foreach ($pictures as $picture) {
				$arrayOfString[] = $picture['primary'] . ', ' . $picture['secondary'] . ', ' . $picture['tertiary'];
			}
	
			return $arrayOfString;
		}

		$picturesGallery = picturesGallery();
    ?>

	<link rel="stylesheet" href="./vendor/star-rating/jquery.raty.css">

	<style>
		.rating-box img { height: 2.3rem; }
	</style>
</head>

<body>
	<div class="wrapper">
		<?php include './include/sidebar.php'; ?>

		<div class="main">
			<?php include './include/top-navbar.php'; ?>

			<?php
				if($hasSession){
					$myscore = fetchRow("SELECT * FROM `customer_feedback` WHERE `user_id` = '".$profileid."' AND `place_id` = '".$id."'");
					
					if($myscore){
						$currentScore = $myscore['score'];
					}
				}
			?>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="d-flex gap-2">
						<img style="object-fit: cover;height: 80vh;width: 60vh;" src="<?php echo (isset($picturesGallery[$imagekey]) ? $picturesGallery[$imagekey] : 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/b9/58/b4/photo0jpg.jpg?w=700&h=500&s=1&cx=1000&cy=543&chk=v1_d6044045ef865bfe074a 1x,https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/b9/58/b4/photo0jpg.jpg?w=1400&h=900&s=1&cx=1000&cy=543&chk=v1_d6044045ef865bfe074a 2x'); ?>" class="rounded"/>

						<div class="flex-fill h-100 d-flex flex-column gap-2">
							<img style="object-fit: cover;height: 40vh;" src="<?php echo (isset($picturesGallery[$imagekey + 1]) ? $picturesGallery[$imagekey + 1] : 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/47/20/bc/caption.jpg?w=500&h=300&s=1 1x,https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/47/20/bc/caption.jpg?w=1000&h=500&s=1 2x'); ?>" class="w-100 rounded"/>
							<img style="object-fit: cover;height: 40vh;" src="<?php echo (isset($picturesGallery[$imagekey + 2]) ? $picturesGallery[$imagekey + 2] : 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/88/14/95/kanching-rainforest-waterfall.jpg?w=500&h=300&s=1 1x,https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/88/14/95/kanching-rainforest-waterfall.jpg?w=1000&h=500&s=1 2x'); ?>" class="w-100 rounded"/>
						</div>
					</div>

					<div class="d-flex mt-2">
						<div class="flex-grow-1 gap-2">
							<strong><?php echo (!empty($data['state']) ? $data['state'] : '-'); ?></strong>
							<span>-</span>
							<?php echo (!empty($data['category']) ? $data['category'] : '-'); ?>
						</div>
					</div>

					<div class="d-flex flex-column p-4 bg-white rounded border mt-4">
						<h3><?php echo $data['shopping_name']; ?></h3>
						<p class="text-muted"><?php echo $data['description']; ?></p>

						<h5 class="h6 card-title">Information</h5>
						<ul class="list-unstyled my-2">
							<li class="mb-1 d-flex align-items-center gap-2">
								<i class="feather-sm" data-feather="navigation"></i><?php echo (!empty($data['direction']) ? $data['direction'] : 'Not stated'); ?>
							</li>
							<li class="mb-1 d-flex align-items-center gap-2">
								<i class="feather-sm" data-feather="map-pin"></i><?php echo (!empty($data['address']) ? $data['address'] : 'Not stated'); ?>
							</li>
							<li class="mb-1 d-flex align-items-center gap-2">
								<i class="feather-sm" data-feather="clock"></i><?php echo (!empty($data['operating']) ? $data['operating'] : 'Not stated'); ?>
							</li>
							<!-- <li class="mb-1 d-flex align-items-center gap-2">
								<i class="feather-sm" data-feather="globe"></i><a href="<?php echo (!empty($data['website']) ? $data['website'] : 'Not stated'); ?>"><?php echo (!empty($data['website']) ? $data['website'] : 'Not stated'); ?></a>
							</li> -->
							<li class="mb-1 d-flex align-items-center gap-2">
								<i class="feather-sm" data-feather="star"></i><?php echo (!empty($data['review']) ? $data['review'] : 'No review yet'); ?>
							</li>
						</ul>
					</div>

					<form method="POST" class="d-flex flex-column p-4 bg-white rounded border mt-4 gap-2">
						<h5 class="h6 card-title">Review Your Experience</h5>
						<p class="text-muted">Rate your experience by assigning stars to provide valuable feedback. Your input helps us enhance the overall user experience.</p>

						<div class="rating-box w-100 d-flex justify-content-center bg-light p-3 border rounded border-light"></div>

						<input name="rating-score" type="hidden" id="rating-value" />

						<?php
							if($hasSession){
								if($currentScore != 0){
									echo '<style>.rating-box{ pointer-events: none !important; }</style>';
									echo '<p class="text-success w-100 text-center">Your feedback has been submitted, Thank you</p>';
									echo '<a href="./place-list.php" class="btn btn-link"><i class="align-middle" data-feather="arrow-left"></i> Go Back</a>';
								}else{
									echo '<button name="submit-feedback" type="submit" class="btn btn-primary mt-4">Submit Feedback</button>';
								}
							}else{
								echo '<button disabled type="submit" class="btn btn-secondary mt-4">Please login first, to submit your feedback</button>';
							}
						?>
					</form>

					<?php if(!empty($customerFeedback)){ ?>
					<div class="card mt-4">
						<div class="card-header">
							<h5 class="card-title mb-0">Customer Feedback</h5>
						</div>
						<div class="card-body h-100">

						<?php
							foreach($customerFeedback as $value){
								$profilename = 'A user';
								$customerprofile = fetchRow("SELECT * FROM `login` WHERE `id` = ".$value['user_id']);

								if(!empty($customerprofile)){
									$profilename = (!empty($customerprofile['name']) ? $customerprofile['name'] : 'A user');
								}

								echo '
								<div class="d-flex align-items-start">
									<div style="height: 40px; width: 40px;" class="bg-info text-white rounded-circle me-2 d-flex align-items-center justify-content-center">'.substr($profilename, 0, 1).'</div>
									<div class="flex-grow-1">
										<strong>'.$profilename.'</strong> has provided a rating of '.$value['score'].' stars for '.$data['shopping_name'].'<br>
										<small class="text-muted">'.$value['created_date'].'</small><br>

									</div>
								</div><hr>';
							}
						?>

						</div>
					</div>
					<?php } ?>

				</div>
			</main>

			<?php include './include/footer.php'; ?>
		</div>
	</div>

	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="./vendor/star-rating/jquery.raty.js?id=3123"></script>

	<script>
		//# https://www.jqueryscript.net/other/Full-featured-Star-Rating-Plugin-For-jQuery-Raty.html
		$('.rating-box').raty({
			score: parseInt(`<?php echo $currentScore; ?>`),
			click: function(score, element, evt){
				$('#rating-value').val(score);
			}
		});
	</script>

	<?php
		if($hasSession){
			runQuery("INSERT INTO `recent_tracker` (`id`, `recent_visit`, `user_id`, `timestamp`) VALUES (NULL, '".$id."', '".$profileid."', current_timestamp())");

			if(isset($_POST['submit-feedback'])){
				$score = (isset($_POST['rating-score']) ? $_POST['rating-score'] : 0);
				
				runQuery("INSERT INTO `customer_feedback` (`id`, `place_id`, `user_id`, `score`) VALUES (NULL, ".$id.", '".$profileid."', ".$score.")");

				ToastMessage('Success', 'Thanks for your feedback!', 'success', 'place-list.php');
			}
		}
	?>
</body>
</html>
