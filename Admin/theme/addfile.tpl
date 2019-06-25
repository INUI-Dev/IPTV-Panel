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
                                
                            <h2><strong>Products</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="panel-body">
                                   <div class="table-responsive project-stats">
                                   
<form action="upload.php" method="post" enctype="multipart/form-data" id="UploadForm" name="form2"><input name="MM_insert" type="hidden" value="form1" /> <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>Name</th>
                                                   <th>Status</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               <tr>
                                                 <td>Upload max file size</td>
                                                 <td>{$upload_max_filesize}</td>
                                             </tr>
                                               <tr>
                                                 <td>Max Post ASize</td>
                                                 <td>{$post_max_size}</td>
                                             </tr>
                                               <tr>
                                                 <td>Browser timout</td>
                                                 <td>{$max_input_time}</td>
                                             </tr>
                                               <tr>
                                                 <td>Server timout</td>
                                                 <td>{$max_execution_time}</td>
                                               </tr>
                                               <tr>
                                                 <td>Memory limit</td>
                                                 <td>{$memory_limit}</td>
                                               </tr>
                                               <tr>
                                                 <td>File name</td>
                                                 <td><label>
                                                   <input type="text" name="name" id="name">
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Category</td>
                                                 <td><select name="category" id="category">
                                                     <option>Select</option>{foreach $categories as $items}<option value="{$items.url}">{$items.name}</option>{/foreach}
                                                                                                      </select></td>
                                               </tr>
                                               <tr>
                                                 <td>File Description</td>
                                                 <td>
                                                   <textarea style="height:300px; width:100%;" name="desc" id="desc" cols="45" rows="5"></textarea>                                                 </td>
                                               </tr>
                                               <tr>
                                                 <td>Buy now price</td>
                                                 <td><label>
                                                   <input name="price" type="text" id="price" value="free">
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Discount Price</td>
                                                 <td><label>
                                                   <input name="discount" type="text" id="discount" value="none" />
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Subscriptin required</td>
                                                 <td><label>
                                                   <select name="sub#" id="sub#">
                                                     <option value="none">None</option>
                                                                                                      </select>
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Image</td>
                                                 <td><label>
                                                   <input type="file" name="image" id="image">
                                                 </label></td>
                                               </tr>
                                               
                                               <tr>
                                                 <td>Length</td>
                                                 <td><label>
                                                   <select name="length" id="length">
                                                   {foreach $list as $items}<option value="{$items.list}">{$items.list}</option>{/foreach}</select>
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Type</td>
                                                 <td><select name="type" id="type">
                                        <option value="days">Days</option>
                                        <option value="months">Months</option>
                                        <option value="years">Years</option>
                                      </select></td>
                                               </tr>
                                               <tr>
                                                 <td>Line included :</td>
                                                 <td><label>
                                                 <select name="lines" id="lines">
                                                   {foreach $lines as $items}<option value="{$items.display}">[{if $items.sub == 'true'}Paid Subscription Service{else}Free line{/if}]{$items.name}</option>{/foreach}
                                                 </select>
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td colspan="2">{if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Add Files</span>{else}
                                                   <input name="sub" type="submit" value="Upload">{/if}</td>
                                               </tr>
                                               <tr>
                                                   <td colspan="2"><div align="center">
                                 <div id="progressbox"><div id="progressbar"></div ><div id="statustxt">0%</div ></div><div id="output"></div></div></td>
                                               </tr>}
                                      </table>
                                     </form>
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