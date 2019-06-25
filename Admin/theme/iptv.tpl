{include file='header.tpl'} </div>
                </div> <div id="main-container"><header class="navbar navbar-default">
                        <!-- Left Header Navigation -->
    <ul class="nav navbar-nav-custom">
                            <!-- Main Sidebar Toggle Button -->
                            <li>
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                                    <i class="fa fa-bars fa-fw"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- END Left Header Navigation -->

                        <!-- Search Form --><!-- END Search Form -->

                        <!-- Right Header Navigation --><!-- END Right Header Navigation -->
                  </header><!-- END Header -->

                    <!-- Page content -->
                  <div id="page-content">
                        <!-- eCommerce Products Header --><!-- END eCommerce Products Header -->

                        <!-- Quick Stats --><!-- END Quick Stats -->

                        <!-- All Products Block -->
                    <div class="block full">
                            <!-- All Products Title -->
                          <div class="block-title">
                                
                            <h2><strong>Manage iptv plans</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
<div class="filter"></div>
                {if isset($added)}<div class="alert alert-success">
                   Success! playlist updated.

                    </div> {if isset($updated)}<div class="alert alert-success">
                   Success! playlist added.

                    </div>{/if}{else}{if !isset($smarty.get.id)} {if isset($deleted)}<div class="alert alert-success">
                   Success! Video deleted.

                    </div>
                    {/if}
                   {if isset($smarty.get.add)}<input name="plname" type="text" id="plname">
                   <label>
                   <input type="submit" name="add2" id="add2" value="Add Playlist">
                   </label>
                    {else}
                    <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="16%">          Name</th>
        <th>Devices</th>
        <th>Limited to single device?</th>
        <th width="44%">M3U URL</th>
        <th width="20%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$iptv item=items}
	
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF">{$items.name}
          <input type="hidden" name="{$items.id}" id="{$items.id}" value="{$items.id}"></td>
        <td bgcolor="#FFFFFF">
