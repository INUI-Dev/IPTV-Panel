{include file='header.tpl'} </div>
  <script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script> <script language='JavaScript'>
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
      }
    </script>
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
                                
                            <h2><strong>Manage VOD</strong></h2>
                      </div>
                            <!-- END All Products Title -->

                            <!-- All Products Content --><div class="panel-body">
                                   <div class="widget-content">
                  <div class="widget-content">
                  <div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
<div class="filter"></div>  
{if isset($smarty.get.edit)}{if isset($updated)}
<div class="alert alert-success">
                   Success! stream Updated.

                    </div>
{else}
<form id="form1" name="form1" method="post" action=""><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                                <thead>
                            
                         <tr>
                          <td width="16%" bgcolor="#000066"  style="color:#FFFFFF">Name</td>
                           <td width="84%" bgcolor="#000066"  style="color:#FFFFFF">Value</td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Video Title</strong></div></td>
                           <td height="50px;">
                           <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$vid.0.name}">                           </td>
                      </tr></thead>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Video URL</strong></div></td>
                           <td height="50px;"><input name="url" type="text" class="form-control col-lg-8" id="url" value="{$vid.0.fname}" /></td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Category</strong></div></td>
                           <td height="50px;">
                           <select class="form-control col-lg-8" name="cata" id="cata">
                           {foreach from=$category item=items} <option {if $vid.0.series == $items.id} selected{/if} value="{$items.name}">{$items.name}</option>{/foreach}
                          </select>                           </td>
                         </tr>
                         
                         
                         
                         

                         <tr>
                           <td colspan="2"><div align="center">
                             
                             {if $role == 'Demo'}Demo user cannot upload videos{else}    
                           <input type="submit" name="save" id="save" value="Save" class="btn btn-info">
                             
                           {/if}</div></td>
                         </tr>
                         
                       </table>
</form>
{/if}{else}{if !isset($smarty.get.id)} {if isset($deleted)}
<div class="alert alert-success">
                   Success! Video deleted.

                </div>
                    {/if}
                   {if isset($smarty.get.add)}<input name="plname" type="text" id="plname">
                   <label>
                   <input type="submit" name="add2" id="add2" value="Add Playlist">
                   </label>
                    {else}
                    <form method="get">
                      Filter :
                      <label>
                        <input type="text" name="psearch" id="psearch" />
                        <input type="hidden" name="pname" id="pname" value="iptv-live" />
                      </label>
                    </form>
                    <div align="center"></div> {if isset($vod_deleted)}
<div class="alert alert-success">
                   Success! ALL VOD deleted.

                </div>
                    {/if}  <h2><a onclick="javascript: return confirm('Are you sure?');" href="?pname={$smarty.get.pname|escape}&amp;delete_all=true">Delete All VOD</a></h2> 
                 <div align="center"><div style="width:100%; display:table;">  Videos Found : <strong>{$total_rows}</strong>
  <br />
 Page <strong>Videos Found {$page_number +1}</strong> of <strong>{$total_pages + 1}</strong>
  
  </div><div align="center" class="paginations">
    <form name="form" id="form">
  {if $page_number != 0}<a href="?pname={$smarty.get.pname|escape}&pageNum={$page_number -1}">&lt;&lt;Previous</a>{else}&lt;&lt;Previous{/if} 
  <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
   {foreach $pages_num item=items}<option {if $page_number == $items.num} selected="selected"{/if} value="?pname={$smarty.get.pname|escape}&pageNum={$items.num}">{$items.num +1}</option>{/foreach}</select> 
  {if $total_pages > $page_number}<a href="?pname={$smarty.get.pname|escape}&pageNum={$page_number +1}">Next&gt;&gt;
  </a>{else}>Next&gt;&gt;{/if}
</form></div></div> <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                               
                            
    <thead>
      <tr>
        <th width="61%">          Name</th>
        <th width="18%">Category</th>
        <th width="9%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$videos item=items}
	
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF">{$items.name}
          <input type="hidden" name="{$items.id}" id="{$items.id}" value="{$items.id}"></td>
        <td bgcolor="#FFFFFF">{$items.series}</td>
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot edit iptv{else}<a href="?pname={$smarty.get.pname|escape}&edit=true&id={$items.id}">Edit</a> - <a onClick="javascript:return confirm('Are you sure');" href="?pname={$smarty.get.pname|escape}&delete={$items.id}&amp;pageNum={$page_number}">Delete</a>{/if}</td>
        </tr>{/foreach}
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF" colspan="3"><div align="center"><div style="width:100%; display:table;">  Videos Found : <strong>{$total_rows}</strong>
  <br />
 Page <strong>Videos Found {$page_number +1}</strong> of <strong>{$total_pages + 1}</strong>
  
  </div><div align="center" class="paginations">
    <form name="form" id="form">
  {if $page_number != 0}<a href="?pname={$smarty.get.pname|escape}&pageNum={$page_number -1}">&lt;&lt;Previous</a>{else}&lt;&lt;Previous{/if} 
  <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
   {foreach $pages_num item=items}<option {if $page_number == $items.num} selected="selected"{/if} value="?pname={$smarty.get.pname|escape}&pageNum={$items.num}">{$items.num +1}</option>{/foreach}</select> 
  {if $total_pages > $page_number}<a href="?pname={$smarty.get.pname|escape}&pageNum={$page_number +1}">Next&gt;&gt;
  </a>{else}>Next&gt;&gt;{/if}
</form></div></div></td>
	    </tr>
  </table>
                {/if}
                    <label></label>
                    {/if}{/if}</div>
                </div></div></div></div>
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