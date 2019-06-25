{include file='header.tpl'}
                <div id="main-wrapper">
                  <!-- Row -->
<div class="row">
                       
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Messages</h4>
                                </div>
                                <div class="panel-body">
                                   <div class="table-responsive project-stats">  
                                       {if isset($edit)}<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead style="width:100px;">
                                               <tr>
                                                   <th width="58">Email</th>
                                                   <th width="154">Value</th>
                                             </tr>
                                           </thead>
                                           <tbody>
                                               <tr>
                                                   <td>Email</td>
                                                   <td>{$mesage.0.from_email}</td>
                                               </tr>
                                               <tr>
                                                 <td>Subject</td>
                                                 <td>{$mesage.0.subject}</td>
                                               </tr>
                                              
                                               <tr>
                                                 <td>Message :</td>
                                                 <td>{$mesage.0.message|nl2br}</td>
                                               </tr> <tr>
                                                 <td colspan="2"><input class="btn btn-primary" type="submit" name="save" id="save" value="Reply"></td>
                                               </tr>
                                      </table>
                         {else}<table id="ecom-products" class="table table-bordered table-striped table-vcenter">
                            
                                           <thead>
                                               <tr>
                                                   <th>Email</th>
                                                   <th>Status</th>
                                                   <th>Subject</th>
                                                   <th>Progress</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               {foreach $messages as $items}<tr>
                                                   <td>{$items.from_email}</td>
                                                   <td><span class="label label-success">{$items.status}</span></td>
                                                   <td>{$items.subject}</td>
                                                   <td><a class="label label-danger" href="?pname=messages&id={$items.id}">View</a></td>
                                               </tr>{/foreach}
                                      </table>{/if}</div>
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