<form method="post" enctype="multipart/form-data" id="form1" name="form2">{if $items.limit == 'true'}
  <input name="id" type="hidden" id="id" value="{$items.id}" />
  <select name="limit" id="limit">
        {foreach $count as $items2}<option {if $items.limit_to == $items2.num} selected="selected"{/if} value="{$items2.num}">{$items2.num}</option>
       {/foreach}
      </select>
  <label>
  <input type="submit" name="save" id="save" value="Save" />
  </label>
       </form> {else}Not Supported on free stream.{/if}</td>
        <td bgcolor="#FFFFFF">{if $items.limit == 'true'}Limited to {$items.limit_to} device{else}<strong>Not</strong> limited to device{/if}</td>
        <td bgcolor="#FFFFFF"><a href="http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?list={$items.m3u_name}&user={$user}&amp;pass=[Your Password]" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?list={$items.m3u_name}&user={$user}&amp;pass=[Your Password]</a></td>
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot edit iptv{else}<a href="?pname=add-package&cate={$items.id}">Add  Video</a> -<a href="?pname=add_live&cate={$items.id}"> Add Live </a>  - <a onClick="javascript:return confirm('Are you sure');" href="?pname=iptv&delete={$items.id}&pageNum={$page_number}">Delete</a> - {if $items.sub == 'true'}<a href="?pname=iptv&free=true&amp;id1={$items.id}">Set as free</a> {else}<a href="?pname=iptv&amp;id1={$items.id}&amp;free=false">set as paid</a>{/if}{/if}</td>
        </tr>{/foreach}
  </table>
                {/if}
                    <label></label>
                    {else}{if $vid.is_empty}Video not found{else}
           <table width="100%" border="1" cellspacing="0" cellpadding="10">
                         <tr>
                          <td width="16%" bgcolor="#000066"  style="color:#FFFFFF">Name</td>
                           <td width="84%" bgcolor="#000066"  style="color:#FFFFFF">Value</td>
                         </tr>
                         <tr>
                           <td>Video Title</td>
                           <td>
                           <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$vid.name}">                           </td>
                      </tr>
                         <tr>
                           <td>Category</td>
                           <td>
                           <select class="form-control col-lg-8" name="cata" id="cata">
                           {foreach from=$category item=items} <option {if $vid.series == $items.id} selected{/if} value="{$items.id}">{$items.id}</option>{/foreach}
                          </select>                           </td>
                         </tr>
                         <tr>
                           <td valign="top">Limit to 1 device</td>
                           <td><label>
                           <select name="device" id="device">
                             <option value="true">Yes</option>
                             <option value="false">No</option>
                           </select>
                           </label></td>
                         </tr>
                         <tr>
                           <td valign="top">Viewing passwors</td>
                           <td>
                             <input class="form-control col-lg-8" name="pass" type="text" id="pass" value="{$vid.pass}">                           </td>
                         </tr>
                         <tr>
                           <td valign="top">Video Duration(H:m.S)</td>
                           <td>
                             <input name="length" type="text" class="form-control col-lg-8" id="length" value="{$vid.duration}">                           </td>
                         </tr>
                         <tr>
                           <td valign="top">Description</td>
                           <td>
                             <textarea class="form-control col-lg-8" name="desc" id="desc" cols="45" rows="5">{$vid.desc}
                         </textarea>                           </td>
                         </tr>
                         
                         
                         <tr>
                           <td valign="top">Is Featured?</td>
                           <td><select class="form-control col-lg-8" name="featured" id="featured">
                             <option value="true" {if $vid.featured == 'true'} selected{/if}>Yes</option>
                             <option {if $vid.featured == 'false'} selected{/if} value="false">No</option>
                           </select></td>
                         </tr>
                         <tr>
                           <td valign="top">Hidden?</td>
                           <td><select class="form-control col-lg-8" name="hidden" id="hidden">
                             <option value="false" {if $vid.visible == 'false'} selected{/if} >Yes</option>
                             <option value="true" {if $vid.visible == 'true'} selected{/if} >No</option>
                           </select></td>
                         </tr><tr>
                           <td valign="top">Login to view?</td>
                           <td><select class="form-control col-lg-8" name="login" id="login">
                             <option value="true"{if $vid.login == 'true'} selected{/if}>Yes</option>
                             <option value="false" {if $vid.login == 'false'} selected{/if}>No</option>
                           </select></td>
                         </tr>
                         <tr>
                           <td valign="top">Subscription Required?</td>
                           <td><select class="form-control col-lg-8" name="sub" id="sub">
                             <option {if $vid.sub == 'true'} selected{/if}value="true">Yes</option>
                             <option value="false" {if $vid.sub == 'false'}  selected{/if}>No</option>
                           </select></td>
                         </tr>
                         
                         <tr>
                           <td colspan="2"><div align="center">
                             
                             {if $role == 'Demo'}Demo user cannot upload videos{else}    
                           <input type="submit" name="save" id="save" value="Upload" class="btn btn-info">
                             
                           {/if}</div></td>
                         </tr>
                         <tr>
                           <td colspan="2">&nbsp;</td>
                         </tr>
                </table>
                {/if}{/if}{/if}
                    </form>
                  </div>
                </div></div>
                            <!-- END All Products Content -->
                        </div>
                      <!-- END All Products Block -->
                    </div>
                    <!-- END Page Content -->

                    <!-- Footer -->
                    <footer class="clearfix">
                        
                        <div class="pull-left">
                            </span> &copy; <a href="http://{$slogan}.com" target="_blank">{$slogan}</a>
                        </div>
                    </footer>
                    <!-- END Footer -->
                </div>
                <!-- END Main Container -->
            </div>
            <!-- END Page Container -->
        </div>
        <!-- END Page Wrapper -->

        <!-- Scroll to top link, initialized in {$site_root}/Admin/theme/js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-double-up"></i></a>

        <!-- User Settings, modal which opens from Settings link (found in top right user menu) and the Cog link (found in sidebar user info) -->
        <div id="modal-user-settings" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h2 class="modal-title"><i class="fa fa-pencil"></i> Settings</h2>
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    
                    <!-- END Modal Body -->
                </div>
            </div>
        </div>
        <!-- END User Settings -->

        <!-- jQuery, Bootstrap.js, jQuery plugins and Custom JS code -->
        <script src="{$site_root}/Admin/theme/js/vendor/jquery.min.js"></script>
        <script src="{$site_root}/Admin/theme/js/vendor/bootstrap.min.js"></script>
        <script src="{$site_root}/Admin/theme/js/plugins.js"></script>
        <script src="{$site_root}/Admin/theme/js/app.js"></script>

        <!-- Load and execute javascript code used only in this page -->
        <script src="{$site_root}/Admin/theme/js/pages/ecomProducts.js"></script>
        <script>$(function(){ EcomProducts.init(); });</script>
    </body>
</html>