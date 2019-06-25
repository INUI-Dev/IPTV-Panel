<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
	<head>
		<title>{$page_title}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="icon" type="image/ico" href="{$site_root}/themes/{$theme_dir}/images/fav.ico">
		<!--stylesheet include-->
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/flexslider.css">
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/owl.carousel.css">
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/owl.transitions.css">
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/jquery.custom-scrollbar.css">
		<link rel="stylesheet" type="text/css" media="all" href="{$site_root}/themes/{$theme_dir}/css/style.css">
		<!--font include-->
		<link href="{$site_root}/themes/{$theme_dir}/css/font-awesome.min.css" rel="stylesheet">
		<script src="{$site_root}/themes/{$theme_dir}/js/modernizr.js"></script>
	</head><style type="text/css">
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
	<body>
<div id='basket-popup'><a href="{$site_root}/basket.html">Successfully added to basket<br>
Go to checkout</a></div>
		<!--boxed layout-->
		<div class="wide_layout relative w_xs_auto">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header type 2-->
			<header role="banner">
				<!--header top part-->
				<section class="h_top_part">
					<div class="container">
						<div class="row clearfix">
							<div class="col-lg-4 col-md-4 col-sm-3 t_xs_align_c">
								<p class="f_size_small">{if isset($user)} <a href="{$site_root}/account.html"><i class="fa fa-user"></i> My Account</a> - <a href="{$site_root}/?doLogout=true">Sign out</a> {else}Welcome visitor can you	<a href="{$site_root}/login.php?">Log In</a> or <a href="{$site_root}/register.php">Create an Account</a>{/if} </p>
						  </div>
							<nav class="col-lg-4 col-md-4 col-sm-6 t_align_c t_xs_align_c"></nav>
						  <div class="col-lg-4 col-md-4 col-sm-3 t_align_r t_xs_align_c"></div>
						</div>
					</div>
				</section>
				<!--header bottom part-->
				<section class="h_bot_part container">
					<div class="clearfix row">
						<div class="col-lg-6 col-md-6 col-sm-4 t_xs_align_c">
							<a href="#" class="logo m_xs_bottom_15 d_xs_inline_b">
							<img src="{$logo}" alt="" width="200px" >
							</a>
						</div>
						</div>
				</section>
				<!--main menu container-->
				<div class="container">
					<section class="menu_wrap type_2 relative clearfix t_xs_align_c m_bottom_20">
						<!--button for responsive menu-->
						<button id="menu_button" class="r_corners centered_db d_none tr_all_hover d_xs_block m_bottom_15">
							<span class="centered_db r_corners"></span>
							<span class="centered_db r_corners"></span>
							<span class="centered_db r_corners"></span>
						</button>
						<!--main menu-->
						<nav role="navigation" class="f_left f_xs_none d_xs_none t_xs_align_l">	
							<ul class="horizontal_list main_menu clearfix">
							
                              <li>
                                <a href="{$site_root}/" class="tr_delay_hover color_light tt_uppercase">
                                  Home                               </a>                              </li>
                              <li><a class="tr_delay_hover color_light tt_uppercase" href="{$site_root}/live.html">Free  Streams</a></li>
                              <li><a class="tr_delay_hover color_light tt_uppercase" href="{$site_root}/free-vod.html">Free VOD </a></li>
                              <li><a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/free-streams.html">Free Playlist</a></li>
                              {if isset($user)}<li>
                                <a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/account.html" >
                                 
                                Account</a></li>
                             {else}<li><a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/register.php">Join us</a></li> 
                             {/if}
                             <li><a  class="tr_delay_hover color_light tt_uppercase"href="{$site_root}/panel/">Reseller Panel  </a></li>
                             <li><a href="{$site_root}/watch_portal.php" class="tr_delay_hover color_light tt_uppercase">Setup on mag box</a></li>
					      </ul>
					  </nav>
						<ul class="f_right horizontal_list clearfix t_align_l t_xs_align_c site_settings d_xs_inline_b f_xs_none">
							<!--like--><!--shopping cart-->
							<li class="m_left_5 relative container3d" id="shopping_button">
								<a role="button" href="#" class="button_type_3 color_light bg_scheme_color d_block r_corners tr_delay_hover box_s_none"><b>{$curency}{if $basket.0.is_empty == 'true'}0{else}
                                    {assign var=var value=0}
                                    {foreach $basket as $items}
{capture assign=var}{$var+$items.price}{/capture}{/foreach}{$var}</b>							{/if}	</a>
						        <div class="shopping_cart top_arrow tr_all_hover r_corners">
									<div class="f_size_medium sc_header">Recently added item(s)</div>
									{if $basket.0.is_empty == 'true'}<h3>Basket Empty</h3>{else}<ul class="products_list">{foreach $basket as $items}<li>
										<div class="clearfix">
											<!--product image-->
										  <img src="{$site_root}/prod/{$items.image}" alt="" width="75" class="f_left m_right_10">
											<!--product description-->
											<div class="f_left product_description">{$items.name}</div>
											<!--product price-->
											<div class="f_left f_size_medium">
												<div class="clearfix"><b class="color_dark">{$curency}{$items.price}</b>													</div>
												</div>
										</div>
										</li>{/foreach}
							  </ul><!--total price--><ul class="total_price bg_light_color_1 t_align_r color_dark">
						        <li>Total: <b class="f_size_large bold scheme_color sc_price t_align_l d_inline_b m_left_15">{$curency}{$var}</b></li>
									</ul>{/if}
						      
<div class="sc_footer t_align_c"><a href="{$site_root}/basket.html" role="button" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light">Checkout</a>									</div>
							  </div>
						  </li>
					  </ul>
				  </section>
				</div>
			</header>