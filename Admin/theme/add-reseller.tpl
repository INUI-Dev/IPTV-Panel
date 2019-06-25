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
                                   <div class="table-responsive project-stats">
                                   
<form method="post" enctype="multipart/form-data" name="form2">
<input name="MM_insert" type="hidden" value="form1" /> <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>Name</th>
                                                   <th>Status</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               
                                               <tr>
                                                 <td width="140">File name</td>
                                                 <td>
                                                   <input name="name" type="text" class="formbtn" id="name" value="{$edit2.0.name}">
                                                   <input type="hidden" name="mminsert" id="mminsert" value="true" /></td>
                                               </tr><tr>
                                                 <td>Line included :</td>
                                                 <td><label>
                                                 <select name="lines" id="lines">
                                                   {foreach $lines as $items}<option value="{$items.display}">[{if $items.sub == 'true'}Paid Subscription Service{else}Free line{/if}]{$items.name}</option>{/foreach}
                                                 </select>
                                                 </label></td>
                                               </tr><tr>
                                                 <td>Credits Given for purchase</td>
                                               <td><label>
                                                   <input type="number" id="length" name="length"
           value="{$edit2.0.length}"
           min="1" max="10000" />
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Category</td>
                                                 <td><label>
                                                   <select name="category" id="category">
                                                     <option>Select</option>{foreach $categories as $items}<option {if $edit2.0.category==$items.url}selected="selected"{/if} value="{$items.url}">{$items.name}</option>{/foreach}
                                                                                                      </select>
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>File Description</td>
                                                 <td>
                                                   <textarea style="height:300px; width:100%;" name="desc" id="desc" cols="45" rows="5">{$edit2.0.description}</textarea>                                                 </td>
                                               </tr>
                                               <tr>
                                                 <td>Buy now price</td>
                                                 <td>
                                                   <input class="formbtn" name="price" type="text" id="price" value="{$edit2.0.price}">                                                 </td>
                                               </tr>
                                               <tr>
                                                 <td>Discount Price</td>
                                                 <td>
                                                   <input class="formbtn" name="discount" type="text" id="discount" value="none" />                                                 </td>
                                               </tr>
                                               
                                               
                                               <tr>
                                                 <td>Image</td>
                                                 <td>
                                                   <input class="formbtn" type="file" name="image" id="image">                                                 </td>
                                               </tr>
                                               
                                               <tr>
                                                 <td colspan="2">{if $role == 'Demo'}<span class="label label-danger">Demo Account cannot change these settings</span>{else}<input class="formbtn" name="sub" type="submit" value="Save">{/if}</td>
                                               </tr>
                                               }
                                      </table>
                                     </form>
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