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
                                
                            <h2><strong>Credits</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                  <div class="widget boxed">
                                    <div class="widget-content">
                  <div class="padd">
                   {if isset($added)}
                     <div class="alert alert-success">
                   Success! Credits updated.
                    </div>
                     {/if}{if isset($smarty.get.add)}
                     <form name="form1" method="post" action="">
                      <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name</th>
                                                 <td><label>
                                                   <input type="text" name="name" id="name">
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                               <tr>
                                                 <th>Line to add</th>
                                                 <td><select name="lines" id="lines">
                                                   {foreach $lines as $items}<option value="{$items.display}">[{if $items.sub == 'true'}Paid Subscription Service{else}Free line{/if}]{$items.name}</option>{/foreach}
                                                 </select></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Length</th>
                                                 <td><select name="length" id="length">
                                    {foreach $time as $items2}<option value="{$items2}">{$items2}</option> {/foreach}</select></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th width="200">Type</th>
                                               <td><label>
                                                 <select name="type" id="type">
                                                   <option value="hour">Hours</option>
                                                   <option value="day">Days</option>
                                                   <option value="month">Months</option>
                                                   <option value="year">Years</option>
                                               </select>
                                               </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                                <tr>
                                                  <th>Credits Cost</th>
                                                  <td><input type="number" id="cost" name="cost"
           value="0"
           min="0" max="10000" /></td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                               <tr>
                                                 <th colspan="3"><label>
                                                  {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Delete files</span>{else} <input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>                                               </tr>
                                      </table>
                     </form>
                     {else}{if isset($deleted)} <div class="alert alert-success">
                   Success! item deleted.
                    </div>{/if}
                    <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="14%">name</th>
        <th width="21%">Credit cost</th>
        <th width="21%">Length</th>
        <th width="21%">&nbsp;</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$users_db  item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF">{$items.name}</td>
        <td bgcolor="#FFFFFF">{$items.cost}</td>
        <td bgcolor="#FFFFFF">{$items.length} {$items.type}(s)</td>
        <td bgcolor="#FFFFFF"><a href="?pname=credits&delete=true&id={$items.id}">Delete</a></td>
        </tr>{/foreach}
  </table>     
                    {/if}            
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
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