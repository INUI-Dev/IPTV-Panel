<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
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
                                
                            <h2><strong>users_db</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <div class="panel-body">
                                   <div class="widget-content">
                  <div class="panel-body">
                                  <div class="widget boxed">
                                    <div class="widget-content">
                  <div class="padd">
                   {if isset($edit) and !isset($ad_set)}
                     <form name="form1" method="post" action=""><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
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
                    </form>
                    </form>
                    {else} 
                    {if isset($ad_set)} <div class="alert alert-success">
                   Success! User updated.
                    </div>{/if}{if isset($deleted)} <div class="alert alert-success">
                   Success! user deleted.
                    </div>{/if} <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="14%">Username</th>
        <th width="44%">Mac address</th>
        <th width="44%">Role          </th>
        <th width="21%">Active?</th>
        <th width="21%">&nbsp;</th>
        
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$users_db  item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF">{$items.uname}</td>
        <td bgcolor="#FFFFFF">{$items.mac}</td>
        <td bgcolor="#FFFFFF">{$items.role}</td>
        <td bgcolor="#FFFFFF">{if $items.active == 'true'} User Active{else}User not active{/if}</td>
        <td bgcolor="#FFFFFF"><a href="?pname=edituser&edit=true&id={$items.uname}">Edit</a> - <a onclick="javascript: return confirm('Are you sure');" href="?pname=users&amp;delete={$items.uname}">Delete</a></td>
        </tr>{/foreach}
  </table>     {/if}            
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
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