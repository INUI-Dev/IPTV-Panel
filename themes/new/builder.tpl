{include file='header.tpl'}
			<!--slider with banners--><!--content-->
			<div class="page_content_offset">
				<div class="container">
					<!--banners-->
				  <div class="row clearfix">
						<aside class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
							<!--widgets-->
							<figure class="widget animate_ftr shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Categories</h3>
								</figcaption>
								<div class="widget_content">
								  <ul class="categories_list">
							  {foreach $categories as $items}<li><a href="{$site_root}/categories/{$items.url}"><i class="ti-direction-alt">
                      </i> 
                 <b> {$items.name}</b> </a> </li>{/foreach}
								  </ul>
							  </div>
						  </figure>
							<!--Sponsors-->
							<figure class="widget animate_ftr shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Sponsors</h3>
								</figcaption>
								<div class="widget_content">
									{$ads.top.0.code}					</div>
				      </figure>
							<!--Bestsellers--><!--tags-->
						</aside>	<section class="col-lg-9 col-md-9 col-sm-9">
						{$ads.top.0.code}
							<h2 class="tt_uppercase color_dark m_bottom_10 heading5 animate_ftr">&nbsp;</h2>
							<h2 class="tt_uppercase color_dark m_bottom_10 heading5 animate_ftr">IPTV Builder</h2>
					 <hr />  <form method="get">Filter: <input placeholder="Filter by name" name="psearch" type="text" value="{if isset($smarty.get.psearch)}{$smarty.get.psearch|escape}{/if}" />
					     <label>
					     <input type="submit" name="Submit" value="Filter" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light"/>
					     </label>
					   </form><hr style="margin-bottom:30px;" />
					        <form name="form1" method="post" action="">
                              <h5 align="center"><a href="{$site_root}/account.html">                              Get my iptv url  </a>
                              </h5>
                            <ul>
						<li><a title="VOD" href="?">Video on demand</a></li>
						<li><a title="Live" href="?type=live">Live Streams</a></li>
					</ul>{if $iptv.0.is_empty == 'true'} <h4 style="margin-bottom:50px;">No videos found for your query</h4>{else} <table width="100%" border="1" cellpadding="10" cellspacing="10" bordercolor="#696969" class="padded">
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
						</section>
				  </div>
			  </div>
			</div>
			<!--markup footer-->
			<footer id="footer" class="type_2">
				
				<!--copyright part-->
				<div class="footer_bottom_part">
					<div class="container clearfix t_mxs_align_c">
						<p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2019 <span class="color_light">IN2IPTV.com</span>. All Rights Reserved.</p>
						
					</div>
				</div>
			</footer>
		</div>
		<!--social widgets-->
		
		<!--custom popup-->
		<div class="popup_wrap d_none" id="quick_view_product">
			<section class="popup r_corners shadow">
				<button class="bg_tr color_dark tr_all_hover text_cs_hover close f_size_large"><i class="fa fa-times"></i></button>
				<div class="clearfix">
					
				</div>
			</section>
		</div>
		<!--login popup-->
		
		<button class="t_align_c r_corners type_2 tr_all_hover animate_ftl" id="go_to_top"><i class="fa fa-angle-up"></i></button>
		<!--scripts include-->
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery-2.1.0.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/retina.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.flexslider-min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/waypoints.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.isotope.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/owl.carousel.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.tweet.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.custom-scrollbar.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/scripts.js"></script>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5306f8f674bfda4c"></script><script type="text/javascript">
 
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
 <div id="vidadded"></div>
	</body>
</html>