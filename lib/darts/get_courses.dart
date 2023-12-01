import 'package:flutter_sandbox/models/course.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main(List<String> args) async {
  String htmlData = """ 
    
  

<SCRIPT language=Javascript>
 
function NewWindow(mypage, myname, w, h, scroll) {
var winl = (screen.width - w) / 2;
var wint = (screen.height - h) / 2;
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable=no'
win = window.open(mypage, myname, winprops)
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
} 

</SCRIPT>






<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
	<!-- loader--><!--plugins-->
	<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
	<link href="assets/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
	<!-- loader-->
	<link href="assets/css/pace.min.css" rel="stylesheet" />
	<script src="assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
	<link href="assets/css/app.css" rel="stylesheet">
	<link href="assets/css/icons.css" rel="stylesheet">
	<title>UiTM Timetable</title>
</head>

<body class="bg-theme bg-theme1">
	<!-- wrapper -->
	<div class="wrapper">
		  
			<div class="card shadow-none bg-transparent">
				 
					<div class="col-xl-9 mx-auto">
				  <hr/>
						<h6 class="mb-0 text-uppercase">Search Timetable   
                        
                        UiTM
                            
                            
                            
                        
                        </h6>
						<hr/>
						<div class="card">
							<div class="card-body">
								<div class="p-4 border rounded">
									<form ty class="row g-3  "  action="search.asp" method="post"   >  
                                
                                         
										
										
										<div class="col-md-5 position-relative">
											<label   class="form-label">Campus</label>
											
											<select class="form-select"     name="yNTU2NDgiiLCJzY29wZSI6Ii9llbGFzdG"  id="search_campus"     >
												<option selected   value="">Choose a Campus...</option>
                                                

                                                 
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="B">B-SELANGOR CAMPUS - ( Please Select a Faculty )<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="APB">APB-SELANGOR CAMPUS - LANGUAGE COURSES<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="CITU">CITU-SELANGOR CAMPUS - CITU COURSES<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="HEP">HEP-SELANGOR CAMPUS - CO-CURRICULUM COURSES<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="=">=-==========================================<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="A">A-UITM KAMPUS SERI ISKANDAR<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="A4">A4-UITM KAMPUS TAPAH<br>    </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="B10">B10-UITM KAMPUS DENGKIL<br>    </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="C">C-UITM KAMPUS JENGKA<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="C3">C3-UITM KAMPUS RAUB<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="D">D-UITM KAMPUS MACHANG<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="D2">D2-UITM KAMPUS KOTA BHARU<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FAB">FAB-KOLEJ WIDAD<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FD">FD-KOLEJ UNIKOP<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FEW">FEW-EAST WEST INTERNATIONAL COLLEGE<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FFE">FFE-KOLEJ FELCRA<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FJ">FJ-KOLEJ ISLAM YAYASAN PELAJARAN JOHOR<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FJA">FJA-INSTITUT SAINS DAN TEK. DARUL TAKZIM<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FL">FL-INS. PROFESIONAL BAITULMAL KUALA LUMPUR<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FM">FM-KOLEJ ANTARABANGSA UNIFIELD<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FN">FN-KOLEJ UNITI<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FQ">FQ-KOLEJ SATT<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="FQI">FQI-QAIWAN INTERNATIONAL UNIVERSITY<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            selected 
                                                            
                                                             
                                                            
                                                            value="J">J-UITM KAMPUS SEGAMAT<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="J4">J4-UITM KAMPUS PASIR GUDANG<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="K">K-UITM KAMPUS SUNGAI PETANI<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="M">M-UITM KAMPUS ALOR GAJAH<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="M1">M1-UITM KAMPUS BANDARAYA MELAKA<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="M3">M3-UITM KAMPUS JASIN<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="N3">N3-UITM KAMPUS KUALA PILAH<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="N4">N4-UITM KAMPUS SEREMBAN 3<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="N5">N5-UITM KAMPUS REMBAU<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="P">P-UITM KAMPUS BUKIT MERTAJAM<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="P2">P2-UITM KAMPUS BERTAM<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="P4">P4-UITM KAMPUS PERMATANG PAUH<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="Q">Q-UITM KAMPUS SAMARAHAN<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="Q5">Q5-UITM KAMPUS SAMARAHAN 2<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="Q6">Q6-UITM KAMPUS MUKAH<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="R">R-UITM KAMPUS ARAU<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="S">S-UITM KAMPUS KOTA KINABALU<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="S2">S2-UITM KAMPUS TAWAU<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="T">T-UITM KAMPUS DUNGUN<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="T4">T4-UITM KAMPUS BUKIT BESI<br>   </option>
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            value="T5">T5-UITM KAMPUS KUALA TERENGGANU (CENDERING)<br>   </option>
                                                     
                                                        
                                                 
                                                 
                                                 
											</select>
											 
                                                                
                                                                
										</div>
										<div class="col-md-5 position-relative">
											<label for="validationTooltip02" class="form-label">Faculty</label>
											
											<select class="form-select"   name="eyJ0eXAiOiiJKV1QiLCJhbGciOiJIUzI1NiJ9" id="search_faculty"   >
												<option selected   value="">Choose a Faculty (For Campus B Student Only)</option>
                                                
                                                
                                                 
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AA">AA-ARSHAD AYUB GRADUATE BUSINESS SCHOOL<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AC">AC-FACULTY OF ACCOUNTANCY<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AD">AD-FACULTY OF ART AND DESIGN<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AM">AM-FACULTY OF ADMINISTRATIVE SCIENCE AND POLICY STUDIES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AP">AP-FACULTY OF ARCHITECTURE PLANNING AND SURVEYING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="AS">AS-FACULTY OF APPLIED SCIENCES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="BA">BA-FACULTY OF BUSINESS AND MANAGEMENT<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="BM">BM-FACULTY OF BUSINESS MANAGEMENT<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="CA">CA-COLLEGE OF CREATIVE ARTS<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="CE">CE-COLLEGE OF ENGINEERING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="CS">CS-FACULTY OF COMPUTER AND MATHEMATICAL SCIENCES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="DS">DS-FACULTY OF DENTISTRY<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="EC">EC-FACULTY OF CIVIL ENGINEERING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="ED">ED-FACULTY OF EDUCATION<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="EE">EE-FACULTY OF ELECTRICAL ENGINEERING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="EH">EH-FACULTY OF CHEMICAL ENGINEERING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="EM">EM-FACULTY OF MECHANICAL ENGINEERING<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="FF">FF-FACULTY OF FILM THEATRE AND ANIMATION<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="HM">HM-FACULTY OF HOTEL AND TOURISM MANAGEMENT<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="HS">HS-FACULTY OF HEALTH SCIENCES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="IC">IC-ACADEMY OF CONTEMPORARY ISLAMIC STUDIES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="IM">IM-FACULTY OF INFORMATION MANAGEMENT<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="IN">IN-INTERNATIONAL<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="LG">LG-ACADEMY OF LANGUAGE STUDIES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="LT">LT-MALAYSIA INSTITUTE OF TRANSPORT<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="LW">LW-FACULTY OF LAW<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="MC">MC-FACULTY OF COMMUNICATION AND MEDIA STUDIES<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="MU">MU-FACULTY OF MUSIC<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="PH">PH-FACULTY OF PHARMACY<br>   </option>
                                                     
                                                     
                                                        
                                                  
                                                     
                                                    <option 
                                                            
                                                             
                                                            
                                                            
                                                            value="SR">SR-FACULTY OF SPORTS SCIENCE AND RECREATION<br>   </option>
                                                     
                                                     
                                                        
                                                 
                                                 
                                                 
											</select>
											
                                                
                                                
                                                
                                                
                                                
                                                
                                                
											</select>
											
										</div>
										 
										  
										<div class="col-12">
											<button class="btn btn-light" type="submit">Display Course Timetable</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div> 
				 
			</div> 
		 
	</div>
	<div class="wrapper">
		  
			<div class="card shadow-none bg-transparent">
				 
					<div class="col-xl-9 mx-auto">
                        
                          
                        
				   
						<div class="card">
                            
							<div class="card-body">
                               
								<div class="p-4 border rounded"> 
                                    
                                    
                                            Filter by Campus : UITM KAMPUS SEGAMAT<br>  
									
								<div class="table-responsive">
									<table id="example2" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th width="20px">No</th>
												<th width="80px" >Course</th>
												<th>Action</th> 
											</tr>
										</thead>
                                        
                                        <tbody>
                                            
                                            
                                                
											<tr>
												<td>1</td>
												<td>ACC030</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ACC030.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>2</td>
												<td>ACC106</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ACC106.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>3</td>
												<td>ACC116</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ACC116.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>4</td>
												<td>ACC117</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ACC117.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>5</td>
												<td>ACC407</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ACC407.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>6</td>
												<td>AIS160</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AIS160.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>7</td>
												<td>AIS205</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AIS205.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>8</td>
												<td>AIS615</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AIS615.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>9</td>
												<td>AIS655</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AIS655.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>10</td>
												<td>ALS102</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ALS102.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>11</td>
												<td>ALS103</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ALS103.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>12</td>
												<td>ALS152</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ALS152.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>13</td>
												<td>ALS201</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ALS201.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>14</td>
												<td>ALS252</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ALS252.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>15</td>
												<td>ASM452</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ASM452.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>16</td>
												<td>AUD339</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AUD339.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>17</td>
												<td>AUD589</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AUD589.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>18</td>
												<td>AUD679</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AUD679.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>19</td>
												<td>AUD689</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/AUD689.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>20</td>
												<td>BBM157</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/BBM157.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>21</td>
												<td>BBM321</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/BBM321.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>22</td>
												<td>BRM917</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/BRM917.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>23</td>
												<td>CRG650</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CRG650.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>24</td>
												<td>CRG660</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CRG660.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>25</td>
												<td>CSC116</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC116.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>26</td>
												<td>CSC121</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC121.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>27</td>
												<td>CSC126</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC126.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>28</td>
												<td>CSC128</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC128.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>29</td>
												<td>CSC159</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC159.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>30</td>
												<td>CSC186</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC186.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>31</td>
												<td>CSC204</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC204.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>32</td>
												<td>CSC248</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC248.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>33</td>
												<td>CSC253</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC253.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>34</td>
												<td>CSC264</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC264.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>35</td>
												<td>CSC301</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC301.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>36</td>
												<td>CSC339</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC339.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>37</td>
												<td>CSC441</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CSC441.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>38</td>
												<td>CTU001</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU001.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>39</td>
												<td>CTU101</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU101.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>40</td>
												<td>CTU152</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU152.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>41</td>
												<td>CTU211</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU211.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>42</td>
												<td>CTU231</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU231.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>43</td>
												<td>CTU241</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU241.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>44</td>
												<td>CTU263</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU263.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>45</td>
												<td>CTU264</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU264.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>46</td>
												<td>CTU271</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU271.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>47</td>
												<td>CTU351</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU351.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>48</td>
												<td>CTU552</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU552.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>49</td>
												<td>CTU554</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/CTU554.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>50</td>
												<td>DGM541</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM541.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>51</td>
												<td>DGM551</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM551.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>52</td>
												<td>DGM611</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM611.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>53</td>
												<td>DGM621</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM621.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>54</td>
												<td>DGM631</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM631.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>55</td>
												<td>DGM651</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM651.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>56</td>
												<td>DGM661</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM661.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>57</td>
												<td>DGM671</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/DGM671.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>58</td>
												<td>ECE551</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECE551.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>59</td>
												<td>ECO162</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECO162.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>60</td>
												<td>ECO211</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECO211.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>61</td>
												<td>ECO261</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECO261.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>62</td>
												<td>ECO415</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECO415.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>63</td>
												<td>ECO531</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ECO531.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>64</td>
												<td>EET699</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/EET699.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>65</td>
												<td>ELC030</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC030.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>66</td>
												<td>ELC121</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC121.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>67</td>
												<td>ELC151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>68</td>
												<td>ELC231</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC231.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>69</td>
												<td>ELC501</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC501.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>70</td>
												<td>ELC590</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC590.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>71</td>
												<td>ELC650</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELC650.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>72</td>
												<td>ELS101</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS101.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>73</td>
												<td>ELS105</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS105.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>74</td>
												<td>ELS106</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS106.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>75</td>
												<td>ELS107</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS107.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>76</td>
												<td>ELS155</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS155.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>77</td>
												<td>ELS156</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS156.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>78</td>
												<td>ELS203</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS203.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>79</td>
												<td>ELS204</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS204.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>80</td>
												<td>ELS206</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS206.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>81</td>
												<td>ELS253</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS253.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>82</td>
												<td>ELS254</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS254.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>83</td>
												<td>ELS256</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS256.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>84</td>
												<td>ELS257</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS257.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>85</td>
												<td>ELS302</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS302.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>86</td>
												<td>ELS303</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS303.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>87</td>
												<td>ELS304</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ELS304.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>88</td>
												<td>ENT300</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ENT300.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>89</td>
												<td>ENT530</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ENT530.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>90</td>
												<td>EWC661</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/EWC661.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>91</td>
												<td>EWC662</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/EWC662.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>92</td>
												<td>EWC663</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/EWC663.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>93</td>
												<td>FAR110</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR110.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>94</td>
												<td>FAR160</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR160.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>95</td>
												<td>FAR210</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR210.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>96</td>
												<td>FAR270</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR270.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>97</td>
												<td>FAR320</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR320.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>98</td>
												<td>FAR410</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR410.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>99</td>
												<td>FAR460</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR460.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>100</td>
												<td>FAR510</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR510.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>101</td>
												<td>FAR570</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR570.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>102</td>
												<td>FAR610</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR610.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>103</td>
												<td>FAR620</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR620.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>104</td>
												<td>FAR661</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR661.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>105</td>
												<td>FAR670</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FAR670.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>106</td>
												<td>FIN242</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN242.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>107</td>
												<td>FIN250</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN250.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>108</td>
												<td>FIN320</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN320.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>109</td>
												<td>FIN323</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN323.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>110</td>
												<td>FIN327</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN327.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>111</td>
												<td>FIN346</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN346.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>112</td>
												<td>FIN348</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN348.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>113</td>
												<td>FIN358</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN358.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>114</td>
												<td>FIN360</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN360.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>115</td>
												<td>FIN365</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN365.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>116</td>
												<td>FIN368</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN368.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>117</td>
												<td>FIN376</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN376.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>118</td>
												<td>FIN377</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN377.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>119</td>
												<td>FIN379</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN379.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>120</td>
												<td>FIN382</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN382.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>121</td>
												<td>FIN420</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN420.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>122</td>
												<td>FIN430</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN430.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>123</td>
												<td>FIN435</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN435.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>124</td>
												<td>FIN533</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN533.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>125</td>
												<td>FIN534</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN534.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>126</td>
												<td>FIN542</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN542.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>127</td>
												<td>FIN544</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN544.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>128</td>
												<td>FIN546</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN546.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>129</td>
												<td>FIN552</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN552.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>130</td>
												<td>FIN555</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN555.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>131</td>
												<td>FIN645</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN645.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>132</td>
												<td>FIN657</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN657.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>133</td>
												<td>FIN658</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/FIN658.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>134</td>
												<td>HBU111</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU111.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>135</td>
												<td>HBU112</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU112.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>136</td>
												<td>HBU115</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU115.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>137</td>
												<td>HBU116</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU116.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>138</td>
												<td>HBU117</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU117.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>139</td>
												<td>HBU121</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU121.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>140</td>
												<td>HBU128</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU128.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>141</td>
												<td>HBU131</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU131.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>142</td>
												<td>HBU132</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU132.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>143</td>
												<td>HBU135</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU135.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>144</td>
												<td>HBU136</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU136.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>145</td>
												<td>HBU137</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU137.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>146</td>
												<td>HBU138</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU138.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>147</td>
												<td>HBU141</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU141.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>148</td>
												<td>HBU151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HBU151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>149</td>
												<td>HKB222</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKB222.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>150</td>
												<td>HKB246</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKB246.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>151</td>
												<td>HKR119</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR119.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>152</td>
												<td>HKR129</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR129.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>153</td>
												<td>HKR139</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR139.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>154</td>
												<td>HKR159</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR159.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>155</td>
												<td>HKR221</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR221.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>156</td>
												<td>HKR225</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HKR225.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>157</td>
												<td>HPD114</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD114.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>158</td>
												<td>HPD118</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD118.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>159</td>
												<td>HPD119</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD119.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>160</td>
												<td>HPD135</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD135.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>161</td>
												<td>HPD136</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD136.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>162</td>
												<td>HPD221</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD221.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>163</td>
												<td>HPD226</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD226.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>164</td>
												<td>HPD229</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD229.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>165</td>
												<td>HPD232</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD232.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>166</td>
												<td>HPD233</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD233.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>167</td>
												<td>HPD235</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD235.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>168</td>
												<td>HPD238</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD238.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>169</td>
												<td>HPD244</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HPD244.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>170</td>
												<td>HRM533</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HRM533.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>171</td>
												<td>HSK226</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSK226.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>172</td>
												<td>HSK227</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSK227.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>173</td>
												<td>HSL221</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSL221.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>174</td>
												<td>HSL223</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSL223.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>175</td>
												<td>HSN112</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSN112.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>176</td>
												<td>HSN221</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSN221.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>177</td>
												<td>HSN223</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/HSN223.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>178</td>
												<td>ICT200</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ICT200.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>179</td>
												<td>ICT500</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ICT500.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>180</td>
												<td>IDA002</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IDA002.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>181</td>
												<td>IDA102</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IDA102.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>182</td>
												<td>IDA202</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IDA202.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>183</td>
												<td>IMC111</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC111.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>184</td>
												<td>IMC112</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC112.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>185</td>
												<td>IMC113</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC113.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>186</td>
												<td>IMC151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>187</td>
												<td>IMC401</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC401.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>188</td>
												<td>IMC402</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC402.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>189</td>
												<td>IMC406</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC406.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>190</td>
												<td>IMC407</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC407.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>191</td>
												<td>IMC651</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC651.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>192</td>
												<td>IMC690</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMC690.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>193</td>
												<td>IMD111</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD111.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>194</td>
												<td>IMD112</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD112.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>195</td>
												<td>IMD161</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD161.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>196</td>
												<td>IMD162</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD162.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>197</td>
												<td>IMD163</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD163.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>198</td>
												<td>IMD164</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD164.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>199</td>
												<td>IMD211</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD211.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>200</td>
												<td>IMD212</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD212.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>201</td>
												<td>IMD213</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD213.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>202</td>
												<td>IMD214</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD214.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>203</td>
												<td>IMD221</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD221.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>204</td>
												<td>IMD222</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD222.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>205</td>
												<td>IMD223</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD223.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>206</td>
												<td>IMD224</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD224.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>207</td>
												<td>IMD225</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD225.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>208</td>
												<td>IMD226</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD226.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>209</td>
												<td>IMD227</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD227.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>210</td>
												<td>IMD311</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD311.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>211</td>
												<td>IMD312</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD312.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>212</td>
												<td>IMD313</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD313.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>213</td>
												<td>IMD314</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD314.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>214</td>
												<td>IMD315</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMD315.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>215</td>
												<td>IMR504</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR504.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>216</td>
												<td>IMR505</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR505.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>217</td>
												<td>IMR552</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR552.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>218</td>
												<td>IMR555</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR555.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>219</td>
												<td>IMR556</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR556.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>220</td>
												<td>IMR604</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR604.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>221</td>
												<td>IMR605</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR605.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>222</td>
												<td>IMR606</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR606.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>223</td>
												<td>IMR652</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR652.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>224</td>
												<td>IMR655</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR655.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>225</td>
												<td>IMR664</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR664.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>226</td>
												<td>IMR665</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMR665.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>227</td>
												<td>IMS455</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS455.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>228</td>
												<td>IMS456</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS456.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>229</td>
												<td>IMS457</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS457.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>230</td>
												<td>IMS506</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS506.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>231</td>
												<td>IMS552</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS552.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>232</td>
												<td>IMS555</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS555.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>233</td>
												<td>IMS556</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS556.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>234</td>
												<td>IMS657</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/IMS657.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>235</td>
												<td>INS200</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INS200.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>236</td>
												<td>INS510</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INS510.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>237</td>
												<td>INV536</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV536.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>238</td>
												<td>INV537</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV537.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>239</td>
												<td>INV553</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV553.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>240</td>
												<td>INV555</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV555.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>241</td>
												<td>INV556</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV556.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>242</td>
												<td>INV613</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV613.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>243</td>
												<td>INV615</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV615.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>244</td>
												<td>INV617</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV617.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>245</td>
												<td>INV621</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV621.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>246</td>
												<td>INV665</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV665.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>247</td>
												<td>INV667</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/INV667.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>248</td>
												<td>ISB533</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB533.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>249</td>
												<td>ISB535</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB535.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>250</td>
												<td>ISB539</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB539.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>251</td>
												<td>ISB542</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB542.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>252</td>
												<td>ISB547</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB547.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>253</td>
												<td>ISB548</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB548.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>254</td>
												<td>ISB566</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB566.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>255</td>
												<td>ISB653</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB653.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>256</td>
												<td>ISB656</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB656.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>257</td>
												<td>ISB658</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISB658.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>258</td>
												<td>ISP250</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ISP250.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>259</td>
												<td>ITT270</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ITT270.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>260</td>
												<td>ITT300</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ITT300.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>261</td>
												<td>ITT320</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/ITT320.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>262</td>
												<td>LAW240</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW240.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>263</td>
												<td>LAW299</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW299.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>264</td>
												<td>LAW346</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW346.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>265</td>
												<td>LAW416</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW416.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>266</td>
												<td>LAW446</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW446.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>267</td>
												<td>LAW448</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW448.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>268</td>
												<td>LAW485</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/LAW485.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>269</td>
												<td>MAF151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>270</td>
												<td>MAF201</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF201.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>271</td>
												<td>MAF251</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF251.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>272</td>
												<td>MAF253</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF253.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>273</td>
												<td>MAF451</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF451.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>274</td>
												<td>MAF503</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF503.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>275</td>
												<td>MAF551</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF551.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>276</td>
												<td>MAF603</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF603.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>277</td>
												<td>MAF651</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF651.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>278</td>
												<td>MAF653</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF653.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>279</td>
												<td>MAF661</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF661.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>280</td>
												<td>MAF671</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF671.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>281</td>
												<td>MAF682</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAF682.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>282</td>
												<td>MAT037</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT037.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>283</td>
												<td>MAT112</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT112.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>284</td>
												<td>MAT123</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT123.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>285</td>
												<td>MAT133</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT133.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>286</td>
												<td>MAT183</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT183.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>287</td>
												<td>MAT210</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT210.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>288</td>
												<td>MAT222</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT222.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>289</td>
												<td>MAT233</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT233.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>290</td>
												<td>MAT263</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT263.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>291</td>
												<td>MAT272</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT272.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>292</td>
												<td>MAT300</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MAT300.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>293</td>
												<td>MGT028</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT028.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>294</td>
												<td>MGT162</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT162.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>295</td>
												<td>MGT269</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT269.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>296</td>
												<td>MGT300</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT300.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>297</td>
												<td>MGT321</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT321.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>298</td>
												<td>MGT334</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT334.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>299</td>
												<td>MGT340</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT340.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>300</td>
												<td>MGT345</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT345.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>301</td>
												<td>MGT361</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT361.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>302</td>
												<td>MGT400</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT400.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>303</td>
												<td>MGT420</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT420.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>304</td>
												<td>MGT430</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT430.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>305</td>
												<td>MGT538</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT538.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>306</td>
												<td>MGT555</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT555.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>307</td>
												<td>MGT646</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT646.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>308</td>
												<td>MGT657</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT657.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>309</td>
												<td>MGT666</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT666.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>310</td>
												<td>MGT917</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT917.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>311</td>
												<td>MGT918</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MGT918.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>312</td>
												<td>MKT243</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT243.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>313</td>
												<td>MKT310</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT310.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>314</td>
												<td>MKT341</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT341.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>315</td>
												<td>MKT420</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT420.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>316</td>
												<td>MKT421</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT421.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>317</td>
												<td>MKT535</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT535.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>318</td>
												<td>MKT537</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT537.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>319</td>
												<td>MKT539</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT539.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>320</td>
												<td>MKT540</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT540.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>321</td>
												<td>MKT542</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT542.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>322</td>
												<td>MKT547</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT547.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>323</td>
												<td>MKT622</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT622.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>324</td>
												<td>MKT623</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT623.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>325</td>
												<td>MKT646</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT646.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>326</td>
												<td>MKT656</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/MKT656.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>327</td>
												<td>OPM530</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/OPM530.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>328</td>
												<td>PAC670</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/PAC670.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>329</td>
												<td>PAC671</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/PAC671.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>330</td>
												<td>PDM111</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/PDM111.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>331</td>
												<td>PDM151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/PDM151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>332</td>
												<td>QMT181</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/QMT181.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>333</td>
												<td>QMT342</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/QMT342.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>334</td>
												<td>STA104</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA104.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>335</td>
												<td>STA111</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA111.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>336</td>
												<td>STA116</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA116.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>337</td>
												<td>STA150</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA150.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>338</td>
												<td>STA210</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA210.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>339</td>
												<td>STA220</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA220.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>340</td>
												<td>STA404</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/STA404.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>341</td>
												<td>TAC101</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAC101.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>342</td>
												<td>TAC151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAC151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>343</td>
												<td>TAC401</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAC401.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>344</td>
												<td>TAC451</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAC451.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>345</td>
												<td>TAC501</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAC501.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>346</td>
												<td>TAX267</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAX267.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>347</td>
												<td>TAX317</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAX317.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>348</td>
												<td>TAX467</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAX467.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>349</td>
												<td>TAX517</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAX517.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>350</td>
												<td>TAX667</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TAX667.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>351</td>
												<td>TMC101</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TMC101.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>352</td>
												<td>TMC151</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TMC151.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>353</td>
												<td>TMC401</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TMC401.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>354</td>
												<td>TMC451</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TMC451.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>355</td>
												<td>TMC501</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TMC501.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>356</td>
												<td>TPT250</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/TPT250.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>357</td>
												<td>UBM599</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/UBM599.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
											<tr>
												<td>358</td>
												<td>UED102</td>
												<td>
                                                    
                                                    

                                                    <button type="button"
                                                            
                                                     onclick ="NewWindow('/timetable1/list/J/UED102.html','name','760','600','yes');return false;"          
                                                            
                                                            class="btn btn-primary">View</button>
                                                
                                                </td> 
											</tr>
                                        
                                               
                                              
                                                
                                                
                                                 
                                            
                                            
                                        
										<tbody>
										 
									</table>
								</div>
								</div>
							</div>
						</div>
					</div> 
				 
			</div> 
		 
	</div>
	
	 
				
				
	
	<!-- end wrapper -->
	<!--start switcher-->
	<div class="switcher-wrapper">
		<div class="switcher-btn"> <i class='bx bx-cog bx-spin'></i>
		</div>
		<div class="switcher-body">
			<div class="d-flex align-items-center">
				<h5 class="mb-0 text-uppercase">Theme Customizer</h5>
				<button type="button" class="btn-close ms-auto close-switcher" aria-label="Close"></button>
			</div>
			<hr/>
			<p class="mb-0">Gaussian Texture</p>
			<hr>
			<ul class="switcher">
				<li id="theme1"></li>
				<li id="theme2"></li>
				<li id="theme3"></li>
				<li id="theme4"></li>
				<li id="theme5"></li>
				<li id="theme6"></li>
			</ul>
			<hr>
			<p class="mb-0">Gradient Background</p>
			<hr>
			<ul class="switcher">
				<li id="theme7"></li>
				<li id="theme8"></li>
				<li id="theme9"></li>
				<li id="theme10"></li>
				<li id="theme11"></li>
				<li id="theme12"></li>
				<li id="theme13"></li>
				<li id="theme14"></li>
				<li id="theme15"></li>
			  </ul>
		</div>
	</div>
	<!--end switcher--> 
<!--plugins--> 
	
	<!--end switcher-->
	<!-- Bootstrap JS -->
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
	<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
	<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>


	<!--app JS-->
	<script src="assets/js/app.js"></script>
	
	
</body>

</html>
  """;

  const campusInput = "J-UITM KAMPUS SEGAMAT";
  const facultyInput = "";
  Course data;
  List<CourseElement> courses = [];

  var campusCode = campusInput.split("-")[0].trim();
  var facultyCode = facultyInput.split("-")[0].trim();

  var url = Uri.parse('https://icress.uitm.edu.my/timetable/search.asp');
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
  };
  var body = {
    'yNTU2NDgiiLCJzY29wZSI6Ii9llbGFzdG': campusCode,
    'eyJ0eXAiOiiJKV1QiLCJhbGciOiJIUzI1NiJ9': facultyCode 
  };

  // HTTP EXAMPLE WITH HEADERS:
  final response = await http.get(url, headers: headers);
  // Status Code 200 means response has been received successfully
  try {
    if (response.statusCode == 302) {
      if (response.headers.containsKey("location")) {
        final redirectUrl = response.headers["location"];
        // print(redirectUrl);

        final redirectedResponse = await http.post(Uri.parse(redirectUrl!), headers: headers, body: body);
        if (redirectedResponse.statusCode == 200) {
          var document = parser.parse(redirectedResponse.body);

          try {
            var tableCourse = document.querySelectorAll("#example2 > tbody")[0];
            var trs = tableCourse.querySelectorAll("tr");
            
            for (var i=0; i<trs.length; i++) {
              final num = trs[i].children[0].text.toString().trim();
              final course = trs[i].children[1].text.toString().trim();
              var course_obj = CourseElement(num: num, course: course, url: '');
              courses.add(course_obj);
            }

            data = Course(
              statusCode: redirectedResponse.statusCode,
              courses: courses
            );

            final courseList = courseToJson(data);
            print(courseList);
          }
          catch (e) {
            print("Exception level 2: $e");
            throw e;
          }

        }
        else
          print("Error: redirectedResponse.statusCode " + (redirectedResponse.statusCode).toString());
      }
      else
        print("Error: Redirect URL or location in header not found");
    
    }
    else {
      print("No redirect.");
      print("Status Code - " + (response.statusCode).toString());
      final courseList = null;
      return courseList;
    }
   
  } catch (e) {
    print("Exception level 1: $e");
  }





  // var document = parser.parse(htmlData);
  // var courses = [];

  // try {
  //   var tableCourse = document.querySelectorAll("#example2 > tbody")[0];
  //   var trs = tableCourse.querySelectorAll("tr");
  //   // var tds = tableCourse.("td");
  //   // const tds = $(element).find("td");
  //   for (var i=0; i<trs.length; i++) {
  //     print(trs[i].children[0].text.toString().trim());
  //     print(trs[i].children[1].text.toString().trim());
  //   }
    

  //   // for (var i=0; i<trCourse!.length; i++) {
  //   //   final num = trCourse[i].text;
  //   //   final course = trCourse[i].text.trim();
  //   //   var course_obj = new CourseElement(num: num, course: course);
  //   //   courses.add(course_obj);
      
  //   // }

  //   // final campusList = courseToJson(Course(statusCode: response.statusCode, courses: courses));
    

  //  }
  //   catch (e) {
  //    throw e;
  //  }
}