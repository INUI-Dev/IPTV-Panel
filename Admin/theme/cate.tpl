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
                                
                            <h2><strong>Categories</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="table-responsive project-stats">  
                                       {if isset($added)}<div class="alert alert-success">Success : Category added</div>
                                       {/if}
                                       {if isset($edit) or isset($smarty.get.add)}
                                        {if isset($updated)}
<div class="alert alert-success">Success : Category updated</div>

{else}{if isset($smarty.get.add)}
<form name="form1" method="post" action="">
                                        
<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name                                                 </th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                               <tr>
                                                 <th width="200">New Name
                                                 <input name="add" type="hidden" id="add" value="true"></th>
                                                 <td><label>
                                                   <input required="required"name=" name" type="text" id="name">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">New URL</th>
                                               <td><label>
                                                   <input name="url" type="text" required="required" id="url">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th colspan="3"><label>
                                                   {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot change these settings</span>{else}<input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>                                               </tr>
              </table> </form>{else}
<form name="form1" method="post" action="">
                                        
<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name                                                 </th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                               <tr>
                                                 <th width="200">New Name
                                                 <input name="prod_id" type="hidden" id="prod_id" value="{$cate.0.id}">
                                                 <input name="orig" type="hidden" id="orig" value="{$cate.0.name}"></th>
<td><label>
                                                   <input required="required"name=" name" type="text" id="name" value="{$cate.0.name}">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">New URL</th>
                                               <td><label>
                                                   <input name="url" type="text" required="required" id="url" value="{$cate.0.url}">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th colspan="3"><label>
                                                 {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot change these settings</span>{else}  <input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>                                               </tr>
              </table> </form>{/if}
                                      {/if} {else}
                                     <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>name</th>
                                                   <th>URL</th>
                                                   <th>Delete</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               {foreach $cates as $items}<tr>
                                                   <td>{$items.name}</td>
                                                   <td><span class="label label-success">{$items.url}</span></td>
                                                   <td><a class="label label-success" href="?pname=cate&id={$items.id}&edit=true">Edit</a> {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Delete files</span>{else}<a class="label label-danger" href="?pname=cate&id={$items.id}&delete=true">Delete</a>{/if}</td>
                                               </tr>{/foreach}
                                     </table>
                         {/if}</div>
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

        <!-- User Settings, modal which opens from Settings link (found in top right user menu) and the Cog link (found in sidebar user info) --><!-- END User Settings -->

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