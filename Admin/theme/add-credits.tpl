{include file='header.tpl'}
                <div id="main-wrapper">
                  <!-- Row -->
<div class="row">
                       
                        <div class="col-lg-12 col-md-12">
<div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Add users_db</h4>
        </div>
                                <div class="panel-body">
<div class="table-responsive project-stats">  
                                       {if isset($updated)}
                                         <div class="alert alert-success">Success : Credits Added</div>
                                      {/if}{if isset($taken)}
                                         <div class="alert alert-warning">Username or email taken please choose another</div>
                                      {/if}<form name="form1" method="post" action=""><table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           
                                           <tbody>
                                               
                                               <tr>
                                                 <th width="200">Name</th>
                                                 <td> New Value</td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                 <th>Username</th>
                                                 <td><label>
                                                 <select name="uname" id="uname">
                                                   {foreach $users_db as $items}<option value="{$items.uname}">{$items.uname}</option>{/foreach}
                                                 </select>
                                                 </label></td>
                                                 <td>&nbsp;</td>
                                               </tr>
                                               
                                               
                                               
                                                <tr>
                                                  <th>Credits amount</th>
                                                  <td><input type="number" id="credits" name="credits"
           value="0"
           min="1" max="10000" /></td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                
                                               <tr>
                                                 <th colspan="3"><label>
                                                  {if $role == 'Demo'}<span class="label label-danger">Demo Account cannot Delete files</span>{else} <input class="btn btn-primary" type="submit" name="save" id="save" value="Save">{/if}
                                                 </label></th>>                                               </tr>
                                      </table>
                                       </form></div>
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