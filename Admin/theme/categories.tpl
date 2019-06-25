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
                                
                            <h2><strong>Video Categories</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
                    <form id="form1" name="form1" method="POST" action="">
      {if isset($added)}<div class="alert alert-success">
                   Success! Category Added.
                    </div> {/if} {if isset($deleted)}<div class="alert alert-success">
                   Success! Category Deleted.
                    </div> {/if}{if isset($set1)}
     <div class="alert alert-success">
                   Success! Category changed.
                    </div>
      {else}
   {if $cate_empty == 'false' and !isset($deleted)}<form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$cate_id}">
     <br>

    {if $role == 'Demo'}Demo user cannot edit categories{else}
     <input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>
   {else}{if $add}Add Category.<br>
   <form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" required="required">
     <br>

    
     {if $role == 'Demo'}Demo user cannot add categories{else}<input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>{else}
   <div align="center"><a href="?pname=categories&add=true">Add new category</a></div><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="91%">Name </th>
        <th width="9%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$cate item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF">
      
          {$items.name}</td>
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot modify Categories{else}<a href="?pname=video-cate&edit=true&id={$items.id|urlencode}">Edit</a> - <a onClick="javascript:return confirm('Are you sure');" href="?pname=video-cate&delete=true&id={$items.id|urlencode}">Delete</a>{/if}</td>
        </tr>{/foreach}
  </table>{/if}{/if}{/if}
  <input name="sub1" type="hidden" id="sub1" value="<?php echo $_GET['sub'] ?>" />

<input type="hidden" name="MM_insert" value="form1">
</form>
                  </div>
              </div>
                                </div>
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
                        <h2 class="modal-title"><i class="fa fa-pencil"></i> Categories</h2>
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
                    <form id="form1" name="form1" method="POST" action="">
      {if isset($added)}<div class="alert alert-success">
                   Success! Category Added.
                    </div> {/if} {if isset($deleted)}<div class="alert alert-success">
                   Success! Category Deleted.
                    </div> {/if}{if isset($set1)}
     <div class="alert alert-success">
                   Success! Category changed.
                    </div>
      {else}
   {if $cate_empty == 'false' and !isset($deleted)}<form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$cate_id}">
     <br>

    {if $role == 'Demo'}Demo user cannot edit categories{else}
     <input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>
   {else}{if $add}Add Category.<br>
   <form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" required="required">
     <br>

    
     {if $role == 'Demo'}Demo user cannot add categories{else}<input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>{else}
   <div align="center"><a href="?pname=categories&add=true">Add new category</a></div><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="91%">Name </th>
        <th width="9%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$cate item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF">
      
          {$items.name}</td>
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot modify Categories{else}<a href="?pname=categories&edit=true&id={$items.id|urlencode}">Edit</a> - <a onClick="javascript:return confirm('Are you sure');" href="?pname=categories&delete=true&id={$items.id|urlencode}">Delete</a>{/if}</td>
        </tr>{/foreach}
  </table>{/if}{/if}{/if}
  <input name="sub1" type="hidden" id="sub1" value="<?php echo $_GET['sub'] ?>" />

<input type="hidden" name="MM_insert" value="form1">
</form>
                  </div>
              </div>
                                </div>
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