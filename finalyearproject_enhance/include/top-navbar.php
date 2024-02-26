<?php
    $placeCategory = fetchRows("SELECT DISTINCT(`category`) FROM `places`");
    $placeState = fetchRows("SELECT DISTINCT(`state`) FROM `places`");

    $hasSession = (isset($_SESSION) && !empty($_SESSION));
    $accountData = [];
    $hiddenForAdmin = '';

    if($hasSession){
        $profileid = (isset($_SESSION['account_admin']) ? $_SESSION['account_admin'] : $_SESSION['account_session']);
        $profiledata = fetchRow("SELECT * FROM `login` WHERE id = '$profileid'");
        $accountData = $profiledata;

        if($profiledata['type'] == 1){
            $hiddenForAdmin = 'd-none';
        }
    }
?>
<nav class="navbar navbar-expand navbar-light navbar-bg">

    <a class="nav-icon pe-md-0 dropdown-toggle p-0 <?php echo $hiddenForAdmin; ?>" href="index.php">
        <img src="<?php echo $logoicon; ?>" class="avatar img-fluid rounded" alt="logo">
    </a>
    
    <a class="sidebar-toggle js-sidebar-toggle m-0 ms-3 d-none">
        <i class="hamburger align-self-center"></i>
    </a>
    
    <div class="navbar-collapse collapse">
        <ul class="navbar-nav navbar-align">

            <li class="nav-item px-2 dropdown">
                <ul class="navbar-nav d-none d-lg-flex">
                    <li class="nav-item px-2 dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="megaDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Discover
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-mega" aria-labelledby="megaDropdown">
                            <div class="d-md-flex align-items-start justify-content-start">
                                
                                <div class="dropdown-mega-list">
                                    <div class="dropdown-header">State</div>
                                    <?php
                                        if(!empty($placeState)){
                                            foreach($placeState as $c){
                                                if($c['state'] == '') continue;

                                                echo '<a class="dropdown-item" href="./place-list.php?search='.cleanString($c['state']).'">'.cleanString($c['state']).'</a>';
                                            }
                                        }else{
                                            echo 'No state';
                                        }
                                    ?>
                                </div>

                                <div class="dropdown-mega-list">
                                    <div class="dropdown-header">Category</div>
                                    <?php
                                        if(!empty($placeCategory)){
                                            foreach($placeCategory as $c){
                                                if($c['category'] == '') continue;

                                                echo '<a class="dropdown-item" href="./place-list.php?search='.cleanString($c['category']).'">'.cleanString($c['category']).'</a>';
                                            }
                                        }else{
                                            echo 'No category';
                                        }
                                    ?>
                                </div>
                                
                            </div>
                        </div>
                    </li>
                </ul>
            </li>

            <li class="nav-item px-2 dropdown <?php echo $hiddenForAdmin; ?>">
                <a class="nav-link" href="place-list.php">Find Places</a>
            </li>

            <li class="nav-item dropdown <?php echo $hiddenForAdmin; ?> <?php echo ($hasSession ? 'd-none' : ''); ?>">
                <a class="nav-link" href="home-login.php">Sign In</a>
            </li>

            <li class="nav-item dropdown <?php echo $hiddenForAdmin; ?> <?php echo ($hasSession ? 'd-none' : ''); ?>">
                <a class="nav-link" href="home-register.php">New User</a>
            </li>

            <li class="nav-item dropdown <?php echo ($hasSession ? '' : 'd-none'); ?>">
                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                    <i class="align-middle" data-feather="settings"></i>
                </a>

                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                    <span class="text-dark"><?php echo (!empty($accountData) ? $accountData['name'] : '') ?></span>
                </a>

                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="./home-logout.php"><i class="align-middle me-1" data-feather="log-out"></i> Log Out</a>
                </div>
            </li>

        </ul>
    </div>
</nav>
