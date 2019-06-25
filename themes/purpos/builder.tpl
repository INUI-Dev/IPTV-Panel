{include file='header.tpl'}
					
				</div>
			</div><!-- /.container -->
		</div><!-- Menu Block /- -->
	</header><!-- Header Section /- -->
	
	<!-- Page Banner -->
	<!-- Page Banner /- -->
    <!-- Product Section -->
<div id="product-section" class="product-section shop">
		<!-- container -->
		<div class="container">
			<div class="row">
				<!-- col-md-3 -->
			<div class="col-md-3 col-sm-4 product-sidebar">
				<aside class="widget service-category-widget">
					<h3>category menu</h3>
					<ul>
						{foreach $categories as $items}<li><i class="fa fa-long-arrow-right"></i><a title="Bathroom Cleaners" href="{$site_root}/categories.php?id={$items.url}">{$items.name}</a></li>{/foreach}
					</ul>
				</aside>
				
				<aside class="widget widget_search">
					<h3>SEARCH PRODUCT</h3>
					<form method="get" action="#" role="search" class="search">
						<input type="text" required="" class="form-control" placeholder="FIND HERE..." id="s" name="s">
						<span class="search-icon input-group-btn"><button type="submit" class="btn btn-xlg"></button></span>
					</form>
				</aside>
				<aside class="widget add-widget">
					
									<h3>Sponsors</h3>
									{$ads.top.0.code}					
				</aside>
			</div><!-- col-md-3 /- -->
			<!-- col-md-9 -->
			<div class="col-md-9 col-sm-8">
				<div align="center" style="margin-bottom:10px;">{$ads.top.0.code}</div><div class="product-category">
					<h4>IPTV Builder</h4>
						<ul>
						<li><a title="VOD" href="?">Video on demand</a></li>
						<li><a title="Live" href="?type=live">Live Streams</a></li>
					</ul>
				</div> 
				<h4>TYPE : {if isset($smarty.get.type)}Viewing Live{else}Viewing Video on demand{/if}</h4>
                <form method="get">Filter: <input placeholder="Filter by name" name="psearch" type="text" value="{if isset($smarty.get.psearch)}{$smarty.get.psearch|escape}{/if}" />
					     <label>
					     <input type="submit" name="Submit" value="Filter" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light"/>
					     </label>
					   </form><hr style="margin-bottom:30px;" />
					        <form name="form1" method="post" action="">
                              <h5 align="center"><a href="{$site_root}/account.html">                              Get my iptv url  </a>
                              </h5>
                            {if $iptv.0.is_empty == 'true'} <h4 style="margin-bottom:50px;">No videos found for your query</h4>{else} <table width="100%" border="1" cellpadding="10" cellspacing="10" bordercolor="#696969" class="padded">
                              <tr>
                                <th width="21%"><div class="spacer1">Select</div></th>
                                <th width="18%">Image</th>
                                <th width="61%"><div align="left">name</div></th>
                              </tr>
                            {foreach $iptv as $items}  <tr class='{cycle values="odd,even"}'>
                              <td><div class="spacer1 " id="{$items.id}" align="center">{if isset($items.used) && $items.used}Added <br>
                                <a href="javascript:void(0)" onclick="remove({$items.id})">Remove fron list </a>{else}<a href="javascript:void(0)" onclick="add_video({$items.id});">Add to list</a>{/if}</div></td>
                              <td><div class="spacer1">
                                <div align="center"  style="padding:10px;"><img src="{if isset($smarty.get.type) && $smarty.get.type == 'live'}{$site_root}/vidimgs/{$items.image}{else}{$items.image}{/if}" alt="{$items.name}" width="100px"/></div>
                              </div></td>
                                <td><div class="spacer1" align="center">
                                  <div align="left">{$items.name}</div>
                                </div></td>
                                </tr>{/foreach}
                            </table>
                            {/if}
					        </form>{include file='paginations-video.tpl'}
					        <p>
					          <section class="color_dark m_bottom_10 heading5 animate_ftr">  </section>
				          </p>
					        <!--products-->
					
							<section class="color_dark m_bottom_10 heading5 animate_ftr"></section>
			  </section></div>
			<!-- col-md-9 /- -->
			</div>
		</div><!-- container /- -->
</div><!-- Product Section /- -->
	
	<!-- Footer Section -->
	<footer id="footer" class="type_2">
				
				<!--copyright part-->
				<div class="footer_bottom_part">
					<div class="container clearfix t_mxs_align_c">
						<p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2019 <span class="color_light">IN2IPTV.com</span>. All Rights Reserved.</p>
						
					</div>
				</div>
			</footer>
	<!-- jQuery Include -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.min.js"></script>	
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.easing.min.js"></script><!-- Easing Animation Effect -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/bootstrap/bootstrap.min.js"></script> <!-- Core Bootstrap v3.3.4 -->
<script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false'></script>
<script src="{$site_root}/themes/{$theme_dir}/libraries/gmap/jquery.gmap.min.js"></script> <!-- Light Box -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/fuelux/jquery-ui.min.js"></script> <!-- Price Filter -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.animateNumber.min.js"></script> <!-- Used for Animated Numbers -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.appear.js"></script> <!-- It Loads jQuery when element is appears -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.knob.js"></script> <!-- Used for Loading Circle -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/wow.min.js"></script> <!-- Use For Animation -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/owl-carousel/owl.carousel.min.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/portfolio-filter/jquery.quicksand.js"></script> <!-- Portfolio Filter -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/modernizr.custom.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/flexslider/jquery.flexslider-min.js"></script> <!-- flexslider -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.magnific-popup.min.js"></script> <!-- Light Box -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/modernizr.custom.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/classie.js"></script> 
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/uisearch.js"></script>
<script>
		new UISearch( document.getElementById( 'sb-search' ) );
	</script>
   
<script type="text/javascript">
 
 {literal}function add_video(id)
{

$.getJSON("{/literal}{$site_root}{literal}/add_iptv.php?uname={/literal}{$smarty.server.REMOTE_ADDR}{if isset($smarty.get.type) && $smarty.get.type == 'live'}&type=live{/if}{literal}&id=" + id, function( json ) {
  
if(1 == 1)
  { $('#' + id).html('Added <a href="javascript:void(0)" onclick="remove(' + id + ')">Remove fron list </a>');
 $('#vidadded').html('<a href="#">Video Added To iptv plan</a>');
     $( "#vidadded" ).fadeIn( "slow", function() {
	 setTimeout(function() {
         $( "#vidadded" ).fadeOut( "slow", function() {

  });
    }, 5000);
  });
  }
  });
}
{/literal}
 {literal}function remove(id)
{

$.getJSON("{/literal}{$site_root}{literal}/remove_iptv.php?uname={/literal}{$user.0.uname}{$smarty.server.REMOTE_ADDR}{literal}&id=" + id, function( json ) {
  
if(json.added == 'true')
  { 
   $('#' + id).html('<a href="javascript:void(0)" onclick="add_video(' + id + ')">Add to list </a>');
	 $('#vidadded').html('<a href="#">Video Removed from list</a>');
     $( "#vidadded" ).fadeIn( "slow", function() {
	  setTimeout(function() {
         $( "#vidadded" ).fadeOut( "slow", function() {

  });
    }, 5000);
  });
  }
  });
}

{/literal}
 
 </script>
	<!-- Customized Scripts -->
<script src="{$site_root}/themes/{$theme_dir}/js/functions.js"></script>
	
</body>
</html>
