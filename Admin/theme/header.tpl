<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="en"> <!--<![endif]--><head>
        <meta charset="utf-8">

        <title>{$text_top}  panel</title>

         {if isset($key_desc)}
    <meta name="description" content="{$key_desc}">
      {/if}  {if isset($key_key)}
        <meta name="keywords" content="{$key_key}">
      {/if}
     <link rel="shortcut icon" href="{$site_root}/Admin/theme/img/favicon.png">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon57.png" sizes="57x57">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon72.png" sizes="72x72">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon76.png" sizes="76x76">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon114.png" sizes="114x114">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon120.png" sizes="120x120">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon144.png" sizes="144x144">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon152.png" sizes="152x152">
        <link rel="apple-touch-icon" href="{$site_root}/Admin/theme/img/icon180.png" sizes="180x180">
        <!-- END Icons -->

        <!-- Stylesheets -->
        <!-- Bootstrap is included in its original form, unaltered -->
        <link rel="stylesheet" href="{$site_root}/Admin/theme/css/bootstrap.min.css">

        <!-- Related styles of various icon packs and plugins -->
        <link rel="stylesheet" href="{$site_root}/Admin/theme/css/plugins.css">

        <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
        <link rel="stylesheet" href="{$site_root}/Admin/theme/css/main.css">

        <!-- Include a specific file here from {$site_root}/Admin/theme/css/themes/ folder to alter the default theme of the template -->

        <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
        <link rel="stylesheet" href="{$site_root}/Admin/theme/css/themes.css">
        <!-- END Stylesheets -->

        <!-- Modernizr (browser feature detection library) -->
        <script src="{$site_root}/Admin/theme/js/vendor/modernizr.min.js"></script>
    </head>
    <body>
        <!-- Page Wrapper -->
        <!-- In the PHP version you can set the following options from inc/config file -->
        <!--
            Available classes:

            'page-loading'      enables page preloader
        -->
        <div id="page-wrapper">
            <!-- Preloader -->
            <!-- Preloader functionality (initialized in {$site_root}/Admin/theme/js/app.js) - pageLoading() -->
            <!-- Used only if page preloader is enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->
    <div class="preloader themed-background">
                <h1 class="push-top-bottom text-light text-center"><strong>{$slogan}</strong></h1>
                <div class="inner">
                  <h3 class="text-light visible-lt-ie10"><strong>Loading..</strong></h3>
                    <div class="preloader-spinner hidden-lt-ie10"></div>
                </div>
            </div>
    <div id="page-container" class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
                <!-- Alternative Sidebar --><!-- END Alternative Sidebar -->

                <!-- Main Sidebar -->
                <div id="sidebar">
                    <!-- Wrapper for scrolling functionality -->
                    <div id="sidebar-scroll">
                        <!-- Sidebar Content -->
    <div class="sidebar-content">
                            <!-- Brand -->
      <a href="../" class="sidebar-brand" target="_blank">
                                <i class="gi gi-flash"></i><span class="sidebar-nav-mini-hide"><strong>In2Iptv</strong></span>
                            </a>
                            <!-- END Brand -->

                            <!-- User Info -->
      <div align="center"> <img src="https://in2iptv.com/images/logo.png" alt="avatar" width="70%"></div>

     
      <!-- END Theme Colors -->

                            <!-- Sidebar Navigation -->
                            <ul class="sidebar-nav">
                              
                                <li> <a href="../?doLogout=true"> <i class="fa fa-wrench sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Log Out</span></a> </li>  <li>
                                  <a href="?"><i class="gi gi-stopwatch sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Home</span></a>
                                </li>
                               
                               <li> <a href="?pname=limit"> <i class="fa fa-wrench sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Manage Devices</span></a> </li>
                               
                               <li> <a href="?pname=themes"> <i class="fa fa-wrench sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">change theme</span></a> </li>
                               <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='streams' or $smarty.get.pname =='add-ministra' or $smarty.get.pname =='ministra-users' or  $smarty.get.pname =='ministra-import' or  $smarty.get.pname =='ministra-vod' or  $smarty.get.pname =='ministra-users' or  $smarty.get.pname =='ministra_vod'}active{/if}"> <a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-film sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Ministra server</span></a>
                                 <ul>
                                  <li>
                                  <a href="{$ministra}/{$ministra_dir}/" target="_blank">
                                 <span class="sidebar-nav-mini-hide">Manage ministra Server</span></a>
                                </li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='add-ministra'}active{/if}"><a href="?pname=add-ministra">Add Ministra User</a></li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='ministra-users'}active{/if}"><a href="?pname=ministra-users">Manage  Ministra users</a></li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='ministra-import'}active{/if}"><a href="?pname=ministra-import&add=true">Get live From ministra</a></li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='ministra-vod'}active{/if}"><a href="?pname=ministra-vod">Get Vod from ministra</a></li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='ministra_vod'}active{/if}"><a href="?pname=ministra_vod&add=true">Upload  Vod to ministra</a></li>
                                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='streams'}active{/if}"><a href="?pname=streams&add=true">Upload  Live to ministra</a></li>
                                  <li><a href="../watch_portal.php" target="_blank">Setting up on mag box</a></li> 
                                 </ul>
                               </li>
                               <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='live' or $smarty.get.pname =='add-vod' or $smarty.get.pname =='single' or $smarty.get.pname =='new-iptv' or $smarty.get.pname =='live-url' or $smarty.get.pname =='on-demand' or $smarty.get.pname =='vod-url' or $smarty.get.pname =='addyt' or $smarty.get.pname =='vod'}active{/if}"> <a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-film sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Streams</span></a>
                                 <ul class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname !='live' and $smarty.get.pname !='addyt'  and $smarty.get.pname !='vod'  and $smarty.get.pname !='add-vod' and $smarty.get.pname !='single' and $smarty.get.pname !='on-demand' and $smarty.get.pname !='new-iptv' and $smarty.get.pname !='live-url' and $smarty.get.pname !='vod-url'}sub-menu{/if}">
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-vod'}active{/if}"><a href="?pname=add-vod">Add single VOD </a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='single'}active{/if}"><a href="?pname=single">Add single Live </a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='new-iptv'}active{/if}"><a href="?pname=new-iptv">Import Live  M3u</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='live-url'}active{/if}"><a href="?pname=live-url">Import Live M3u url</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='on-demand'}active{/if}"><a href="?pname=on-demand">Import VOD  M3u</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='vod-url'}active{/if}"><a href="?pname=vod-url">Import VOD M3u url</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='addyt'}active{/if}"><a href="?pname=addyt">Add Youtube Video</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='vod'}active{/if}"><a href="?pname=vod">Manage VOD Streams</a></li>
                                   <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='live'}active{/if}"><a href="?pname=live">Manage LIVE Streams</a></li>
                                 </ul>
                               </li>
                               <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='credits' or $smarty.get.pname == 'add-reseller-user'}active{/if}">
                                    <a href="#" class="sidebar-nav-menu"><i class="gi gi-film sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><span class="sidebar-nav-mini-hide">Reseller</span></a>
                                    <ul class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname !='resellers' and $smarty.get.pname !='add-reseller' and $smarty.get.pname !='add-reseller-user' and $smarty.get.pname !='credits'}sub-menu{/if}">
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-reseller'}active{/if}"><a href="?pname=credits">Manage Credit plans</a></li>
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='credits'}active{/if}"><a href="?pname=credits&add=true">Add Credit plans</a></li>
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-reseller-user'}active{/if}"><a href="?pname=add-reseller-user">Add New Reseller user</a></li>
                      </ul>
                              </li>
                                 <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='lines' or $smarty.get.pname == 'add_line' or $smarty.get.pname == 'add-package' or $smarty.get.pname == 'iptv'}active{/if}">
                                    <a href="#" class="sidebar-nav-menu"><i class="gi gi-film sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><span class="sidebar-nav-mini-hide">IPTV</span></a>
                                    <ul class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname !='add-package' and $smarty.get.pname !='iptv' and $smarty.get.pname !='lines' and $smarty.get.pname !='add_line'}sub-menu{/if}">
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='lines'}active{/if}"><a href="?pname=lines">Manage Lines</a></li>
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add_line'}active{/if}"><a href="?pname=add_line">Add New Line</a></li><li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-package'}active{/if}"><a href="?pname=add-package&add=true">Create   Iptv m3u</a></li>
                      <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='iptv'}active{/if}"><a href="?pname=iptv">Manage iptv Plans</a></li>
                         </ul>
                                </li>
                                <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='categories' or $smarty.get.pname =='video-cate'}active{/if}">                                    <a href="#" class="sidebar-nav-menu"><i class="gi gi-film sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><span class="sidebar-nav-mini-hide">Video Categories</span></a>
                                    <ul class="{if isset($smarty.get.pname) && $smarty.get.pname !='add-package' and $smarty.get.pname !='video-cate'}sub-menu{/if}">
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='video-cate'}active{/if}"><a href="?pname=video-cate">Manage Categories</a></li>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='video-cate'}active{/if}"><a href="?pname=video-cate&add=true">Add Category</a></li>
                    </ul>
                                </li>
                                <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='support'}active{/if}">  
                                    <a href="#" class="sidebar-nav-menu">
                                  <i class="fa fa-wrench sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i>Support</a>
                                  <ul {if isset($smarty.get.pname) && $smarty.get.pname =='support'}{else}class="sub-menu"{/if}>
                            <li><a href="?pname=support&add=true">Add support article</a></li>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='support'}active{/if}"><a href="?pname=support">Manage Articles</a></li>
                    </ul>
                                </li>
                              <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='ads'}active{/if}">  
                                 
                                    <a href="#" class="sidebar-nav-menu">
                                <i class="fa fa-wrench sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i>Manage Ads</a>
                                    <ul {if isset($smarty.get.pname) && $smarty.get.pname =='ads'}{else}class="sub-menu"{/if}>
                            <li><a href="?pname=ads">Manage Ads</a></li>
                    </ul>
                              </li>
                              <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='users' or $smarty.get.pname =='add_user'}active{/if}">  
                                 
                                    <a href="#" class="sidebar-nav-menu">
                                  <i class="fa fa-wrench sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><span class="sidebar-nav-mini-hide">users</span></a>
                                    <ul>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add_user'}active{/if}"><a href="?pname=add_user&add=true">Add User</a></li>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='users'}active{/if}"><a href="?pname=users">Manage users</a></li>
                    </ul>
                              </li>
                  <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='files' or $smarty.get.pname =='addfile' or $smarty.get.pname =='add-reseller' or $smarty.get.pname =='resellers'}active{/if}">  
                                    <a href="#" class="sidebar-nav-menu"><i class="gi gi-film sidebar-nav-icon"></i><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><span class="sidebar-nav-mini-hide">Products</span></a>
                                    <ul>
                  <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='files'}active{/if}"><a href="?pname=files">Manage Products</a></li>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='addfile'}active{/if}"><a href="?pname=addfile">Add iptv product</a></li>
                            <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-reseller'}active{/if}"><a href="?pname=add-reseller">Add Reseller Product</a></li>
                          <li class="{if !isset($smarty.get.pname) or isset($smarty.get.pname) && $smarty.get.pname =='add-reseller'}active{/if}"><a href="?pname=resellers">Manage Reseller Products</a></li>
                  </ul>
                              </li><li>
                                  <a href="?pname=settings">
                                  <i class="fa fa-wrench sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Settings</span></a>
                                </li>
                                <li class="{if isset($smarty.get.pname) && $smarty.get.pname =='cate'}active{/if}">
                                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="fa fa-wrench sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">Product Categories</span></a>
                                  <ul class="sub-menu">
                            <li><a href="?pname=cate">Manage Categories</a></li>
                            <li><a href="?pname=cate&add=true">Add Category</a></li>
                    </ul>
                                </li>
                          </ul>
                            <!-- END Sidebar Navigation -->

                            <!-- Sidebar Notifications -->
      <div class="sidebar-header sidebar-nav-mini-hide"></div>
    </div>