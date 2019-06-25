{include file='header.tpl'}
                    </div>
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
                                
                            <h2><strong>users </strong><span>{$users_db.0.total_rows}</span></h2>
                            </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 70px;">Username</th>
                                        <th>Email</th>
                                        <th class="text-right hidden-xs">Active</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
	{foreach from=$users_db item=items} <tr>
                                        <td class="text-center"><a href="#"><strong>{$items.uname}</strong></a></td>
                                        <td><a href="#">{$items.email}</a></td>
                                        <td class="text-right hidden-xs"><strong>{$items.active}</strong></td>
                                        </tr>{/foreach}
                                </tbody>
                            </table>
                            <!-- END All Products Content -->
                        </div><div class="block full">
                            <!-- All Products Title -->
                          <div class="block-title">
                                
                            <h2><strong>Live Streams</strong></h2>
                            </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 70px;">ID</th>
                                        <th>Stream  Name</th>
                                        <th class="text-right hidden-xs">Views</th>
                                        <th class="hidden-xs">Category</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
	{foreach from=$videos item=items} <tr>
                                        <td class="text-center"><a href="#"><strong>{$items.id}</strong></a></td>
                                        <td><a href="#">{$items.name}</a></td>
                                        <td class="text-right hidden-xs"><strong>{$items.views}</strong></td>
                                        <td class="hidden-xs">{$items.series}</td>
                                        <td class="text-center">
                                            <div class="btn-group btn-group-xs">
                                                <a href="?pname=live&edit=true&id={$items.id}" data-toggle="tooltip" title="Edit" class="btn btn-default"><i class="fa fa-pencil"></i></a>
                                                <a href="?pname=delete&edit={$items.id}" data-toggle="tooltip" onClick="javascript: return confirm('Are yoiu sure?');"title="Delete" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></a>
                                            </div>
                                        </td>
                                    </tr>{/foreach}
                                </tbody>
                            </table>
                            <!-- END All Products Content -->
                        </div><div class="block full">
                            <!-- All Products Title -->
                          <div class="block-title">
                                
                            <h2><strong>VOD Streams</strong></h2>
                            </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 70px;">ID</th>
                                        <th>Stream  Name</th>
                                        <th class="text-right hidden-xs">Views</th>
                                        <th class="hidden-xs">Category</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
	{foreach from=$vod item=items} <tr>
                                        <td class="text-center"><a href="#"><strong>{$items.id}</strong></a></td>
                                        <td><a href="#">{$items.name}</a></td>
                                        <td class="text-right hidden-xs"><strong>{$items.views}</strong></td>
                                        <td class="hidden-xs">{$items.series}</td>
                                        <td class="text-center">
                                            <div class="btn-group btn-group-xs">
                                                <a href="?pname=live&edit=true&id={$items.id}" data-toggle="tooltip" title="Edit" class="btn btn-default"><i class="fa fa-pencil"></i></a>
                                                <a href="?pname=delete&edit={$items.id}" data-toggle="tooltip" onClick="javascript: return confirm('Are yoiu sure?');"title="Delete" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></a>
                                            </div>
                                        </td>
                                    </tr>{/foreach}
                                </tbody>
                            </table>
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