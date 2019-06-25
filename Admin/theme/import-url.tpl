{include file='header.tpl'}
                <div id="main-wrapper">
                  <!-- Row -->
<div class="row">
                       
    <div class="col-lg-12 col-md-12">
<div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Manage Packages</h4>
                                </div>
        <div class="panel-body"> <div class="widget-content">
            <div class="padd">
<div class="filter"></div>
<form method="post" enctype="multipart/form-data" id="form1" name="form2">
                {if isset($exists)}
                  <div class="alert alert-danger">
                   Error! URL Not Found.
                    </div>
{/if} {if isset($added)}<div class="alert alert-success">
                   Success! Streams added.

                    </div>
                {else}
                <label>
                M3U URL:<br>
                <input type="text" name="url" id="url">
                <br>
                <br>
                Image:<br> 
                <input type="file" name="image" id="image">
                <br>
                Free?: 
                <select name="free" id="free">
                  <option value="free" selected>free</option>
                  <option value="sub">Subscription</option>
                </select>
                <br>
               {if $role == 'Demo'} Demo user cannot add m3u{else} 
               <input type="submit" name="save" id="save" value="Submit">{/if}                </label>
                {/if}
              </form>
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