<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>{$slogan} Admin Palel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN PLUGIN CSS -->
    <link href="{$site_root}/panel/theme/default/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="{$site_root}/panel/theme/default/assets/plugins/bootstrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{$site_root}/panel/theme/default/assets/plugins/bootstrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="{$site_root}/panel/theme/default/assets/plugins/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="{$site_root}/panel/theme/default/assets/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" />
    <!-- END PLUGIN CSS -->
    <!-- BEGIN CORE CSS FRAMEWORK -->
    <link href="{$site_root}/panel/theme/default/webarch/css/webarch.css" rel="stylesheet" type="text/css" />
    <!-- END CORE CSS FRAMEWORK -->
</head>
  <!-- END HEAD -->
  <!-- BEGIN BODY -->
  <body class="">
    <!-- BEGIN HEADER -->
    <div class="header navbar navbar-inverse ">
      <!-- BEGIN TOP NAVIGATION BAR -->
      <div class="navbar-inner">
         <div class="header-seperation"><ul class="nav pull-left notifcation-center visible-xs visible-sm">
            <li class="dropdown">
              <a href="#main-menu" data-webarch="toggle-left-side">
                <i class="material-icons">menu</i>
              </a>
            </li>
          </ul><!-- BEGIN LOGO -->
          <div align="center"><a href="../" target="_blank">
          
          <img src="{$logo}" alt="" height="30" class="logo"/>          </a>
            <!-- END LOGO -->
          </div>
        </div>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- END TOP NAVIGATION MENU -->
      </div>
      <!-- END TOP NAVIGATION BAR -->
    </div>
    <!-- END HEADER -->
    <!-- BEGIN CONTAINER -->
<div class="page-container row">
      <!-- BEGIN SIDEBAR -->
      <div class="page-sidebar " id="main-menu">
        <!-- BEGIN MINI-PROFILE -->
        <div class="page-sidebar-wrapper scrollbar-dynamic" id="main-menu-wrapper">
          <!-- END MINI-PROFILE -->
          <!-- BEGIN SIDEBAR MENU -->
          {include file='menu.tpl'}
          <div class="clearfix"></div>
          <!-- END SIDEBAR MENU -->
          <!-- END SIDEBAR -->
          <!-- BEGIN PAGE CONTAINER-->
      </div>
      </div>
      <div class="page-content">
        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div class="clearfix"></div>
        <div class="content">
          <ul class="breadcrumb">
            <li>
              <p>YOU ARE HERE</p>
            </li>
            <li><a href="#" class="active">Home</a>
            </li>
          </ul>
          <div class="row 2col">
              <div class="col-md-3 col-sm-6 spacing-bottom-sm spacing-bottom">
                <div class="tiles blue added-margin">
                  <div class="tiles-body">
                   
                    <div class="tiles-title">Total Customers</div>
                    <div class="heading"><span class="animate-number" data-value="{$stats.0.total_rows}" data-animation-duration="1000">0</span> </div>
                 
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 spacing-bottom-sm spacing-bottom">
                <div class="tiles green added-margin">
                  <div class="tiles-body">
                    <div class="tiles-title">Credits remaining</div>
                    <div class="heading"><span class="animate-number" data-value="{$total_credits}" data-animation-duration="1000">0</span></div>
                    
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 spacing-bottom">
                <div class="tiles red added-margin">
                  <div class="tiles-body">
                    
                    <div class="tiles-title"> Total Live </div>
                    <div class="heading"><span class="animate-number" data-value="{$live.0.total_rows}" data-animation-duration="1000">0</span> </div>
                    
                    <div class="description"></div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="tiles purple added-margin">
                  <div class="tiles-body">
                  
                    <div class="tiles-title">Total VOD</div>
                    <div class="row-fluid">
                      <div class="heading"> <span class="animate-number" data-value="{$vod.0.total_rows}" data-animation-duration="1000">0</span> </div>
                   
                    </div>
                    <div class="description"></div>
                  </div>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="col-md-12">
              <div class="grid simple ">
                <div class="grid-title no-border">
                  <h4>Live Streams</h4>
                  
                </div>
                <div class="grid-body no-border">
                  {if $live.0.is_empty == 'true'}<h1>No live streams added</h1>{else}<table class="table no-more-tables">
                    <thead>
                      <tr>
                        <th style="width:20%">Chanle name </th>
                        <th style="width:20%">Image</th>
                        
                        <th style="width:35%">Category</th>
                        <th style="width:35%">Views</th>
                      </tr>
                    </thead>
                    <tbody>
                      {foreach $live as $items}<tr>
                        <td class="v-align-middle"><strong>{$items.name}</strong></td>
                        <td class="v-align-middle"><img  onerror="this.src='../vidimgs/noimg.jpg'"  class="image2" src="../vidimgs/{$items.image}" width="130px;"/></td>
                        <td class="v-align-middle">{$items.series}</td>
                        <td><span class="muted">{$items.views}</span>                        </td>
                        </tr>{/foreach}
                    </tbody>
                  </table>{/if}
                </div>
              </div>
            </div>
          </div><div class="row">
            <div class="col-md-12">
              <div class="grid simple ">
                <div class="grid-title no-border">
                  <h4>Video On demand</h4>
                  
                </div>
                <div class="grid-body no-border">
{if $vod.0.is_empty == 'true'}<h1>No VOD streams added</h1>{else}<table class="table no-more-tables">
                                        <thead>
                      <tr>
                        <th style="width:20%">Chanle name </th>
                        <th style="width:20%">Image</th>
                        </tr>
                    </thead>

                    <tbody>
                      {foreach $vod as $items}<tr>
                        <td class="v-align-middle"><strong>{$items.name}</strong></td>
                        <td class="v-align-middle"><img onerror="this.src='../vidimgs/noimg.jpg'" src="{$items.image}" width="130px;"/></td>
                        </tr>{/foreach}
                    </tbody>
                  </table>
{/if}
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6"></div>
          </div>
        </div>
        <!-- END PAGE -->
      </div>
      <!-- BEGIN CHAT -->
      <div class="chat-window-wrapper">
        
      </div>
      <!-- END CHAT -->
    </div>
    <!-- END CONTAINER -->
    <script src="{$site_root}/panel/theme/default/assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <!-- BEGIN JS DEPENDECENCIES-->
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/bootstrapv3/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-block-ui/jqueryblockui.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/plugins/bootstrap-select2/select2.min.js" type="text/javascript"></script>
    <!-- END CORE JS DEPENDECENCIES-->
    <!-- BEGIN CORE TEMPLATE JS -->
    <script src="{$site_root}/panel/theme/default/webarch/js/webarch.js" type="text/javascript"></script>
    <script src="{$site_root}/panel/theme/default/assets/js/chat.js" type="text/javascript"></script>
    <!-- END CORE TEMPLATE JS -->
    <script src="{$site_root}/panel/theme/default/assets/plugins/jquery-sparkline/jquery-sparkline.js"></script>
    <script>
    //TODO AT TO API
    $('table .checkbox input').click(function()
    {
      if ($(this).is(':checked'))
      {
        $(this).parent().parent().parent().toggleClass('row_selected');
      }
      else
      {
        $(this).parent().parent().parent().toggleClass('row_selected');
      }
    });
    // Demo charts - not required 
    $('.customer-sparkline').each(function()
    {
      $(this).sparkline('html',
      {
        type: $(this).attr("data-sparkline-type"),
        barColor: $(this).attr("data-sparkline-color"),
        enableTagOptions: true
      });
    });
    </script>
  </body>
</html>