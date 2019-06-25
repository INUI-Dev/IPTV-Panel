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
                                
                            <h2><strong>Add single vod</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                               {if isset($added)}<div class="alert alert-success">
                   Success! Video Added.

                    </div>
                               {else}    <form action="" method="post" enctype="multipart/form-data" name="form1" id="form1"><table width="100%" border="1" cellspacing="0" cellpadding="10" class="table">
                         <tr>
                          <td width="16%" bgcolor="#000066"  style="color:#FFFFFF">Name</td>
                           <td width="84%" bgcolor="#000066"  style="color:#FFFFFF">Value</td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Video Title</strong></div></td>
                           <td height="50px;">
                           <input name="name" type="text" class="form-control col-lg-8" id="name">                           </td>
                      </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Video URL</strong></div></td>
                           <td height="50px;"><input name="url" type="text" class="form-control col-lg-8" id="url" /></td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Image</strong> URL </div></td>
                           <td height="50px;">
                           <input name="image" type="text" id="image" class="form-control col-lg-8" />                           </td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Description</strong></div></td>
                           <td height="50px;">
                             <textarea name="desc" id="desc" cols="45" rows="5" required="required"></textarea>                           </td>
                         </tr>
                         
                         <tr>
                           <td height="50px;"><div align="center"><strong>Category</strong></div></td>
                           <td height="50px;"><select class="form-control col-lg-8" name="cate" id="cate">
                             
                           {foreach from=$category item=items} 
                             
                             <option {if $vid.0.series == $items.id} selected{/if} value="{$items.name}">{$items.name}</option>
                             {/foreach}
                          
                           </select>                           </td>
                         </tr>
                         
                         
                         
                         
                         

                         <tr>
                           <td colspan="2"><div align="center">
                             
                             {if $role == 'Demo'}Demo user cannot upload videos{else}    
                           <input type="submit" name="save" id="save" value="Save" class="btn btn-info">
                             
                           {/if}</div></td>
                         </tr>
                         
                       </table>
                    {/if}
</form></div>
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