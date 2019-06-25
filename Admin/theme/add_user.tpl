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
                                
                            <h2><strong>Add user</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="panel-body">
<div class="table-responsive project-stats">  
                                       {if isset($updated)}
                                         <div class="alert alert-success">Success : User Added</div>
                                      {/if}{if isset($taken)}
                                         <div class="alert alert-warning">Username or email taken please choose another</div>
                                      {/if}<form name="form1" method="post" action=""><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name</th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th>Username</th>
                                                 <td><label>
                                                   <input name="uname" type="text" id="uname" value="{$smarty.post.uname}">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Email</th>
                                                 <td><label>
                                                   <input name="email" type="text" id="email" value="{$smarty.post.email}">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Password</th>
                                               <td><label>
                                                   <input name="pass" type="password" id="pass">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                                <tr>
                                                  <th>Role</th>
                                                  <td><label>
                                                    <select name="role" id="role">
                                                      <option value="Admin">Admin</option>
                                                      <option value="User" selected>User</option>
                                                      <option value="Reseller">Reseller</option>
                                                    </select>
                                                  </label></td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                
                                                <tr>
                                                 <th width="200">Active?</th>
                                                 <td>
                                                   <select name="active" id="active">
                                                     <option {if $users_db.0.active=='true'} selected{/if} value="true">Yes</option>
                                                     <option {if $users_db.0.active=='false'} selected{/if} value="false">No</option>
                                                     <option {if $users_db.0.active=='suspended'} selected{/if} value="suspended">Suspended</option>
                                                   </select>                                                 </td>
                                                 <td>&nbsp;</td>
                                               </tr><tr>
                                                 <th colspan="3"><label>
                                                  {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Delete files</span>{else} <input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>
                                               </tr>
                                      </table>
                                       </form></div>
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