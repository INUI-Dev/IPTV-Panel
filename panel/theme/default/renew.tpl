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
          
          
          <img src="{$logo}" alt="" height="30" class="logo"/>               </a>
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
            <li><a href="#" class="active">Lines</a>
            </li>
          </ul><div class="row 2col">
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
                  <h4>Your Lines</h4>
                  
                </div>
                <div class="grid-body no-border">
                  {if isset($deleted)}<h3 class="text-success ">Success : Line Deleted</h3>
                  {/if}
                  {if $line.0.is_empty == 'true'}
                  <h2>No lines added</h2>
{else}{if isset($added)}<h3 class="text-success ">Success : Line Created</h3>
                  <p class="text-warning">You have <strong>{$total_credits}</strong> Credits remaining </p>
                  <p>&nbsp;</p>
                  {else}
<table class="table no-more-tables">
  <thead>
    <tr>
      <th>Name</th>
      <th>Username</th>
      <th>Password</th>
      <th>Last Watched</th>
      <th>Expires</th>
      <th>Delete </th>
    </tr>
  </thead>
  <tbody>
  </tbody>
  {foreach $line as $items}
  <tr>
    <td>{$items.name}</td>
    <td>{$items.user}</td>
    <td><span>{$items.pass}</span></td>
    <td><strong>{$items.last_viewed}</strong></td>
    <td>{$items.expires}</td>
    <td>
      <form name="form1" method="post" action=""><select name="lines" id="lines" style="width:75%">
                   {foreach $lines as $items} <option value="{$items.id}"> {$items.cost} credits - {$items.name}</option>{/foreach}
                  </select>
        <label>
        <input type="submit" name="Submit" value="Renew">
        </label>
      </form>
      </td>
  </tr>
  <tr>
    <td><strong>Line</strong></td>
    <td colspan="5"><a href="http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$items.user}&pass={$items.pass}&list={$items.display}" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$items.user}&amp;pass={$items.pass}&amp;list={$items.display}</a></td>
  </tr>
  <tr>
    <td colspan="6"><hr/></td>
  </tr>
  {/foreach}
</table>{/if}
{/if}                </div>
              </div>
              </div>
          </div><div class="row">
            <div class="col-md-12"></div>
          </div>
          <div class="row">
            <div class="col-md-6"></div>
          </div>
        </div>
        <!-- END PAGE -->
      </div>
      <!-- BEGIN CHAT -->
      <div class="chat-window-wrapper">
        <div id="main-chat-wrapper" class="inner-content">
          <div class="chat-window-wrapper" id="messages-wrapper" style="display:none">
            <div class="chat-header">
              <div class="pull-left">
                <input type="text" placeholder="search">
              </div>
              <div class="pull-right">
                <a href="#" class="">
                  <div class="iconset top-settings-dark "></div>
                </a>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="chat-messages-header">
              <div class="status online"></div><span class="semi-bold">Jane Smith(Typing..)</span>
              <a href="#" class="chat-back"><i class="icon-custom-cross"></i></a>
            </div>
            <div class="chat-messages scrollbar-dynamic clearfix">
              <div class="inner-scroll-content clearfix">
                <div class="sent_time">Yesterday 11:25pm</div>
                <div class="user-details-wrapper ">
                  <div class="user-profile">
                    <img src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" alt="" data-src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" data-src-retina="{$site_root}/panel/theme/default/assets/img/profiles/d2x.jpg" width="35" height="35">
                  </div>
                  <div class="user-details">
                    <div class="bubble">
                      Hello, You there?
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="sent_time off">Yesterday 11:25pm</div>
                </div>
                <div class="user-details-wrapper ">
                  <div class="user-profile">
                    <img src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" alt="" data-src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" data-src-retina="{$site_root}/panel/theme/default/assets/img/profiles/d2x.jpg" width="35" height="35">
                  </div>
                  <div class="user-details">
                    <div class="bubble">
                      How was the meeting?
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="sent_time off">Yesterday 11:25pm</div>
                </div>
                <div class="user-details-wrapper ">
                  <div class="user-profile">
                    <img src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" alt="" data-src="{$site_root}/panel/theme/default/assets/img/profiles/d.jpg" data-src-retina="{$site_root}/panel/theme/default/assets/img/profiles/d2x.jpg" width="35" height="35">
                  </div>
                  <div class="user-details">
                    <div class="bubble">
                      Let me know when you free
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="sent_time off">Yesterday 11:25pm</div>
                </div>
                <div class="sent_time ">Today 11:25pm</div>
                <div class="user-details-wrapper pull-right">
                  <div class="user-details">
                    <div class="bubble sender">
                      Let me know when you free
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="sent_time off">Sent On Tue, 2:45pm</div>
                </div>
              </div>
            </div>
            <div class="chat-input-wrapper" style="display:none">
              <textarea id="chat-message-input" rows="1" placeholder="Type your message"></textarea>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
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