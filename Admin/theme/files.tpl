{include file='header.tpl'}
  <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  {literal}<script>tinymce.init({ selector:'textarea#desc' });</script><script>tinymce.init({ selector:'textarea#tabdesc' });</script><script>tinymce.init({ selector:'textarea#desc' });</script><script>tinymce.init({ selector:'textarea#desc' });</script>{/literal} </div>
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
                                
                            <h2><strong>Add Product</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="panel-body">
                                  <div class="table-responsive project-stats">
                                   {if isset($imagedeleted)}<div class="alert alert-success">Success :Image Deleted</div>{/if} {if isset($imageadded)}<div class="alert alert-success">Success :Image added to product</div>{/if}{if isset($tab)}
                                    <div class="alert alert-success">Success :Tab Added</div>
                                   {/if}{if isset($smarty.get.edit) and isset($smarty.get.id)}{if isset($edit2) && $edit2.0.is_empty == 'false'}
                                   <div class="table-responsive project-stats">
                                   
<form method="post" enctype="multipart/form-data" name="form2"><input class="formbtn" name="MM_insert" type="hidden" value="form1" /> <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>Name</th>
                                                   <th>Status</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               
                                               <tr>
                                                 <td width="140px;">File name</td>
                                                 <td>
                                                   <input name="name" type="text" class="formbtn" id="name" value="{$edit2.0.name}">
                                                   <input type="hidden" name="mminsert" id="mminsert" value="true" /></td>
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
                                                   <input class="formbtn" name="discount" type="text" id="discount" value="{$edit2.0.discount}" />                                                 </td>
                                               </tr>
                                               <tr>
                                                 <td>Subscriptin required</td>
                                                 <td>
                                                   <select class="formbtn" name="sub#" id="sub#">
                                                     <option value="none">None</option>
                                                   </select>                                                 </td>
                                               </tr>
                                               <tr>
                                                 <td>Length</td>
                                                 <td><label>
                                                   <select name="length" id="length">
                                                   {foreach $list as $items}<option {if $edit2.0.length == $items.list} selected="selected"{/if}value="{$items.list}">{$items.list}</option>{/foreach}</select>
                                                 </label></td>
                                               </tr>
                                               <tr>
                                                 <td>Type</td>
                                                 <td><select name="type2" id="type2">
                                        <option {if $edit2.0.type == 'days'} selected="selected"{/if} value="days">Days</option>
                                        <option {if $edit2.0.type == 'months'} selected="selected"{/if} value="months">Months</option>
                                        <option {if $edit2.0.type == 'years'} selected="selected"{/if} value="years">Years</option>
                                      </select></td>
                                               </tr><tr>
                                                 <td>Image</td>
                                                 <td>
                                                   <input class="formbtn" type="file" name="image" id="image">                                                 </td>
                                               </tr>
                                               
                                               <tr>
                                                 <td colspan="2">{if $role == 'Demo'}<span class="label label-danger">Demo Account cannot change these settings</span>{else}<input class="formbtn" name="sub" type="submit" value="Save">{/if}</td>
                                               </tr>
                                               }
                                      </table>
                                     </form><h1> images</h1><form action="" method="post" enctype="multipart/form-data" name="form1"><table width="400" border="0" cellspacing="0" cellpadding="0" class="table">
                         <tr>
                           <th width="100px" >&nbsp;</th>
                           <th width="200px" >&nbsp;</th>
                           <th width="100px" >&nbsp;</th>
                         </tr>
                         <tr>
                           <td>Add image</td>
                           <td><input type="file" name="image" id="image" />
                           {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot change these settings</span>{else}<input type="submit" name="save2" id="save2" value="Add image" class="btn btn-info" /{/if}></td>
                           <td>&nbsp;</td>
                         </tr>
                        
                          <tr>
                           <td colspan="3">&nbsp;</td>
                         </tr>
                       </table>
                                     </form>{if $images3.0.is_empty == 'true'}<h4>No images added</h4>{else}{foreach $images3 as $items}<div style=" float:left; width:25%; padding:4px; margin:1px">
                                       <h2 align="center"><img width="99%" src="../prod/{$items.fname}" /><br />
                                         <a onclick="javascript : return confirm('Are you sure?')" href="?pname=files&edit=true&amp;deleteimage=true&amp;deleteid={$items.id}&id={$items.prod_id}">Delete</a></h2>
                                     </div>{/foreach}{/if}<div class="clear" style="display:table; width:100%; height:20px;">&nbsp</div>;<h1> Add Tab</h1><form action="" method="post" enctype="multipart/form-data" name="form1"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
                         <tr>
                           <th width="16%" >&nbsp;</th>
                           <th width="75%" >Actions</th>
                         </tr>
                         <tr>
                           <td>Name
                           <input name="add" type="hidden" id="add" value="true"></td>
                           <td><input type="text" name="tabname" id="tabname"  class="formbtn"></td>
                         </tr>
                        
                         <tr>
    <td>Content </td>
    <td><textarea name="tabdesc"  class="formbtn" id="tabdesc" cols="45" rows="5" style="height:300px;"></textarea>   </td>
  </tr> <tr>
                           <td colspan="2"><div align="center">{if $role == 'Demo'}Demo user cannot Change Settings{else} <input type="submit" name="save" id="save" value="save" class="btn btn-info">{/if}</div></td>
                         </tr>
                       </table>
                                     </form>
                                  </div>{else}<h2>Product not found</h2>{/if}{else}
<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th width="50px">Image</th>
                                                   <th>Name</th>
                                                   <th>Price</th>
                                                   <th>Progress</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               {foreach $files as $items}<tr>
                                                   <td width="50px"><img src="../prod/{$items.image}" height="50px;"/></td><td>{$items.name}</td>
                                                   <td><span class="label label-success">${$items.price}</span></td>
                                                   
                                                   <td><a class="label label-success" href="?pname=files&edit=true&amp;id={$items.id}">Edit</a> <a class="label label-danger" onClick="javascript:return confirm('Are you sure?')" href="?pname=files&id={$items.id}&delete=true">Delete</a>  </td>
                                               </tr>{/foreach}
                                      </table>{/if}
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