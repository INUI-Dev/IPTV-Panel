{include file='header.tpl'} </div>
                         
<script language='JavaScript'>
      checked = false;
      function checkedAll () {
        if (checked == false){
		checked = true
		}else{
		checked = false
		}
	for (var i = 0; i < document.getElementById('form1').elements.length; i++) {
	  document.getElementById('form1').elements[i].checked = checked;
	}
      }</script>     </div> <div id="main-container"><header class="navbar navbar-default">
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
                                
                            <h2><strong>Add m3u</strong></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
<div class="widget-content">
                  <div class="padd">
                {if isset($added)}<div class="alert alert-success">
                   Success! IPTV updated.

                    </div>{else}{if !isset($smarty.get.id)} {if isset($deleted)}<div class="alert alert-success">
                   Success! Video deleted.

                    </div>
                    {/if}
                   {if isset($smarty.get.add)}
<form method="post" enctype="multipart/form-data" id="form1" name="form2">
  <p>Name :<br />
      <input name="plname" type="text" id="plname">
   </p>
  <p> FREE :<br />
      <select name="free" id="free">
        <option value="all" selected>Free</option>
        <option value="true">subscription</option>
       </select>
</p>
  <p>    Limit  devices :<br />
      <select name="device" id="device">
        <option value="true">Yes</option>
        <option value="false">No</option>
        </select>
    </p>
  <p>To: <br />
    <label>
      <select name="limit" id="limit">
        {foreach $count as $items}<option value="{$items.num}">{$items.num}</option>
       {/foreach}
      </select>
    </label>
  DEVICE(S)</p>
  <p>{if $role == 'Demo'} Demo user cannot add m3u{else} 
    <input type="submit" name="add2" id="add2" value="Add Playlist">
    {/if}
  </p>
</form>
                    {else}
                    <div class="filter">
<form method="get">Filter : 
  
  <input type="text" name="psearch" id="psearch">
  <select name="cate" id="cate">
    {foreach $cate as $items}<option value="{$items.name}">{$items.name}</option>{/foreach}
  </select> 
  <input type="submit" name="search" id="search" value="Filter" />
  <input type="hidden" name="pname" id="pname" value="add-package">
  
  <input name="cate2" type="hidden" id="cate2" value="{$smarty.get.cate|escape}" />
</form></div>
<form method="post" enctype="multipart/form-data" id="form1" name="form2">
                    <div align="center">
                      
                      <select name="add" id="add">
                        <option value="add">Add to existing</option>
                        <option value="create" selected>Reset playlist</option>
                      </select>
                      
                      <select name="iptvlist">
                        {foreach $iptv as $items}<option {if isset($smarty.get.cate)  && $smarty.get.cate  == $items.id} selected{/if} value="{$items.id}">{$items.name}</option>{/foreach}
                      </select>
                      
                      <input type="submit" name="create" id="create" value="Add All videos">
                      
                      <p>&nbsp;</p>
                  </div>
                  {if isset($videos.0.is_empty) && $videos.0.is_empty == 'false'} <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="3%"><label>
          <input type='checkbox' name='checkall' onclick='checkedAll();' />
        </label></th>
        <th width="49%">          Name</th>
        <th width="26%">Category</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$videos item=items}
	
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF"><div align="center">
            <input name="add{$items.id}" type="checkbox" style="width:20px;" id="add{$items.id}" value="insert" />
        </div></td>
	    <td bgcolor="#FFFFFF">{$items.name}
          <input type="hidden" name="{$items.id}" id="{$items.id}" value="{$items.id}"></td>
        <td bgcolor="#FFFFFF">{$items.series}</td>
        </tr>{/foreach}
  </table>
                {else}<h3>Add all streams at top or filter the streams you want to add</h3>{/if}
                    {/if}
                    
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