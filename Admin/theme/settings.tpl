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
                                
                            <h2><strong>Settings</strong><span></span></h2>
                          </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content -->
                            <form action="" method="post" enctype="multipart/form-data" name="form1">
                      {if isset($updated)}
                        <div class="alert alert-success">
                   Success! Settings updated.
                    </div>{else}<table width="100%" border="2" bordercolor="#FFFFFF">
                <tr style="padding:5px;">
                          <th width="16%" height="42" bgcolor="#999999" ><div align="center" class="style1">Name</div></th>
                           <td width="84%" style="padding:5px;" >Value</td>
                         </tr>
                         
                        
                         <tr style="padding:5px;">
                           <th bgcolor="#999999">User agent</th>
                           <td style="padding:5px;"><input name="user_agent" type="text" id="user_agent" class="form-control col-lg-8"  value="{$user_agent}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center">Ministra URL</div></th>
                           <td style="padding:5px;"><label for="user_agent"></label>
                           <input name="ministra" type="text" id="ministra" class="form-control col-lg-8"  value="{$ministra}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center">Ministra Username</div></th>
                           <td style="padding:5px;"><input name="ministra_user" type="text" id="ministra_user" class="form-control col-lg-8"  value="{$ministra_user}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center">Ministra pass</div></th>
                           <td style="padding:5px;"><input name="ministra_pass" type="text" id="ministra_pass" class="form-control col-lg-8"  value="{$ministra_pass}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999">Ministra Directory</th>
                           <td style="padding:5px;"><input name="ministra_dir" class="form-control col-lg-8" type="text" id="ministra_dir" value="{$ministra_dir}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999">Ministra default tariff</th>
                           <td style="padding:5px;"><input name="tariff" class="form-control col-lg-8" type="text" id="tariff" value="{$default_tariff}" /></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Enable store Front</div></th>
                           <td style="padding:5px;"><label>
                             <select name="store" id="store">
                               <option {if $store==false} selected{/if} value="false">yes</option>
                               <option value="true"{if $store==true} selected{/if}>No</option>
                             </select>
                           </label></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Curency</div></th>
                           <td style="padding:5px;"><input name="curency" class="form-control col-lg-8" type="text" id="curency" value="{$curency}" ></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Curency code</div></th>
                           <td style="padding:5px;">
                             <input name="code"  class="form-control col-lg-8" type="text" id="code" value="{$curency_code}">                           </td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Logo url</div></th>
                           <td style="padding:5px;">&nbsp;
                           <input name="logo"  class="form-control col-lg-8" type="text" id="logo" value="{$logo}" /></td>
                      </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Slogan</div></th>
                           <td style="padding:5px;"><input name="slogan"  class="form-control col-lg-8" type="text" id="slogan" value="{$slogan}"></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Site root</div></th>
                           <td style="padding:5px;">
                             <input name="site_root"  class="form-control col-lg-8" type="text" id="site_root" value="{$site_root}" >                         </td>
                         </tr>
                          <tr style="padding:5px;">
                            <th bgcolor="#999999"><div align="center" class="style1">Site Display name</div></th>
                            <td style="padding:5px;"><input name="display"  class="form-control col-lg-8" type="text" id="display" value="{$site_name}" ></td>
                          </tr>
                          <tr style="padding:5px;">
                            <th bgcolor="#999999"><div align="center" class="style1">Display errors</div></th>
                            <td><select class="form-control col-lg-8" name="errors" id="errors">
                             <option {if $errors==true} selected{/if} value="true">Yes</option>
                             <option {if $errors != true} selected{/if} value="false">No</option>
                             
                           </select></td>
                          </tr>
                          <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Use HTTPS</div></th>
                           <td><select class="form-control col-lg-8" name="https" id="https">
                             <option {if $https} selected{/if} value="true">Yes</option>
                             <option {if !$https} selected{/if} value="false">No</option>
                             
                           </select></td>
                         </tr>
                         <tr bgcolor="#999999">
                           <th colspan="2" ><div align="center" class="style1">Paypal</div></th>
                      </tr>
                         
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Paypal Sandbox?</div></th>
                         <td>
                             <select class="form-control col-lg-8" name="sandbox" id="sandbox">
                               <option {if $sandbox} selected{/if} value="true">Yes</option>
                                <option {if !$sandbox} selected{/if} value="false">no</option>
                             </select>                           </td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Paypal Email address</div></th>
                           <td>
                             <input name="paypal" class="form-control col-lg-8" type="text" id="paypal" value="{$paypal_email}">                           </td>
                         </tr>
                          <tr bgcolor="#999999">
                           <th colspan="2" ><div align="center" class="style1">Email</div></th>
                      </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Email Host</div></th>
                           <td>
                             <input name="mail_host"  class="form-control col-lg-8" type="text" id="mail_host" value="{if $role != 'Demo'}{$mail_host}{else}Hidden in demo{/if}">                           </td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Mail From</div></th>
                           <td><input name="mail_from"  class="form-control col-lg-8" type="text" id="mail_from" value="{if $role != 'Demo'}{$mail_from}{else}hidden In demo{/if}"></td>
                         </tr>
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Email username</div></th>
                           <td>
                             <input name="email_name"  class="form-control col-lg-8" type="text" id="email_name" value="{if $role != 'Demo'}{$emailsigb}{else}hidden In demo{/if}">                           </td>
                         </tr>
                         
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Email Password</div></th>
                           <td>
                             <input name="email_pass" type="password" id="email_pass" value="nochange" class="form-control col-lg-8">                           </td>
                         </tr>
                          <tr bgcolor="#999999">
                           <th colspan="2" ><div align="center" class="style1">Support</div></th>
                      </tr>
                          <tr style="padding:5px;">
                            <th bgcolor="#999999"><div align="center" class="style1">Skype username</div></th>
                            <td><input name="skype"  class="form-control col-lg-8" type="text" id="skype" value="{if $role != 'Demo'}{$skype}{else}hidden In demo{/if}"></td>
                          </tr>
                         
                         <tr style="padding:5px;">
                           <th bgcolor="#999999"><div align="center" class="style1">Support email address</div></th>
                           <td><input name="support_email"  class="form-control col-lg-8" type="text" id="support_email" value="{if $role != 'Demo'}{$support_email}{else}hidden In demo{/if}"></td>
                         </tr> <tr style="padding:5px;">
                            <th bgcolor="#999999"><div align="center" class="style1">Display email address</div></th>
                           <td><input name="display_email"  class="form-control col-lg-8" type="text" id="display_email" value="{if $role != 'Demo'}{$email_address}{else}hidden In demo{/if}"></td>
                          </tr>
                         <tr style="padding:5px;">
                           <td colspan="2"><div align="center">
                             
                             <input name="update" type="hidden" id="update" value="true">
                            {if $role == 'Demo'}Demo user cannot Change Settings{else} <input type="submit" name="save" id="save" value="save" class="btn btn-info">{/if}
                             
                           </div></td>
                         </tr>
                       </table>
                    {/if}
                      </form>
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
                        <h2 class="modal-title"><i class="fa fa-pencil"></i> Categories</h2>
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
                    <form id="form1" name="form1" method="POST" action="">
      {if isset($added)}<div class="alert alert-success">
                   Success! Category Added.
                    </div> {/if} {if isset($deleted)}<div class="alert alert-success">
                   Success! Category Deleted.
                    </div> {/if}{if isset($set1)}
     <div class="alert alert-success">
                   Success! Category changed.
                    </div>
      {else}
   {if $cate_empty == 'false' and !isset($deleted)}<form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$cate_id}">
     <br>

    {if $role == 'Demo'}Demo user cannot edit categories{else}
     <input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>
   {else}{if $add}Add Category.<br>
   <form method="post" enctype="multipart/form-data">
     Name : 
    
     <input name="name" type="text" class="form-control col-lg-8" id="name" required="required">
     <br>

    
     {if $role == 'Demo'}Demo user cannot add categories{else}<input type="submit" name="button" class="btn btn-info" id="button" value="Save">{/if}
     
   </form>{else}
   <div align="center"><a href="?pname=categories&add=true">Add new category</a></div><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="91%">Name </th>
        <th width="9%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$cate item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF">
      
          {$items.name}</td>
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot modify Categories{else}<a href="?pname=categories&edit=true&id={$items.id|urlencode}">Edit</a> - <a onClick="javascript:return confirm('Are you sure');" href="?pname=categories&delete=true&id={$items.id|urlencode}">Delete</a>{/if}</td>
        </tr>{/foreach}
  </table>{/if}{/if}{/if}
  <input name="sub1" type="hidden" id="sub1" value="<?php echo $_GET['sub'] ?>" />

<input type="hidden" name="MM_insert" value="form1">
</form>
                  </div>
              </div>
                                </div>
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