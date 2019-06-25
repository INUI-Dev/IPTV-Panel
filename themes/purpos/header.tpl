<!doctype html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class=""> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">	
	<title>{$page_title}</title>
			<link rel="shortcut icon" href="images/favicon.png">
    <link href="{$site_root}/themes/{$theme_dir}/libraries/bootstrap/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="{$site_root}/themes/{$theme_dir}/libraries/fuelux/jquery-ui.min.css">
    <linK href="{$site_root}/themes/{$theme_dir}/libraries/owl-carousel/owl.carousel.css" rel="stylesheet"/> 
    <linK href="{$site_root}/themes/{$theme_dir}/libraries/owl-carousel/owl.theme.css" rel="stylesheet"/> 
	<link href="{$site_root}/themes/{$theme_dir}/libraries/fonts/font-awesome.min.css" rel="stylesheet"/>
	<link href="{$site_root}/themes/{$theme_dir}/libraries/animate/animate.min.css" rel="stylesheet"/>
	<link href="{$site_root}/themes/{$theme_dir}/libraries/flexslider/flexslider.css" rel="stylesheet" /> <!-- flexslider -->
	<link href="{$site_root}/themes/{$theme_dir}/libraries/magnific-popup.css" rel="stylesheet" />
    <link href="{$site_root}/themes/{$theme_dir}/css/components.css" rel="stylesheet"/>
	<link href="{$site_root}/themes/{$theme_dir}/style.css" rel="stylesheet"/>
    <link href="{$site_root}/themes/{$theme_dir}/css/media.css" rel="stylesheet"/>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="{$site_root}/themes/{$theme_dir}/js/html5/html5shiv.min.js"></script>
      <script src="{$site_root}/themes/{$theme_dir}/js/html5/respond.min.js"></script>
    <![endif]-->

	<link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    {literal}<script type="text/javascript">function add_basket(id)
{

$.getJSON("{/literal}{$site_root}{literal}/basket.php?uname={/literal}{$smarty.server.REMOTE_ADDR}{literal}&id=" + id, function( json ) {
  if(json.added == 'true')
  { 
  $( "#basket-popup" ).slideDown( "slow", function() {
  $.get( "{/literal}{$site_root}{literal}/basket-box2.php", function( data ) {
  $( "#basket_box" ).html( data );
});
  });
  }
  if(json.added == 'false')
  {$( "#basket-popup" ).slideDown( "slow", function() {
$.get( "{/literal}{$site_root}{literal}/basket-box2.php", function( data ) {
  $( "#basket_box" ).html( data );
});  });
  }
 });
 
 $.get( "{/literal}{$site_root}{literal}/basket-box2.php", function( data ) {
  $( "#basket_box" ).html( data );
});
 
 }{/literal}
 
 
 </script>
    <style type="text/css">
	.basket-item{
font:bold;
border-bottom:#CCCCCC 1px solid;
padding:5px;
}

