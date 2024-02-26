<?php
    include './include/config.php';

    $getplace = fetchRow("SELECT * FROM `places` where id =".$_GET['id']);
    $flag = ($getplace['is_active'] == '0' ? '1' : '0');

    runQuery("UPDATE `places` SET `is_active` = $flag WHERE `places`.`id` =".$_GET['id']);

    echo "<script>window.location.href='admin-place.php'</script>";
?>