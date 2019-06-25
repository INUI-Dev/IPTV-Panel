{include file='header.tpl'}
                <div id="main-wrapper">
                  <!-- Row -->
<div class="row">
                        <div class="col-lg-9 col-md-12">
                            
                        </div>
                        <div class="col-lg-3 col-md-6"></div>
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Manage sub length</h4>
                                </div>
                                <div class="panel-body">
                                  <div class="widget boxed">
                                    <div class="widget-content">
                  {if isset($smarty.get.add)}{else}<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
    <thead>
      <tr>
        <th width="61%">          Name</th>
        <th width="18%">Length</th>
        <th width="9%">Actions</th>
        </tr>
    </thead>
    <tfoot>
    </tfoot>
    <tbody class="tooltip-enabled">
	
	
	
	{foreach from=$lines item=items}
	
	  <tr valign="middle" style="">
	    <td bgcolor="#FFFFFF">{$items.name}
          <input type="hidden" name="{$items.id}" id="{$items.id}" value="{$items.id}"></td>
        <td bgcolor="#FFFFFF">{$items.length} - {$items.type}</td>
        <td bgcolor="#FFFFFF"><a href="?pname=manage-subs&amp;delete=true&amp;id={$items.id}">Delete</a></td>
        </tr>{/foreach}
  </table>{/if}
                                    </div>
                                    <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>
                                </div>
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