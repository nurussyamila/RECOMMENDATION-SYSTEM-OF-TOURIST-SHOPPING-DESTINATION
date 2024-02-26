<?php
    include './include/config.php';

    function searchKeyword($key){
        $searchableColumns = [
            'shopping_name',
            'state',
            'category',
            'address',
            'operating',
            'review',
            'website',
            'description',
            'direction',
            'contact_number'
        ];

        $whereClause = '';

        foreach ($searchableColumns as $column) {
            $whereClause .= "`$column` LIKE '%$key%' OR ";
        }

        $whereClause = rtrim($whereClause, ' OR ');

        return fetchRows("SELECT * FROM `places` WHERE $whereClause");
    }

    function searchCoordinate($userLatitude, $userLongitude){
        $maxDistance = 10;
        return fetchRows("SELECT *, (6371 * acos(cos(radians($userLatitude)) * cos(radians(latitude)) 
        * cos(radians(longitude) - radians($userLongitude)) + sin(radians($userLatitude)) * sin(radians(latitude))))
         AS distance FROM `places` HAVING distance <= $maxDistance ORDER BY distance LIMIT 4");
    }
    
    function picturesGallery(){
        $arrayOfString = [];
        $pictures = fetchRows("SELECT * FROM `pictures`");

        foreach ($pictures as $picture) {
            $arrayOfString[] = $picture['primary'] . ', ' . $picture['secondary'] . ', ' . $picture['tertiary'];
        }

        return $arrayOfString;
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<?php include './include/header.php'; ?>

    <style>
        .truncated-line {
            width:100%;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            background:#fff;
        }
    </style>
</head>

<body>
	<div class="wrapper">
		<?php include './include/sidebar.php'; ?>

		<div class="main">
			<?php include './include/top-navbar.php'; ?>

			<main class="content">
				<div class="container p-0">

                    <div class="row">
                        <!--#START Search Bar -->
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <?php include './include/place-search.php'; ?>
                                </div>
                            </div>
                        </div>

                        <!--#START Search Content -->
                        <?php 
                            $searchKey = ($_GET['search'] ?? '');
                            $keywordResult = searchKeyword($searchKey);
                            $picturesGallery = picturesGallery();

                            if(!empty($keywordResult)){
                                $idsToExclude = [];
                                $coordinateResult = [];

                                //# Search Headline
                                if(!empty($searchKey)){
                                    echo '<h3>Search Results for: ' . $searchKey . '</h3>';
                                }

                                //# Search Body
                                foreach($keywordResult as $key => $value){
                                    $reviewScoreDB = fetchRow("SELECT COUNT(*) as reviewer FROM `customer_feedback` WHERE `place_id` = ".$value['id']);
                                    $totalReview = (!empty($reviewScoreDB['reviewer']) ? $reviewScoreDB['reviewer'] : 0);

                                    //# Search nearest coordinate
                                    if(!empty($searchKey)){
                                        $coordinateResult[] = searchCoordinate($value['latitude'], $value['longitude']);
                                    }

                                    //# Collect showed id
                                    $idsToExclude[] = $value['id'];

                                    echo '
                                    <div class="col-12 md:col-6 lg:col-3">
                                        <a href="./place-view.php?id='.$value['id'].'&key='.$key.'" class="surface-0 no-underline flex flex-column w-full h-full border-1 border-100 border-round shadow-1 border-round cursor-pointer hover:shadow-3 hover:border-blue-400 transition-all transition-duration-300">
            
                                            <img src=" ' . (isset($picturesGallery[$key]) ? $picturesGallery[$key] : 'https://picsum.photos/300/200?random='.$key) . ' " class="h-10rem border-2 border-300 border-round-top" style="object-fit: cover;">
            
                                            <div class="flex flex-column w-full h-full gap-2 p-3">
                                                <span class="text-800 font-semibold flex-1 text-left text-xl">' . (!empty($value['shopping_name']) ? $value['shopping_name'] : 'No label') . '</span>

                                                <p class="card-text text-muted truncated-line">'.(!empty($value['description']) ? $value['description'] : 'No description').'</p>

                                                <span class="d-flex align-items-center gap-2 text-muted fw-bold">'.(!empty($value['category']) ? $value['category'] : '-').'</span>

                                                <span class="d-flex align-items-center gap-2 text-muted mt-1">
                                                    <i class="feather-sm" data-feather="star"></i>'.((int)$value['review'] + (int)$totalReview).' Review
                                                </span>
                                            </div>
                                        </a>
                                    </div>';
                                }

                                //# Result of nearest coordinate from the search result
                                if(!empty($coordinateResult)){

                                    $flattenedAndUnique = array_unique(array_reduce($coordinateResult, 'array_merge', []), SORT_REGULAR);

                                    $filteredPlaces = array_filter($flattenedAndUnique, function ($place) use ($idsToExclude) {
                                        return !in_array($place["id"], $idsToExclude);
                                    });

                                    if(!empty($filteredPlaces)){
                                        echo '<h3 class="text-md mt-4">Nearest places</h3>';

                                        foreach($filteredPlaces as $key => $value){
                                            echo '
                                            <div class="col-12 md:col-6 lg:col-3">
                                                <a href="./place-view.php?id='.$value['id'].'&key='.$key.'" class="surface-0 no-underline flex flex-column w-full h-full border-1 border-100 border-round 
                                                shadow-1 border-round cursor-pointer hover:shadow-3 hover:border-blue-400 transition-all transition-duration-300">
                    
                                                <img src=" ' . (isset($picturesGallery[$key]) ? $picturesGallery[$key] : 'https://picsum.photos/300/200?random='.$key) . ' " class="h-10rem border-2 
                                                border-300 border-round-top" style="object-fit: cover;">
                    
                                                    <div class="flex flex-column w-full h-full gap-2 p-3">
                                                        <span class="text-800 font-semibold flex-1 text-left text-xl">' . (!empty($value['shopping_name']) ? $value['shopping_name'] : 'No label') . '</span>

                                                        <p class="card-text text-muted truncated-line">'.(!empty($value['description']) ? $value['description'] : 'No description').'</p>

                                                        <span class="d-flex align-items-center gap-2 text-muted fw-bold">'.(!empty($value['category']) ? $value['category'] : '-').'</span>

                                                        <span class="d-flex align-items-center gap-2 text-muted mt-1">
                                                            <i class="feather-sm" data-feather="map"></i>' . number_format($value['distance'], 3) . ' KM
                                                        </span>
                                                    </div>
                                                </a>
                                            </div>';
                                        }
                                    }
                                }
                            }else{

                                //# No result found
                                echo '<div class="col-12 md:col-6 lg:col-3"><span class="text-lg font-italic">No Records Found</span></div>';
                            }
                        ?>
                    </div>
                    <!--#END Search Content -->

				</div>
			</main>

			<?php include './include/footer.php'; ?>
		</div>
	</div>

    <script>
        function switchInterest($mode){
            if($mode == false){
                window.location.href= './place-list.php?interest';
            }else{
                window.location.href= './place-list.php';
            }
        }
    </script>
</body>
</html>
