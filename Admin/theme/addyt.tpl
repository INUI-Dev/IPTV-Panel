{include file='header.tpl'} </div>
               
<script language='JavaScript'>
      checked = false;
      function checkedAll () {
        if (checked == false){
		checked = true
		}else{
		checked = false
		}
	for (var i = 0; i < document.getElementById('form1').elements.length; i++) {
	  document.getElementById('form1').elements[i].checked = checked;
	}
      }</script> </div> <div id="main-container"><header class="navbar navbar-default">
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
                                
                            <h2><strong>Add  vod </strong><span></span>m3u url</h2>
                      </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content --><div class="panel-body">
                                   <div class="widget-content">
                  <div class="widget-content">
                  <div class="panel-body">
                                   <div class="widget boxed">

              <div class="widget-head" style="margin-top:20px;">
                <h4 class="pull-left"><i class="icon-reorder"></i>Add Youtube video</h4>
                  
                <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">
                    <form name="form1" method="get" action=""><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                      <tr>
                        <td bgcolor="#000066"  style="color:#FFFFFF"><span class="style1">Search Term</span></td>
                        <td bgcolor="#000066"  style="color:#FFFFFF"><span class="style1">Category</span></td>
                        <td bgcolor="#000066"  style="color:#FFFFFF"><span class="style1">Is Featured</span></td>
                        <td bgcolor="#000066"  style="color:#FFFFFF">Subscription required?</td>
                        <td bgcolor="#000066"  style="color:#FFFFFF"><span class="style1">Login Required</span></td>
                        <td bgcolor="#000066"  style="color:#FFFFFF"><span class="style1">Visible</span></td>
                      </tr>
                      <tr>
                        <td>
                          <input name="psearch" type="text" class="form-control col-lg-8" id="psearch" style="width:100%;" value="{if isset($smarty.get.psearch)}{$smarty.get.psearch|escape}{/if}" placeholder="Search" required="required">                                              </td>
                        <td>
                          <select name="select" id="select">
                           {foreach from=$category item=items} <option value="{$items.name}"{if isset($smarty.get.select) && $items.id == $smarty.get.select} selected{/if}>{$items.name}</option>{/foreach}
                          </select>                        </td>
                        <td>
                          <select name="feat" id="feat">
                            <option value="true">Yes</option>
                            <option value="false" selected>No</option>
                          </select>                        </td>
                        <td><select name="sub" id="sub">
                          <option value="true">Yes</option>
                          <option value="false" selected>No</option>
                        </select></td>
                        <td><select name="login" id="login">
                          <option value="true">Yes</option>
                          <option value="false" selected>No</option>
                        </select></td>
                        <td><select name="visible" id="visible">
                          <option value="true" selected>Yes</option>
                          <option value="false">No</option>
                        </select></td>
                      </tr>
                      <tr>
                        <td colspan="6"><div align="center">
                          
                          <input name="pname" type="hidden" id="pname" value="{$pname}">
                          <input type="submit" name="search" id="search" class="btn btn-info" value="Search Youtube">
                          
                        </div></td>
                      </tr>
                    </table> 
                    </form>{if isset($done)}<div class="alert alert-success">
                   Success! Your Youtube videos have been added to dastabase.
                     <br />
                     {$added1} Added.
                    </div>
                   <div class="alert alert-warning"> {$failed} failed due to youtube restriction</div>
                   {/if}{if isset($yt)}
                    <form id="form1" name="form1" method="POST" action="">
      
   <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="3%"><input type='checkbox' name='checkall' onclick='checkedAll();' /></th>
        <th width="17%">Catagroy </th>
        <th width="8%">Image</th>
        <th width="38%">Title          </th>
        <th width="19%">Description </th>
        <th width="15%">Length</th>
        </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="6" bgcolor="#FFFFFF"><div class="bulk-actions">
          <p>&nbsp;            </p>
          <p align="center">
            {if $role == 'Demo'}Demos cannot add videos{else} <input  class="btn btn-info" type="submit" name="Add" id="Add2" value="Insert" />{/if}
          </p>
          <p>&nbsp;</p>
        </div>
         
          <!-- End .pagination -->
            <div class="clear"> </div></td>
      </tr>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$yt item=items}
	
	  <tr valign="middle" style="">
        <td bgcolor="#FFFFFF"><div align="center">
          <input name="add{$items.key}" type="checkbox" style="width:20px;" id="add{$items.key}" value="insert" />
        </div></td>
        <td bgcolor="#FFFFFF">
      
          <input class="input_small" name="cata{$items.key}" type="text"  required="required" id="cata{$items.key}" value="{$cate}" /></td>
        <td bgcolor="#FFFFFF"><a class="modal-box{$items.key}" href="#modal-content"><img src="{$items.img}" alt="" height="60" />
          <input name="hiddenField" type="hidden" id="hiddenField" value="{$smarty.get.sub}">
          <br />
        </a></td>
        <td bgcolor="#FFFFFF"><input style="width:95%" name="name{$items.key}" type="text"  required="required" id="name{$items.key}" value="{$items.title}" /></td>
        <td bgcolor="#FFFFFF">
          <textarea style="width:160px; height:60px" name="desc{$items.key}" id="desc{$items.key}">{$items.desc}</textarea>          <?php ?></td>
        <td bgcolor="#FFFFFF">{$items.time} min
            <input name="fname{$items.key}" type="hidden" id="fname{$items.key}" value="{$items.fname}" />
            <input name="featured{$items.key}" type="hidden" id="featured{$items.key}" value="{$items.feat}" />
          <input name="img{$items.key}" type="hidden" id="img{$items.key}" value="{$items.img}" />
          <input name="length{$items.key}" type="hidden" id="length{$items.key}" value="{$items.time}" />       
          <input name="login{$items.key}" type="hidden" id="login{$items.key}" value="{$items.login}" />
          <input name="hidden{$items.key}" type="hidden" id="hidden{$items.key}" value="{$items.hidden}" /></td>
        </tr>{/foreach}
    </tbody>
  </table>
  <input name="sub1" type="hidden" id="sub1" value="<?php echo $_GET['sub'] ?>" />

<input type="hidden" name="MM_insert" value="form1">
</form>{/if}
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>
                                </div></div></div>
                                </div><!-- END All Products Content -->
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