#vidadded{
position:fixed;
padding:10px;
margin:5px;
border:#003300 1px solid;
color:#000000;
font-weight:bold;
background: #9dd53a; /* Old browsers */
background: -moz-linear-gradient(top, #9dd53a 0%, #a1d54f 50%, #80c217 51%, #7cbc0a 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #9dd53a 0%,#a1d54f 50%,#80c217 51%,#7cbc0a 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #9dd53a 0%,#a1d54f 50%,#80c217 51%,#7cbc0a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9dd53a', endColorstr='#7cbc0a',GradientType=0 ); /* IE6-9 */
right:10px;
bottom:0;
display:none;
z-index:10010;}
#basket-popup{
position:fixed;
padding:10px;
margin:5px;
border:#003300 1px solid;
color:#000000;
font-weight:bold;
background: #9dd53a; /* Old browsers */
background: -moz-linear-gradient(top, #9dd53a 0%, #a1d54f 50%, #80c217 51%, #7cbc0a 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #9dd53a 0%,#a1d54f 50%,#80c217 51%,#7cbc0a 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #9dd53a 0%,#a1d54f 50%,#80c217 51%,#7cbc0a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9dd53a', endColorstr='#7cbc0a',GradientType=0 ); /* IE6-9 */
right:10px;
bottom:0;
display:none;
z-index:10010;}</style>
</head>
<body data-offset="200" data-spy="scroll" data-target=".primary-navigation">
<div id='basket-popup'><a href="{$site_root}/basket.html">Successfully added to basket<br>
Go to checkout</a></div>
	<a id="top"></a>
	
	<!-- Header Section -->
	<header id="header-section" class="header-section">

		<!-- Top Header -->
		<div class="top-header">
			<!-- container -->
			<div class="container">
				<div class="row">
					<!-- col-md-6 -->
					<div class="col-md-6 col-sm-6">{if isset($user)} <a href="{$site_root}/account.html"><i class="fa fa-user"></i> My Account</a> - <a href="{$site_root}/?doLogout=true">Sign out</a> {else}Welcome visitor can you	<a href="{$site_root}/login.php?">Log In</a> or <a href="{$site_root}/register.php">Create an Account</a>{/if} </p>
					</div>
                </div>
			</div><!-- container /- -->
		</div><!-- Top Header /- -->
		
		<!-- Logo Block -->
		<div class="logo-block">
			<!-- container -->
			<div class="container">
				<div class="row">
					<!-- col-md-2 -->
					<div class="col-md-3 col-sm-4">
						<a title="Logo" href="index.html"><img src="{$logo}" alt="logo" /></a>
					</div><!-- col-md-2 /- -->
					<!-- col-md-4 -->
					<div class="col-md-6 col-sm-8 pull-right row">
						<!-- col-md-7 -->
						<div class="col-md-6 col-sm-6 col-sm-offset-2 col-md-offset-2 call-us">
							<p>&nbsp;</p>
					  </div><!-- col-md-7 /- -->
                        <!-- col-md-5 -->
<div class="cart col-md-4 col-sm-4 text-right ow-padding-left" id="basket_box">
							<p>{if $basket.0.is_empty == 'false'}{assign var=var value=0}{assign var=var2 value=0}
                                    {foreach $basket as $items}{capture assign=var}{$var+$items.price}{/capture}{capture assign=var2}{$var2 + 1}{/capture}{/foreach}
								<i class="cart-icon">{$var2}</i>
								cart - {$curency} {$var}<br>
<a href="{$site_root}/basket.html">Go to checkout</a>{else}	<i class="cart-icon">0</i>Cart Empty</i>{/if}							</p>
							
					  </div><!-- col-md-5 /- -->
				  </div><!-- col-md-4 /- -->
				</div>
			</div>
		</div><!-- Logo Block /- -->
		
		<!-- Menu Block -->
		<div class="menu-block">
			<div class="container">
				<div class="row">
					<!-- col-md-8 -->
					<nav class="navbar navbar-default col-md-8" style="width:100%;">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a title="Logo" href="index.html"><img alt="logo" src="{$site_root}/themes/{$theme_dir}/images/responsive-logo.png"></a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="width:100%">
							<ul class="nav navbar-nav">
							
                              <li>
                                <a href="{$site_root}/" class="tr_delay_hover color_light tt_uppercase">
                              Home                               </a>                              </li>
                             <li class="dropdown">
									<a  title="Services" href="#" class="dropdown-toggle" data-toggle="dropdown">Free Stuff</a>
									<ul class="dropdown-menu" role="menu">
										<li><a class="tr_delay_hover color_light tt_uppercase" href="{$site_root}/free-vod.html">Free VOD </a></li>
                              <li><a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/free-streams.html">Free Playlist</a></li>
                              <li><a class="tr_delay_hover color_light tt_uppercase" href="{$site_root}/live.html">Free Live Stream</a></li>
									</ul>
							  </li> <li>
                                <a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/account.html" >
                                 
                                Account</a></li>
                             <li><a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/panel/">Reseller Panel  </a></li>
						     <li><a href="{$site_root}/contact.php">Contact us</a></li>
						     <li><a href="{$site_root}/support.html">Support</a></li> <li><a href="{$site_root}/watch_portal.php" class="tr_delay_hover color_light tt_uppercase">Setup on mag box</a></li>
						  </ul>
					  </div><!-- /.navbar-collapse -->
					</nav><!-- col-md-8 /- -->