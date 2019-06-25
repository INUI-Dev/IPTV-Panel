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
                   {if isset($added)}<div class="alert alert-success">
                   Success! Line Added.

                    </div>{else}{if isset($added)}{else}
                    <form name="form1" method="post" action="">
                      <p>Name:<br>
                        
                        <input type="text" name="name" id="name" style="width:80%">
                        
                        <br>
                        Cost:<br>
                        
                        <input style="width:80%" type="text" name="credits" id="credits">
                        
                        <br>
                      Length:<br>
                      <select style="width:80%" name="length" id="length">
                                    {foreach $time as $items2}<option value="{$items2}">{$items2}</option> {/foreach}</select>
                      <br>
                      Type:<br>
                      
                      <select style="width:80%" name="type" id="type">
                        <option value="day" selected>Day(S)</option>
                        <option value="month">Month(s)</option>
                        <option value="year">Year(s)</option>
                      </select>
                      
                      <br>
                      
                      <input type="submit" name="save" id="save" value="Save">
                      
                      </p>
                      </form>
                    {/if}{/if}                                    </div>
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