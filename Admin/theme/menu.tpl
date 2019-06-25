<a href="../?doLogout=true">Log Out</a>
<ul class="navi">

                <!-- Use the class nred, ngreen, nblue, nlightblue, nviolet or norange to add background color. You need to use this in <li> tag. -->

                <li><a href="?"><i class="icon-desktop"></i> Admin Home</a></li>

                
                <li><a href="?pname=settings"><i class="icon-desktop"></i>Site settings</a></li><!-- Menu with sub menu -->
  <li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'users_db'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'categories'}current open{/if}"><a href="#"><i class="icon-file-alt"></i>Videos</a>
    <ul>
      <li><a href="?pname=addyt">Add Video</a></li>
      <li><a href="?pname=edit">Delete Videos</a></li>
    </ul>
  </li>
  <li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'users_db'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'categories'}current open{/if}"><a href="#"><i class="icon-file-alt"></i>IPV</a>
    <ul>
      <li><a href="?pname=add-package&add=true">Add M3U</a></li>
      <li><a href="?pname=iptv">Manag iptv lines</a></li>
    </ul>
  </li><li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'users_db'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'categories'}current open{/if}"><a href="#"><i class="icon-file-alt"></i>Categories</a>
    <ul>
      <li><a href="?pname=categories&amp;add=true">Add Category</a></li>
      <li><a href="?pname=categories">Manage Categorie</a></li>
    </ul>
  </li>
  <li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'featured'}current open{/if}"><a href="#">Featured
    Home Gallery</a>
      <ul>
      <li><a href="?pname=featured&amp;add=true">Add Featured gallery</a></li>
      <li><a href="?pname=featured">Manage Featured Gallery</a></li>
    </ul>
  </li>
  <li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'addyt'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'products'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'add_product'}current open{/if}{if isset($smarty.get.pname) &&   $smarty.get.pname  == 'upload'}current open{/if}"><a href="#"><i class="icon-file-alt"></i>Products</a>
    <ul>
      <li><a href="?pname=products">Manage Products</a></li>
                    <li><a href="?pname=add_product">Add Product</a></li>
    </ul>
  </li>
  <li class="has_submenu {if isset($smarty.get.pname) &&   $smarty.get.pname  == 'menus'}current open{/if}"><a href="#"><i class="icon-file-alt"></i>Menu</a>
                  <ul>
                        <li><a href="?pname=menus">Manage top menu</a></li> <li><a href="?pname=menus&add=true">Add to top men</a></li>
                  </ul>
  </li>

</ul>
<ul class="navi">
  <li><a href="?pname=themes"><i class="icon-desktop"></i>Change Theme</a></li>
</ul>
<ul class="navi">
  <li><a href="?pname=support"><i class="icon-desktop"></i>Support</a></li>
</ul>
