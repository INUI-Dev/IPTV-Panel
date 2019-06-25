{include file='header.tpl'}<script type="text/javascript">
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
                <div id="main-wrapper">
                  <!-- Row -->
<div class="row">
                       
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Manage  Live streams</h4>
                                </div>
<div class="panel-body">
                                   <div class="widget-content">
                  <div class="padd">
<div class="filter"></div>  
{if isset($smarty.get.edit)}{if isset($updated)}
<div class="alert alert-success">
                   Success! stream Updated.

                    </div>
{else}
<form id="form1" name="form1" method="post" action=""><table width="100%" border="1" cellspacing="0" cellpadding="10" class="table">
                         <tr>
                          <td width="16%" bgcolor="#000066"  style="color:#FFFFFF">Name</td>
                           <td width="84%" bgcolor="#000066"  style="color:#FFFFFF">Value</td>
                         </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Video Title</strong></div></td>
                           <td height="50px;">
                           <input name="name" type="text" class="form-control col-lg-8" id="name" value="{$vid.0.name}">                           </td>
                      </tr>
                         <tr>
                           <td height="50px;"><div align="center"><strong>Code</strong></div></td>
                           <td height="50px;"><input name="url" type="text" class="form-control col-lg-8" id="url" value='{$vid.0.code}' /></td>
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
                    <div align="center"></div>
                  <div align="center"><div style="width:100%; display:table;">  Videos Found : <strong>{$total_rows}</strong>
  <br />
 Page <strong>Videos Found {$page_number +1}</strong> of <strong>{$total_pages + 1}</strong>
  
  </div><div align="center" class="paginations">
    <form name="form" id="form">
  {if $page_number != 0}<a href="?pname=live&pageNum={$page_number -1}">&lt;&lt;Previous</a>{else}&lt;&lt;Previous{/if} 
  <select name="jumpMenu" id="jumpMenu" onChange="MM_jumpMenu('parent',this,0)">
   {foreach $pages_num item=items}<option {if $page_number == $items.num} selected="selected"{/if} value="?pname=live&pageNum={$items.num}">{$items.num +1}</option>{/foreach}</select> 
  {if $total_pages > $page_number}<a href="?pname=live&pageNum={$page_number +1}">Next&gt;&gt;
  </a>{else}>Next&gt;&gt;{/if}
</form></div></div>  <table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="61%">          Name</th>
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
        <td bgcolor="#FFFFFF">{if $role == 'Demo'}Demo user cannot edit iptv{else}<a href="?pname=edit_streams&edit=true&id={$items.id}">Edit</a> - <a onClick="javascript:return confirm('Are you sure');" href="?pname=edit_streams&delete={$items.id}&amp;pageNum={$page_number}">Delete</a>{/if}</td>
        </tr>{/foreach}
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF" colspan="2"><div align="center"><div style="width:100%; display:table;">  Videos Found : <strong>{$total_rows}</strong>
  <br />
 Page <strong>Videos Found {$page_number +1}</strong> of <strong>{$total_pages + 1}</strong>
  
  </div><div align="center" class="paginations">
    <form name="form" id="form">
  {if $page_number != 0}<a href="?pname=live&pageNum={$page_number -1}">&lt;&lt;Previous</a>{else}&lt;&lt;Previous{/if} 
  <select name="jumpMenu" id="jumpMenu" onChange="MM_jumpMenu('parent',this,0)">
   {foreach $pages_num item=items}<option {if $page_number == $items.num} selected="selected"{/if} value="?pname=live&pageNum={$items.num}">{$items.num +1}</option>{/foreach}</select> 
  {if $total_pages > $page_number}<a href="?pname=live&pageNum={$page_number +1}">Next&gt;&gt;
  </a>{else}>Next&gt;&gt;{/if}
</form></div></div></td>
	    </tr>
  </table>
                {/if}
                    <label></label>
                    {/if}{/if}</div>
                </div></div>
                            </div>
                        </div>
                  </div>
</div><!-- Main Wrapper -->
                <div class="page-footer">
                    <p class="no-s">2018 &copy; {$slogan}.com</p>
                </div>
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
        <div class="cd-overlay"></div>
	

        <!-- Javascripts -->
<script src="theme/assets/plugins/jquery/jquery-2.1.4.min.js"></script>
<script src="theme/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="theme/assets/plugins/pace-master/pace.min.js"></script>
<script src="theme/assets/plugins/jquery-blockui/jquery.blockui.js"></script>
<script src="theme/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="theme/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="theme/assets/plugins/switchery/switchery.min.js"></script>
<script src="theme/assets/plugins/uniform/jquery.uniform.min.js"></script>
<script src="theme/assets/plugins/offcanvasmenueffects/js/classie.js"></script>
<script src="theme/assets/plugins/offcanvasmenueffects/js/main.js"></script>
<script src="theme/assets/plugins/waves/waves.min.js"></script>
<script src="theme/assets/plugins/3d-bold-navigation/js/main.js"></script>
<script src="theme/assets/plugins/waypoints/jquery.waypoints.min.js"></script>
<script src="theme/assets/plugins/jquery-counterup/jquery.counterup.min.js"></script>
<script src="theme/assets/plugins/toastr/toastr.min.js"></script>
<script src="theme/assets/plugins/flot/jquery.flot.min.js"></script>
<script src="theme/assets/plugins/flot/jquery.flot.time.min.js"></script>
<script src="theme/assets/plugins/flot/jquery.flot.symbol.min.js"></script>
<script src="theme/assets/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="theme/assets/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="theme/assets/plugins/curvedlines/curvedLines.js"></script>
<script src="theme/assets/plugins/metrojs/MetroJs.min.js"></script>
<script src="theme/assets/js/modern.js"></script>

<script src="theme/assets/js/pages/dashboard.js"></script>
        
    </body>
</html>