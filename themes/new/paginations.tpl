<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<div align="center" class="paginations"><br />
  Videos Found: <strong>{$total_rows}</strong>
 <br />
 <strong>Page {$page_number +1}</strong> of <strong>{$total_pages + 1}</strong>
  
  <form name="form" id="form">
  {if $page_number != 0}<a href="?id={if isset($cate_id)}{$cate_id|urlencode}{/if}&pageNum={$page_number -1}{if isset($smarty.get.psearch)}&psearch={$smarty.get.psearch|escape}{/if}">&lt;&lt;Previous</a>{else}&lt;&lt;Previous{/if} 
  <select name="jumpMenu" id="jumpMenu" onChange="MM_jumpMenu('parent',this,0)">
   {foreach $pages_num item=items}<option {if $page_number == $items.num} selected="selected"{/if} value="?pageNum={$items.num}&id={if isset($cate_id)}{$cate_id|urlencode}{/if}{if isset($smarty.get.psearch)}&psearch={$smarty.get.psearch|escape}{/if}">{$items.num +1}</option>{/foreach}</select> 
  {if $total_pages > $page_number}<a href="?id={if isset($cate_id)}{$cate_id|urlencode}{/if}&amp;pageNum={$page_number +1}{if isset($smarty.get.psearch)}&psearch={$smarty.get.psearch|escape}{/if}">Next&gt;&gt;
  </a>{else}Next&gt;&gt;{/if}
  </form></div>