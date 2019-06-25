{include file='header.tpl'} </div>
                </div> <div id="main-container"><header class="navbar navbar-default">
                        <!-- Left Header Navigation -->
    <ul class="nav navbar-nav-custom">
                            <!-- Main Sidebar Toggle Button -->
                            <li>
                                <a href="javascript:void(0)" onClick="App.sidebar('toggle-sidebar');this.blur();">
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
                                
                            <h2><strong>Publish</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="table-responsive project-stats">
                                    {if isset($added)} 
                                      <div class="alert alert-success">{$added}</div>
                                {else} <form name="form1" method="post" action="">
                                       <p>
                                         <label for="user"></label>
                                         <label for="line"></label>
                                       <br />
                                       <label for="type"></label>
                                       Panel Username<br>
                                       <input type="text" name="user" id="user">
                                       <br>
                                       Panel Password                                       <br>
                                       <label for="pass"></label>
                                       <input name="pass" type="text" id="pass" value="">
                                         <br>
                                         Tarrif:<br />
                                         <label for="tariff"></label>
                                         <select name="tariff" id="tariff">
                                           
                                       {foreach $tariff as $items}
                                           <option value="{$items.id}">{$items.name}</option>
                                           {/foreach}  
                                         </select>
                                         <input type="submit" name="button" id="button" value="Submit">
                                       </p>
</form>
                                {/if}
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