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
            <li><a href="#" class="active">Add Lines</a>
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
                  <h4>Add  Lines</h4>
                  <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border">{if isset($added)}<h3 class="text-success ">Success : Line Created</h3>
                  <p class="text-warning">You have <strong>{$credit.0.credits}</strong> Credits remaining </p>
                  <hr width="90%"/>
                  <h1>You iptv line</h1>
                  <h4 align="center"><a href="http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$smarty.post.uname|escape}&amp;pass={$smarty.post.pass|escape}&amp;list={$display}" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$smarty.post.uname|escape}&amp;pass={$smarty.post.pass|escape}&amp;list={$display}</a></h4><hr width="90%"/>
                  <h2>Follow this video for ministra and stalkertv Apps</h2>
                  <script type="text/javascript" src="https://content.jwplatform.com/libraries/SaC5BzE9.js"></script>
            <div id='playerVZYnoYQMHZbl'></div>
<script type='text/javascript'>
    jwplayer('playerVZYnoYQMHZbl').setup({
	primary: "html5",
        file: 'http://in2iptv.com//video/stalker.mp4',
			 logo: {
		file: 'https://in2iptv.com/images/logo.png',
		link: 'http://in2iptv.com/',
		
	},
        image: 'http://in2iptv.com//prod/stalkerapp.jpg',
        width: '100%',
		height:'550'
    });
</script>
                  <p></p>
                  {/if}
                  {if isset($credits) && !$credits}
                  <h3 class="text-warning ">Error : You dont have enough credits to purchase this item</h3>
{/if}{if isset($error)}
<h3 class="text-warning ">{$error}</h3>
{/if} {if isset($taken1)}
<h3 class="text-warning ">Error : Username taken, please choose another,</h3>
                  {/if}
                  <form name="form1" method="post" action="">
                    <p>Username:<br>
                    
                    <input type="text" style="width:75%" name="uname" required id="uname">
                    
                    <br>
                    Password: 
                     <br>
                    <input type="text" style="width:75%" name="pass" required id="pass">
                    
                                                      <br>
                  email<br>
                  
                  <input type="email" style="width:75%"  name="email" required id="email">
                  <br>
                  Mac Address<br>
                  <label for="mac"></label>
                  <input name="mac" type="text" id="mac" style="width:75%"  value="none">
<br>
                  Plan:<br>
                  <label for="plan"></label>
                  <select name="plan" id="plan">
                    {foreach $iptv as $items}<option value="{$items.id}">{$items.name}</option>{/foreach}
                  </select>
                  <br>
                    </p>
                    <p>Line to add <br>
                  <label>
                    credits will be deducted from your account once you create a line.
                    
                    <select name="lines" id="lines" style="width:75%">
                      
                   {foreach $lines as $items} 
                      <option value="{$items.id}"> {$items.cost} credits - {$items.name}</option>
                      {/foreach}
                  
                    </select>
                  </label>
                  <br>
                  <input type="submit" name="sub" id="sub" onClick="return confirm('Are you sure you want to add this Line?');" value="Submit">
                    </p>
                  </form>
                
                </div>
              </div>
              </div>
          </div><div class="row">
            <div class="col-md-12">
              
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