<?php
    if(isset($_SESSION['account_session'])){
        //# Register search keyword history to browser
        $searchkeyword = fetchRows("SELECT * FROM `search_key` WHERE `user_id` = ".$_SESSION['account_session']);

        //# Store Search Keyword
        if(!empty($searchKey)){
            $storedKeyword = fetchRows("SELECT * FROM `search_key` WHERE `user_id` = ".$_SESSION['account_session']." AND `keyword` = '".$searchKey."'");

            if(empty($storedKeyword)){
                runQuery("INSERT INTO `search_key` (`id`, `user_id`, `keyword`) VALUES (NULL, ".$_SESSION['account_session'].", '".$searchKey."')");
            }
        }
    }
?>

<section class="flex align-items-center justify-content-end gap-6 py-4 sticky top-0 z-5">
    <form action="./place-list.php" method="GET" class="flex px-3 py-1 border-round border-1 border-400 w-30rem align-items-center gap-3">
        <input
            list="searchkeyword"
            type="text"
            name="search"
            class="flex-1 py-2 border-none outline-none"
            placeholder="Search for your favourite places!"
            value="<?php echo (isset($_GET['search']) ? $_GET['search'] : ''); ?>" />

        <a href="./place-list.php" class="text-sm no-underline text-blue-500 hover:text-blue-900">Clear</a>
    </form>
</section>


<datalist id="searchkeyword">
    <?php 
        if(!empty($searchkeyword)){
            foreach($searchkeyword as $value){
                echo '<option value="'.$value['keyword'].'">';
            }
        }
    ?>
</datalist>