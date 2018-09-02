
<!-- <div style="padding-left: 30px;padding-right: 30px">
   <ui-view> </ui-view>
    </div> -->
<!-- Source for the bootstrap login form tthe
  urls
  https://bootsnipp.com/tags/login
  https://bootsnipp.com/snippets/featured/login-amp-signup-forms-in-panel
   -->

<!-- <div style="padding-left: 30px; padding-right: 30px">
		<ui-view> </ui-view>
	</div> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>



</script>
<h3>Register User</h3>

<!-- Spring Boot Multi File Upload with AngularJS Example -->

<!-- https://o7planning.org/en/11673/spring-boot-file-upload-with-angularjs-example -->

<div class="container">
	<div class="row clearfix">
		<div class="container main-content" >
			<div
				class="col-xs-12 col-sm-12 col-md-8 col-lg-6  column col-sm-offset-0 col-md-offset-2 col-lg-offset-3">
				 
				<h2>Spring Boot File Upload with AngularJS</h2>
				      <c:out value="${numberOfImageSlotsAvailable}" /> ${numberOfImageSlotsAvailable} is  number of images that can be added
				
				<%-- <c:forEach items='${requestScope}' var="numberOfImageSlotsAvailable" varStatus="status">     
                 ${numberOfImageSlotsAvailable}
         </c:forEach> --%>
         <div ng-controller="MultiFileUploadController">
         
         
         <table class="table">
						
						<tbody>
						 <c:forEach var="i" begin="0" end="${numberOfImageSlotsAvailable}">
							<tr>
								
								<td>  <form>
   <input type="file" accept="image/*" id="inputFile_${i}" onchange="showMyImage(this,'thumbnail_${i}')" file-model="myForm.files[0]" /> </td>
								<td> <img id="thumbnail_${i}" width="158" height="158"  style="display:none" src="" alt="image"/> </td>
								<td> <c:out value="${i}" />  <button type="button" ng-click="doUploadFile()">Upload</button> </td>
								
								</form>
							</tr>
							
							<tr>
								<td colspan="3">Upload Result : <span ng-bind="uploadResult"></span>          
						
						        </td>
					
							</tr>
							
							 </c:forEach>
							
							</tbody>
					</table>
         
         
       <%--   <c:forEach var="i" begin="0" end="${numberOfImageSlotsAvailable}">
           <form>
   <input type="file" accept="image/*" id="inputFile_${i}" onchange="showMyImage(this,'thumbnail_${i}')" />
 <br/>
<img id="thumbnail_${i}" style="width:20%; margin-top:10px;"  src="" alt="image"/>
</form>
            <c:out value="${i}" />

            <br />
          </c:forEach> --%>
          
          
          
        </div>
				<!-- <div ng-controller="MultiFileUploadController">
					         
					<form>
						            Description: <br />             <input type="text"
							name="description" ng-model="myForm.description"
							style="width: 350px;" />             <br />
						<br />                             File to upload (1): <input
							type="file" file-model="myForm.files[0]"   /><br /> 
							
							 <div class="col-md-6">
       <img ng-src="{{filepreview}}" class="img-responsive" ng-show="filepreview"/>
    </div>    
						            File to upload (2): <input type="file"
							file-model="myForm.files[1]" /><br />                File to
						upload (3): <input type="file" file-model="myForm.files[2]" /><br />   
						            File to upload (4): <input type="file"
							file-model="myForm.files[3]" /><br />                File to
						upload (5): <input type="file" file-model="myForm.files[4]" /><br />   
						            
						<button type="button" ng-click="doUploadFile()">Upload</button>
						         
					</form>
					         
					<h2>Upload Results:</h2>
					         
					<div style="border: 1px solid #ccc; padding: 5px;">
						            <span ng-bind="uploadResult"></span>          
					</div>
					      
				</div> -->
				
					<div ng-controller="MultiFileUploadController">
					
					
					         
					<!-- <form>
						            Description: <br />             <input type="text"
							name="description" ng-model="myForm.description"
							style="width: 350px;" />             <br />
						<br />                             File to upload (1): <input
							type="file" file-model="myForm.files[0]"   /><br /> 
							
							 <div class="col-md-6">
       <img ng-src="{{filepreview}}" class="img-responsive" ng-show="filepreview"/>
    </div>    
						            File to upload (2): <input type="file"
							file-model="myForm.files[1]" /><br />                File to
						upload (3): <input type="file" file-model="myForm.files[2]" /><br />   
						            File to upload (4): <input type="file"
							file-model="myForm.files[3]" /><br />                File to
						upload (5): <input type="file" file-model="myForm.files[4]" /><br />   
						            
						<button type="button" ng-click="doUploadFile()">Upload</button>
						         
					</form> -->
					
					<form>
   <input type="file" accept="image/*" id=inputFile_1" onchange="showMyImage(this)" />
 <br/>
<img id="thumbnil" style="width:20%; margin-top:10px;"  src="" alt="image"/>
</form>
					         
					<h2>Upload Results:</h2>
					         
					<div style="border: 1px solid #ccc; padding: 5px;">
						            <span ng-bind="uploadResult"></span>          
					</div>
					      
				</div>
				
				
				<div ng-controller="MultiFileUploadController">
					         
					<form>
						            Description: <br />             <input type="text"
							name="description" ng-model="myForm.description"
							style="width: 350px;" />             <br />
						<br />                             File to upload (1): <input
							type="file" file-model="myForm.files[0]"   /><br /> 
							
							 <div class="col-md-6">
       <img ng-src="{{filepreview}}" class="img-responsive" ng-show="filepreview"/>
    </div>    
						            File to upload (2): <input type="file"
							file-model="myForm.files[1]" /><br />                File to
						upload (3): <input type="file" file-model="myForm.files[2]" /><br />   
						           <!--  File to upload (4): <input type="file"
							file-model="myForm.files[3]" /><br />                File to
						upload (5): <input type="file" file-model="myForm.files[4]" /><br />   
						             -->
						<button type="button" ng-click="doUploadFile()">Upload</button>
						         
					</form>
					         
					<h2>Upload Results:</h2>
					         
					<div style="border: 1px solid #ccc; padding: 5px;">
						            <span ng-bind="uploadResult"></span>          
					</div>
					      
				</div>

			</div>
		</div>
	</div>

</div>
