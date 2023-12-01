import 'package:flutter_sandbox/models/course.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main(List<String> args) async {
  String htmlData = r""" 
<html lang="en" data-select2-id="select2-data-109-5q3a"><head><script>
window.onloadsss = function() {
     

</script>

<script>
window.onloadX = function() { 
    
       var client = new XMLHttpRequest();   
        var client_fac = new XMLHttpRequest();    

        client.open('GET', 'combo_select_campus.txt?id=now()');
        client_fac.open('GET', 'combo_select_faculty.txt?id=now()'); 
    
        client.onreadystatechange = function() {
            
            
            var select = document.getElementById("search_campus"),
                options = client.responseText.split("<br>"),
                i,
                _html = "";
            for ( i = 0; i < options.length; i++ ) { 

                _html += "<option value=" + options[i] +">" + options[i] + "</option>";
            }
            select.innerHTML = _html;
            
            
            var select_fac = document.getElementById("search_faculty"),
                options = client_fac.responseText.split("<br>"),
                j,
                _html = "";
            
            for ( j = 0; j < options.length; j++ ) { 

                _html += "<option value=" + options[j] +">" + options[j] + "</option>";
            }
            select_fac.innerHTML = _html; 
            
        }
        client_fac.send(); 
        client.send();
     
    
}
</script> 

  




    
        
        <meta charset="utf-8">
        <title>STUDENT CLASS TIMETABLE - Universiti Teknologi MARA</title> 
         

        <meta http-equiv="cache-control" content="no-cache, must-revalidate, post-check=0, pre-check=0,max-age=0">  
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT">
        <meta http-equiv="pragma" content="no-cache"> 
        
          
        <meta name="keywords" content="UiTM, University, uitm, ">
        <meta name="rights" content="Universiti Teknologi Mara (UiTM) has made every effort to produce information on this website that is current, and informative However, this site is provided for information purposes only, based on general information provided by third parties.">
        <meta name="description" content="To establish UiTM as a Globally Renowned University of Science, Technology, Humanities and Entrepreneurship">
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App favicon -->
        <link rel="shortcut icon" href="favicon.ico">
        
        <!-- Google tag (gtag.js) -->
        <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-57H5ZV57XF"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-57H5ZV57XF');
        </script>

        
          <script async="" defer="" data-website-id="1b00562f-d884-4342-9e78-afce543b81a2" src="https://a.uitm.edu.my/analytics/umami.js"></script>

        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
 
        <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">     
 
        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css">
        <!-- App Css-->
        <link href="assets/css/app.css?id=now()" id="app-style" rel="stylesheet" type="text/css">
        
        <link href="assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"> 
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
        <!-- START THEME LAYOUT STYLE -->  
    </head>
    
    
     


    <body class="login-bg" cz-shortcut-listen="true" data-select2-id="select2-data-9-iohg">
         
        <div class="account-pages my-5 pt-sm-1" data-select2-id="select2-data-60-6kxt">
            <div class="container" data-select2-id="select2-data-59-cj5u">
                <div class="row justify-content-center" data-select2-id="select2-data-58-eqsh">
                    <div class="col-md-7 col-lg-7 col-xl-7" data-select2-id="select2-data-8-t7gl">
                        <div class="card overflow-hidden" data-select2-id="select2-data-7-utk4">
                            <div class="bg-soft-primary">
                                <div class="row">
                                    <div class="col-12"> 
                                           
                                         <a target="_blank" href="https://www.facebook.com/uitmrasmi" class="text-muted">
                                        <img src="logo_01_tt.jpg?id=now()" alt="" class="img-fluid">                                        </a>                                    </div>
                                </div>
                            </div>
                           
                            
                <form onsubmit="check_form_before_submit();return false;" id="form_submit" data-select2-id="select2-data-form_submit" data-gtm-form-interact-id="0">    
                            
                            
                            <div class="card-body pt-0" data-select2-id="select2-data-6-9egk"> 
                                 
                                <div class="p-1" data-select2-id="select2-data-5-vksd"> 
                                        <div class="form-group">
                                            <p></p>
                                               
                                        </div>
                
                                        <div class="form-group" data-select2-id="select2-data-4-an3p">
                                            <label for="username">Select a Campus : 
                                            </label>  
                                            <select onchange="ShowHideDiv()" name="search_campus" id="search_campus" class="form-control basic-single find_cam_icress_student select2-hidden-accessible" data-select2-id="select2-data-search_campus" tabindex="-1" aria-hidden="true"> 
 
                                            <option value="B" data-select2-id="select2-data-56-s4a0">SELANGOR CAMPUS - ( Please Select a Faculty )</option><option value="J" data-select2-id="select2-data-107-91kb">J - UITM KAMPUS SEGAMAT</option><option value="C3" data-select2-id="select2-data-203-66mi">C3 - UITM KAMPUS RAUB</option><option value="T4" data-select2-id="select2-data-251-3sl6">T4 - UITM KAMPUS BUKIT BESI</option><option value="T5" data-select2-id="select2-data-299-rtyv">T5 - UITM KAMPUS KUALA TERENGGANU (CENDERING)</option><option value="S2" data-select2-id="select2-data-347-leca">S2 - UITM KAMPUS TAWAU</option></select><span class="select2 select2-container select2-container--default select2-container--below select2-container--focus" dir="ltr" data-select2-id="select2-data-1-ia73" style="width: 592.987px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-search_campus-container" aria-controls="select2-search_campus-container"><span class="select2-selection__rendered" id="select2-search_campus-container" role="textbox" aria-readonly="true" title="S2 - UITM KAMPUS TAWAU">S2 - UITM KAMPUS TAWAU</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> 
 
                                        </div>
                     
                                    
                                    
                                    
                                        <div style="display: none;" id="div_search_faculty" class="form-group">
                                            <label for="username">Select a Faculty (if relevant) : 
                                            </label>
                                            
                                             <select style="width: 100%" name="search_faculty" id="search_faculty" class="form-control basic-single find_fac_icress_student select2-hidden-accessible" data-select2-id="select2-data-search_faculty" tabindex="-1" aria-hidden="true"> 
 
                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="select2-data-2-r1ov" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-search_faculty-container" aria-controls="select2-search_faculty-container"><span class="select2-selection__rendered" id="select2-search_faculty-container" role="textbox" aria-readonly="true"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> 
                                             
                                        </div>
                                    
                                    
                                    
                                        <div class="form-group">
                                            <label for="username">Course Code : 
                                            </label>
                                            <input maxlength="70" type="text" class="form-control" name="search_course" id="search_course" style="background: #F9F9E5" data-gtm-form-interact-field-id="0"> <br>

                                            
                                        </div>
                                    
                                    
                                    
                                    
                                         
                                        <div class="form-group">
                                            
                                        </div>
                                        
                                        <div class="mt-3">
                                            <button id="btnSubmit" onclick="check_form_before_submit();" class="btn btn-primary btn-block waves-effect waves-light" type="button">Search</button>
                                        </div>
                                        <div class="form-group">
                                            
                                        </div>
                                     
                                     
                                    
                                    
                                </div>
                                
                                 <div class="form-group" id="div_confirm_wizard">
                

                    <div align="center" class="panel-heading"><h5 style="color:blue;">Search Result :</h5>

                    
                    <h5 style="color:red;">13 Record Founds</h5>

                    <h5>
                          <hr>
                         Courses With Slot Semester : 20234<br>

                     

                    </h5>

</div>
                
                      <p></p>
                    
                                    
 
         
                                        <div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="row"><div class="col-sm-12 col-md-6"></div><div class="col-sm-12 col-md-6"><div id="datatable-buttons_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="datatable-buttons"></label></div></div></div><div class="row"><div class="col-sm-12"><table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" style="border-collapse: collapse; border-spacing: 0px; width: 100%;" role="grid" aria-describedby="datatable-buttons_info">
                                            <thead>
                                            <tr role="row"><th width="10" class="sorting_asc" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1" style="width: 22.2px;" aria-sort="ascending" aria-label="No: activate to sort column descending">No</th><th width="20" class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1" style="width: 58.2px;" aria-label="Course: activate to sort column ascending">Course</th><th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1" style="width: 268.2px;" aria-label="Action: activate to sort column ascending">Action</th></tr>
                                            </thead>
        
        
                                            <tbody>
                                                
                                                

                                                  

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                      

                                                        
                                                    
                                                
                                                
                                                
                                               
                                                
                                            <tr class="gradeU odd" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">1.</td> 
                                                            <td>ACC030  </td> 
                                                            <td>
                                                            
                                                            <button id="btn1" onclick="window.open('index_tt.cfm?id1=420596B1F1A7B489DCEE22CD045CA25F0A18&amp;id2=5F5DD497F952883A8ECCC711707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU even" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">2.</td> 
                                                            <td>BIO083  </td> 
                                                            <td>
                                                            
                                                            <button id="btn2" onclick="window.open('index_tt.cfm?id1=420596B1F1A4BE85DCE521CD045CA25F0A18&amp;id2=5F5DD497F95182368EC7C411707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU odd" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">3.</td> 
                                                            <td>CHM083  </td> 
                                                            <td>
                                                            
                                                            <button id="btn3" onclick="window.open('index_tt.cfm?id1=420596B1F1A5BF87DCE521CD045CA25F0A18&amp;id2=5F5DD497F95083348EC7C411707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU even" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">4.</td> 
                                                            <td>CTU001  </td> 
                                                            <td>
                                                            
                                                            <button id="btn4" onclick="window.open('index_tt.cfm?id1=420596B1F1A5A39FDCED23CD045CA25F0A18&amp;id2=5F5DD497F9509F2C8ECFC611707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU odd" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">5.</td> 
                                                            <td>ELC010  </td> 
                                                            <td>
                                                            
                                                            <button id="btn5" onclick="window.open('index_tt.cfm?id1=420596B1F1A3BB89DCEC22CD045CA25F0A18&amp;id2=5F5DD497F956873A8ECEC711707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU even" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">6.</td> 
                                                            <td>ELC030  </td> 
                                                            <td>
                                                            
                                                            <button id="btn6" onclick="window.open('index_tt.cfm?id1=420596B1F1A3BB89DCEE22CD045CA25F0A18&amp;id2=5F5DD497F956873A8ECCC711707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU odd" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">7.</td> 
                                                            <td>IDA002  </td> 
                                                            <td>
                                                            
                                                            <button id="btn7" onclick="window.open('index_tt.cfm?id1=420596B1F1AFB38BDCED20CD045CA25F0A18&amp;id2=5F5DD497F95A8F388ECFC511707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU even" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">8.</td> 
                                                            <td>MAT037  </td> 
                                                            <td>
                                                            
                                                            <button id="btn8" onclick="window.open('index_tt.cfm?id1=420596B1F1ABB69EDCEE25CD045CA25F0A18&amp;id2=5F5DD497F95E8A2D8ECCC011707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU odd" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">9.</td> 
                                                            <td>MAT083  </td> 
                                                            <td>
                                                            
                                                            <button id="btn9" onclick="window.open('index_tt.cfm?id1=420596B1F1ABB69EDCE521CD045CA25F0A18&amp;id2=5F5DD497F95E8A2D8EC7C411707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr><tr class="gradeU even" role="row">
                                                            <td class="dtr-control sorting_1" tabindex="0">10.</td> 
                                                            <td>MAT086  </td> 
                                                            <td>
                                                            
                                                            <button id="btn10" onclick="window.open('index_tt.cfm?id1=420596B1F1ABB69EDCE524CD045CA25F0A18&amp;id2=5F5DD497F95E8A2D8EC7C111707D9BBD486C')" class="btn btn-success btn-block waves-effect waves-light" type="button">View</button>  
                                                            
                                                            </td>
                                                        </tr></tbody>
                                        </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="datatable-buttons_info" role="status" aria-live="polite">Showing 1 to 10 of 13 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="datatable-buttons_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="datatable-buttons_previous"><a href="#" aria-controls="datatable-buttons" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="datatable-buttons" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="datatable-buttons" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item next" id="datatable-buttons_next"><a href="#" aria-controls="datatable-buttons" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                                    
                    
                    
                    
                    

                
                    
                    
                    
                    
 
         
        <script src="assets/js/pages/datatables.init.js"></script>    
        

</div>
                                       
                                    
                                    
                                    
                                    
                                        <div class="mt-3 text-center"> 
                                            
                                        </div> 
                                       <div class="mt-3 text-center"> 
                                            <p><br>© 2022 Academic Affairs Division. </p>
                                        </div> 
                                    
                            </div>
                    
                    
                                       
    
    
   </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>        
        <!-- App js -->
        <script src="assets/js/app.js"></script>
        
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        
        
        
        <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
          
         
        <script src="assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
 
        <script src="assets/js/pages/datatables.init.js"></script>    
        
        
    
 
                         
     <script> 
      function ShowHideDiv() {    
        search_campus  = $('#search_campus').val();   

           if(search_campus == 'B'  ){  
               $('#div_search_faculty').show(); 
           }
           else{
               $('#div_search_faculty').hide();  
           }
 
          
      };
     </script> 
                                    
                               
      
<script type="text/javascript">
var sc_project=11464115; 
var sc_invisible=0; 
var sc_security="c261c775"; 
var scJsHost = (("https:" == document.location.protocol) ?
"https://secure." : "http://www.");
document.write("<sc"+"ript type='text/javascript' src='" +
scJsHost+
"statcounter.com/counter/counter.js'></"+"script>");
</script><script type="text/javascript" src="https://secure.statcounter.com/counter/counter.js"></script><span class="statcounter"><a id="sc_counter_11464115" class="statcounter" href="https://www.statcounter.com/" target="_blank"><img src="https://c.statcounter.com/t.php?sc_project=11464115&amp;u1=67F5B682E9694F6F4B6BC7F3476FA840&amp;java=1&amp;security=c261c775&amp;sc_snum=1&amp;sess=de22c1&amp;sc_rum_e_s=270&amp;sc_rum_e_e=284&amp;sc_rum_f_s=0&amp;sc_rum_f_e=239&amp;p=0&amp;pv=10&amp;rcat=r&amp;rdomo=github.com&amp;rdomg=1&amp;jg=1&amp;rr=19.18.13.12.9.5.4.4.3&amp;resolution=1536&amp;h=865&amp;camefrom=https%3A//icress.uitm.edu.my/&amp;u=https%3A//simsweb4.uitm.edu.my/estudent/class_timetable/index.htm&amp;t=STUDENT%20CLASS%20TIMETABLE%20-%20Universiti%20Teknologi%20MARA&amp;sc_random=0.7843514094925441" alt="StatCounter - Free Web Tracker and Counter" border="0" undefined=""></a></span>
<noscript><div class="statcounter"><a title="Web Analytics"
href="http://statcounter.com/" target="_blank"><img
class="statcounter"
src="//c.statcounter.com/11464115/0/c261c775/0/" alt="Web
Analytics"></a></div></noscript>
<!-- End of StatCounter Code for Default Guide -->
    
<script type="text/javascript">
    $("#search_course").keyup(function(event) {
    if (event.keyCode === 13) {
        check_form_before_submit();
    }
});
</script>    
     
<script type="text/javascript">
function check_form_before_submit(){
    
    
    var search_course  =document.getElementById('search_course').value ;   
    var search_campus  =document.getElementById('search_campus').value ;   
    var search_faculty =document.getElementById('search_faculty').value ;    
     
    
    //len_1 = search_studentid.length; 
    
    if ( search_campus.length==0   ){
        swal("Please select a valid Campus", "Field Error", "error");  
        return false; 
    }; 
      
    if ( search_campus=='B'   ){ 

        if ( search_faculty.length==0   ){
            swal("Please select a valid Faculty", "Field Error", "error");  
            return false; 
        };  
        
    }; 
        
    
    
    text = "<div  align='center'><br><h5 style='color:red;'>Please wait, Checking your searching criteria</h5><img src='please_wait2.gif'   alt='' width='279' height='60'  /></div>";
    $("#div_confirm_wizard").html(text);   
    
    //alert('out');
        $.ajax({
          url: 'index_result.cfm',
          type: 'post',
          //dataType: 'json',
          data: $('#form_submit').serialize(),

         success: function(data) {  
                    $("#div_confirm_wizard").html(data);
                   },

          error: function (data) {

                     $("#div_confirm_wizard").html('Some Error Occured. Please reload.');
          },

      });   
    
    
     
}
</script>	
		
    
    

    
<script type="application/javascript">
    function CheckForm() { 
     
    
    var vlogin =document.getElementById('login').value ;   
    var vpwd =document.getElementById('password').value ; 
         
                               
    if (vlogin.length < 8)
		{
             swal({
			title: "Your Key-in Student ID is not valid. Please Modify your Student ID",
			text: "*****************************",
			timer: 3000
		      });   
             
			return false;
		}                                
    if (vpwd.length < 3)
		{
            
            swal("Opps", "Your Key-in Password is not valid. Please Modify your Password", "error");  
			return false;
		}   
            

    
}

</script>
           
 
        
    <script>  
        

    $('.find_cam_icress_student').select2({
        //minimumInputLength: 2,
        ajax: {
            
            url: 'cfc/select.cfc?method=find_cam_icress_student',

            dataType: 'json',
            data: function (params) {
                var query = {
                    key: params.term || 'All',
                    page: params.page || 1,
                    page_limit: params.page_limit || 30
                }
                return query;
                },

        }
    });
     
</script>
           
        
    <script>  
        

    $('.find_fac_icress_student').select2({
        //minimumInputLength: 2,
        ajax: {
            
            url: 'cfc/select.cfc?method=find_fac_icress_student',

            dataType: 'json',
            data: function (params) {
                var query = {
                    key: params.term || 'All',
                    page: params.page || 1,
                    page_limit: params.page_limit || 30
                }
                return query;
                },

        }
    });
     
</script>
           <scribe-shadow id="crxjs-ext" style="position: fixed; width: 0px; height: 0px; top: 0px; left: 0px; z-index: 2147483647; overflow: visible;"></scribe-shadow></body></html>
  """;

  Course data;
  List<CourseElement> courses = [];

  var url = Uri.parse("https://simsweb4.uitm.edu.my/estudent/class_timetable/index_result.cfm");
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
    "x-requested-with": "XMLHttpRequest",
    "Referer": "https://simsweb4.uitm.edu.my/estudent/class_timetable/index.htm",
  };
  var body = "search_campus=B&search_faculty=AA&search_course=";

  final response = await http.post(url, headers: headers, body: body);
  try {
    var document = parser.parse(response.body);
    // var document = parser.parse(htmlData);
    // print(document);

    try {
      var tableCourse = document.querySelectorAll("#datatable-buttons > tbody")[0];
      var trs = tableCourse.querySelectorAll("tr");
      
      for (var i=0; i<trs.length; i++) {
        final num = trs[i].children[0].text.toString().trim();
        final course = trs[i].children[1].text.toString().trim();
        var course_obj = CourseElement(num: num, course: course);
        courses.add(course_obj);
      }

      data = Course(
        statusCode: response.statusCode,
        courses: courses
      );

      final courseList = courseToJson(data);
      print(courseList);
    }
    catch (e) {
      print("Exception level 2: $e");
      throw e;
    }
   
  } catch (e) {
    print("Exception level 1: $e");
  }
}