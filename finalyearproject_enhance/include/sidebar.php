<?php
    $sidebarLabel = '';
    $isCollapsed = 'collapsed';
    $sidebarMenu = [];
    $currentFile = constant("currentFile");
    $hasSession = (isset($_SESSION) && !empty($_SESSION));

    if($hasSession){
        $profileid    = (isset($_SESSION['account_admin']) ? $_SESSION['account_admin'] : $_SESSION['account_session']);
        $profiledata  = fetchRow("SELECT * FROM `login` WHERE id = '$profileid'");
        $accountType  = ($profiledata['type']);
        $accountData  = $profiledata;
        $isCollapsed  = '';
        $sidebarLabel = ($accountType == 1 ? 'Admin Dashboard' : 'User Dashboard');

        //# Admin
        if($accountType == 1){
            $sidebarMenu[] = (object) ['label' => 'Dashboard', 'icon' => 'table', 'path' => 'admin-index.php'];
            $sidebarMenu[] = (object) ['label' => 'Manage Places', 'icon' => 'map-pin', 'path' => 'admin-place.php'];
            $sidebarMenu[] = (object) ['label' => 'Add Places', 'icon' => 'plus', 'path' => 'admin-add-place.php'];
            $sidebarMenu[] = (object) ['label' => 'Registered User', 'icon' => 'users', 'path' => 'admin-users.php'];
            $sidebarMenu[] = (object) ['label' => 'Log Out', 'icon' => 'log-out', 'path' => 'home-logout.php'];
        }

        //# User
        if($accountType == 2){
            $sidebarMenu[] = (object) ['label' => 'Profile', 'icon' => 'user', 'path' => 'place-profile.php'];
            $sidebarMenu[] = (object) ['label' => 'Find Places', 'icon' => 'search', 'path' => 'place-list.php'];
            $sidebarMenu[] = (object) ['label' => 'Review History', 'icon' => 'star', 'path' => 'place-reviewer.php'];
            $sidebarMenu[] = (object) ['label' => 'Log Out', 'icon' => 'log-out', 'path' => 'home-logout.php'];
        }
    }
?>

<nav id="sidebar" class="sidebar js-sidebar <?php echo $isCollapsed; ?>">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.php">
            <span class="align-middle"><?php echo $sidebarLabel; ?></span>
        </a>

        <ul class="sidebar-nav">
        <?php
            $hasActiveTab = false;

            foreach($sidebarMenu as $menu){
                $isActive = ($currentFile == $menu->path ? 'active' : '');

                if($currentFile == $menu->path){
                    $hasActiveTab = true;
                }

                echo '<li class="sidebar-item '.$isActive.'">
                    <a class="sidebar-link" href="'.$menu->path.'">
                        <i class="align-middle" data-feather="'.$menu->icon.'"></i>
                        <span class="align-middle">'.$menu->label.'</span>
                    </a>
                </li>';
            }
        ?>
        </ul>
    </div>
</nav>