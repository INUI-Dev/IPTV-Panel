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
                                
                            <h2><strong>Manage Lines</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                              <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Manage Ads</h4>
                                </div>
                                <div class="panel-body">
<div class="table-responsive project-stats">  
                                       {if isset($edit)}{if isset($updated)}<div class="alert alert-success">Success : Advert updated</div>
                                       {/if}<form method="post"><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead style="width:100px;">
                                               <tr>
                                                   <th width="58">Email</th>
                                                   <th width="154">Value</th>
                                             </tr>
                                           </thead>
                                           <tbody>
                                               <tr>
                                                   <td>Name</td>
                                                   <td><label>
                                                     <input name="name" type="text" id="name" value="{$editads.0.name}">
                                                   </label></td>
                                             </tr>
                                               <tr>
                                                 <td>Code</td>
                                                 <td><label>
                                                   <textarea name="code" id="code" cols="45" rows="5">{$editads.0.code}</textarea>
                                                 </label></td>
                                             </tr>
                                              
                                               <tr>
                                                 <td>Position :</td>
                                                 <td>{$editads.0.position}</td>
                                             </tr> <tr>
                                                 <td colspan="2"><input class="btn btn-primary" type="submit" name="save" id="save" value="Save">
                                                 <input name="savead" type="hidden" id="savead" value="ll"></td>
                                               </tr>
                                      </table></form>
{else}<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>Ad name</th>
                                                   <th>Status</th>
                                                   <th>Subject</th>
                                                   <th>Progress</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               {foreach $ads as $items}<tr>
                                                   <td>{$items.name}</td>
                                                   <td>{$items.code}</td>
                                                   <td>{$items.position}</td>
                                                   <td><a class="label label-danger" href="?pname=ads&edit=true&id={$items.id}">Edit</a></td>
                                               </tr>{/foreach}
                                      </table>{/if}</div>
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