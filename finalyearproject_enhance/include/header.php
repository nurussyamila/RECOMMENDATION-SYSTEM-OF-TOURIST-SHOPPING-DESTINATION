<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="<?php echo $logoicon; ?>" />

<title>Tourist Shopping Recommendation</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/app.css">
<link rel="stylesheet" href="./css/light.css">
<link rel="stylesheet" href="./css/theme.css">
<link rel="stylesheet" href="./css/primeflex.css">

<script src="js/jquery.min.js"></script>
<script src="js/app.js?v3"></script>

<?php
    function ToastMessage($title, $subtitle, $severity, $redirectTo){
        echo '<script>
        swal({
            title: "'.$title.'",
            text: "'.$subtitle.'",
            type: "'.$severity.'",
            showCancelButton: false,
            confirmButtonText: "Ok",
            closeOnConfirm: true
        }, function(){
            window.location.href = "'.$redirectTo.'";
        })
        </script>';
    }
?>