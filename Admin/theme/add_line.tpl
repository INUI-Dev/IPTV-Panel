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
                                
                            <h2><strong>Add Line</strong></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Add Live streams to m3u</h4>
                                </div>
                               {if isset($added)}<div class="alert alert-success">
                   Success! Line Added.

                    </div>{else}{if $role == 'Demo'}<div class="alert alert-warning">
                   Demo users_db cannot change settings.

                    </div>{/if} <form method="post" action="">
                      {if isset($error)}<div class="alert alert-warning">
                  Mac didnt set on server

                    </div>{/if}
                      <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                                                                 
                                               <tr>
                                                 <th width="200">Name</th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr><tr>
                                                   <th width="200">User</th>
                                                   <td><label for="user"></label>
                                                   <input required="required" type="text" name="user" id="user" /></td>
                                                   <td>&nbsp;</td>
                                               </tr>
                                               
                                               <tr>
                                                 <th width="200">Password</th>
                                               <td><label>
                                                   <input name="pass" type="text" id="pass">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th>Mac Address</th>
                                                 <td><label for="mac"></label>
                                                 <input name="mac" type="text" id="mac" value="none" /></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th>Tariff to add</th>
                                                 <td><select name="tariff" id="tariff">
                                       {foreach $tariff as $items}<option value="{$items.id}">{$items.name}</option>{/foreach}  </select></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">service to add
                                                 <input name="form1" type="hidden" id="form1" value="true" /></th>
                                               <td><select name="lines" id="lines">
                                                       {foreach $iptv as $items}
                                                 <option value="{$items.id}">{$items.name}</option>{/foreach}
                                                     </select></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                                <tr>
                                                  <th>Length</th>
                                                  <td> <select name="length" id="length">
                                    {foreach $time as $items2}<option value="{$items2}">{$items2}</option> {/foreach}</select></td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                  <th>Type </th>
                                                  <td><select name="type" id="type">
                                                    <option value="hours">Hours </option>
                                                    <option value="days">Days</option>
                                                    <option value="months">Months</option>
                                                    <option value="years">Years</option>
                                                  </select></td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                
                                                <tr>
                                                 <th width="200">Active?</th>
                                                 <td>
                                                   <select name="active" id="active">
                                                     <option value="true" selected="selected">Yes</option>
                                                     <option value="false">No</option>
                                                   </select>                                                 </td>
                                                 <td>&nbsp;</td>
                                               </tr><tr>
                                                 <th colspan="3"><label>
                                                  {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Change settings</span>{else} 
                                                  <input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>
                                               </tr>
                                      </table>
                      </form>{/if}</div>
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