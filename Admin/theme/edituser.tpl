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
                                
                            <h2><strong>Edit user</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="panel-body">
                                  <div class="table-responsive project-stats">  
                              
                                     {if isset($set)}<div class="alert alert-success">Success : User information  changed</div>
                                   {else} {if isset($notmatch)}<div class="alert alert-danger" role="alert">Password do not match</div> {/if} <form name="form1" method="post" action=""> <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name</th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr><tr>
                                                   <th width="200">Username</th>
                                                   <td><span class="label label-success">{$users_db.0.uname}
                                                     <input type="hidden" name="uname" id="uname" value="{$users_db.0.uname}">
                                                   </span></td>
                                                   <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Email</th>
                                                 <td><label>
                                                   <input name="email" type="text" id="email" value="{$users_db.0.email}">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">New PAssword</th>
                                               <td><label>
                                                   <input name="pass" type="password" id="pass" value="none">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Repeat pass</th>
                                               <td><label>
                                                   <input name="confirm" type="password" id="confirm" value="none">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               {if $users_db.0.role == 'Reseller'} <tr>
                                                  <th>Credits</th>
                                                  <td><input name="credits" type="number" id="credits" min="0" max="10000" value="{$users_db.0.credits}"></td>
                                                  <td>&nbsp;</td>
                                                </tr>{/if}
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
                                                   {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Delete files</span>{else}<input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>
                                               </tr>
                                      </table>
                                       </form>{/if}<h2>User Lines</h2>{if $lines.0.is_empty == 'true'}<h3>No lines added for user</h3>{else}<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                  <thead>
                                    <tr>
                                      <th>Name</th>
                                      <th>Username</th>
                                      <th>Line</th>
                                      <th>Device ID</th>
                                      <th>Actions</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  </tbody>
                                  {foreach $lines as $items}
                                  <tr>
                                    <td>{$items.name}</td>
                                    <td>{$items.user}</td>
                                    <td><a href="http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.m3u?user={$items.user}&pass={$items.pass}&list={$items.display}" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.m3u?user={$items.user}&amp;pass={$items.pass}&amp;list={$items.display}</a></td>
                                    <td><span>{if !isset($items.limit_user_agent)}No Device id Set{else}<a href="?pname=edituser&amp;delete_device={$items.limit_id}&id={$smarty.get.id|escape}">Reset device id</a> - {$items.limit_user_agent}{/if}</span></td>
                                    <td><a href="?pname=edituser&amp;delete_device={$items.limit_id}&id={$smarty.get.id|escape}" onclick="javascript:return confirm('Are you sure?');">Reset Device id</a></td>
                                    </tr>
                                  {/foreach}
                                </table>
                   
                    {/if} 
                                  </div>
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