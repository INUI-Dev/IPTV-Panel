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
                              <div class="table-responsive project-stats">
                              {if isset($deleted2)} 
                                <div class="alert alert-success">
                   Success! Line deleted.

                    </div>
                                {/if} {if isset($updated2)} 
                                <div class="alert alert-success">
                   Success! Line updated.

                    </div>{/if} {if $role == 'Demo'}<div class="alert alert-warning">
                   Demo users_db cannot change settings.

                    </div>
                   {/if}Server URL :  <h3 style=" color:#FF0000">{$ministra}/{$ministra_dir}/c</h3> 
                    <table class="table table-bordered table-striped table-vcenter">
                            
                                  <thead>
                                    <tr>
                                      <th>&nbsp;</th>
                                      <th>Name</th>
                                      <th>Mac Address</th>
                                      <th>Username</th>
                                      <th>Line</th>
                                      <th>Password</th>
                                      <th>Last Watched</th>
                                      <th>Subscription</th>
                                      <th>Expires</th>
                                      <th>Actions</th>
                                      <th>Extend </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  </tbody>
                                  {foreach $lines as $items}
                                  <tr>
                                    <td>{if $items.expires == 'Expired'}<div class="red-circle"></div>
                                    <span class="red1">Expired</span>{else}
                                    <div class="green-circle"></div>
                                    <span class="green1">Active</span>{/if}</td>
                                    <td>{$items.name}</td>
                                    <td>{$items.mac}</td>
                                    <td>{$items.user}</td>
                                    <td align="center"><a href="http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$items.user}&pass={$items.pass}&list={$items.display}" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv.php?user={$items.user}&amp;pass={$items.pass}&amp;list={$items.display}</a></td>
                                    <td><span>{$items.pass}</span></td>
                                    <td><strong>{$items.last_viewed}</strong></td>
                                    <td><form id="form2" name="form2" method="post" action=""> <select name="lines" id="lines">
                                                     {foreach $lines2 as $items2} <option {if $items.sub_plan == $items2.id} selected="selected"{/if} value="{$items2.id}">{$items2.name}</option>
                                                     {/foreach}
                                                    </select><input name="update" type="hidden" value="{$items.id}" /><input class="btn btn-info" type="submit" name="go2" id="go2" value="Set" />
                                        
                                    </form>
                                    </td>
                                    <td>{$items.expires}</td>
                                    <td><a href="?pname=lines&amp;suspend={$items.id}" onclick="javascript:return confirm('Are you sure?');">Suspend</a> - <a href="?pname=lines&amp;delete={$items.id}" onclick="javascript:return confirm('Are you sure?');">Delete</a></td>
                                    <td><form id="form1" name="form1" method="post" action="?pname=lines">
                                      <label>
                                      <select name="length" id="length">
                                    {foreach $time as $items2}<option value="{$items2}">{$items2}</option> {/foreach}</select>
                                      <input name="id" type="hidden" id="id" value="{$items.id}" />
                                      <input name="pname" type="hidden" id="pname" value="index" />
                                      <select name="type" id="type">
                                        <option value="hours">Hours</option>
                                        <option value="days">Days</option>
                                        <option value="months">Months</option>
                                        <option value="years">Years</option>
                                      </select>
                                      <input type="submit" name="go" id="go" value="Go" />
                                      </label>
                                    </form>                                    </td>
                                  </tr>
                                  {/foreach}
                                </table>
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