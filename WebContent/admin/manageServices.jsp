<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.request.contextPath}/admin/">
<%
if(session.getAttribute("type")==null){
	response.sendRedirect("login.jsp");
}
else if(session.getAttribute("type")!= null && session.getAttribute("type").equals("resident")){
	response.sendRedirect("../user/index.jsp");
}
String error=(String)request.getAttribute("error");
if(error != null){
	out.print("<p style='background-color:green; font-size:16px; color:white'>"+error +"</p>");
}

%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<link rel="icon"
	href="http://demo.neontheme.com/assets/images/favicon.ico">
<title>Data Tables</title>
<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-1">
<link rel="stylesheet" href="css/entypo.css" id="style-resource-2">
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-3">
<link rel="stylesheet" href="css/bootstrap.css" id="style-resource-4">
<link rel="stylesheet" href="css/neon-core.css" id="style-resource-5">
<link rel="stylesheet" href="css/neon-theme.css" id="style-resource-6">
<link rel="stylesheet" href="css/neon-forms.css" id="style-resource-7">
<link rel="stylesheet" href="css/custom.css" id="style-resource-8">
<script src="js/jquery-1.11.3.min.js"></script>
<script>
function confirmDelete(){
	var x=confirm("Are you sure you want to delete?");
	if(x)
		return true;
	else
		return false;
	}

</script>
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	
	<div class="page-container">
		
		<%@include file="menu.jsp" %>
		<div class="main-content">
			
			<%@include file="header.jsp" %>
			<hr />
			
			
			<h2>Manage Services</h2>
			<br />
			<script type="text/javascript">
				jQuery(document).ready(
						function($) {
							var $table1 = jQuery('#table-1');
							// Initialize DataTable
							$table1.DataTable( {
								"aLengthMenu" : [ [ 10, 25, 50, -1 ],
										[ 10, 25, 50, "All" ] ],
								"bStateSave" : true
							});
							// Initalize Select Dropdown after DataTables is created
							$table1.closest('.dataTables_wrapper').find(
									'select').select2({
								minimumResultsForSearch : -1
							});
						});
			</script>
			<table class="table table-bordered datatable" id="table-1">
				<thead>
					<tr>
						<th>Service Id</th>
						<th>Service type</th>
						<th>Description</th>
						<th>Resident_id</th>
						<th>Manage Request</th>
					</tr>
				</thead>
				        	
				<tbody>
				<c:forEach items="${sessionScope.search_services }" var="i">
					<tr class="odd gradeX">
						<td>${i.service_id }</td>
						<td>${i.service_type }</td>
						<td>${i.service_description }</td>
						<td>${i.addResidentVO.resident_id }</td>
						
						
						<td>
						<a href="<%=request.getContextPath()%>/requestServiceController?flag=fetch&service_id=${i.service_id }&resident_id=${i.addResidentVO.resident_id }">REPLY</a> 
											/ <a onclick="return confirmDelete()" href="<%=request.getContextPath()%>/requestServiceController?flag=delete&service_id=${i.service_id}">DELETE</a>
						</td>
						
						
					</tr>
				</c:forEach>	
				</tbody>
				
				<tfoot>
					<tr>
						<th>Service Id</th>
						<th>Service type</th>
						<th>Description</th>
						<th>Resident_id</th>
						<th>Manage Request</th>
					</tr>
				</tfoot>
			</table>
			<br />
			
			
			
			<br /> 
			
			<br />
			
			
			<br />
			<br />
			
			
			<br />
			<footer class="main">
			</footer>
		</div>
		
		
		<!-- Chat Histories -->
		
	</div>
	<!-- Imported styles on this page -->
		<link rel="stylesheet" href="css/jquery-jvectormap-1.2.2.css" id="style-resource-1">
	<link rel="stylesheet" href="css/rickshaw.min.css" id="style-resource-2">
	<script src="js/TweenMax.min.js" id="script-resource-1"></script>
	<script src="js/jquery-ui-1.10.3.minimal.min.js" id="script-resource-2"></script>
	<script src="js/bootstrap.js" id="script-resource-3"></script>
	<script src="js/joinable.js" id="script-resource-4"></script>
	<script src="js/resizeable.js" id="script-resource-5"></script>
	<script src="js/neon-api.js" id="script-resource-6"></script>
	<script src="js/cookies.min.js" id="script-resource-7"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js" id="script-resource-8"></script>
	<script src="js/jquery-jvectormap-europe-merc-en.js"
		id="script-resource-9"></script>
	<script src="js/jquery.sparkline.min.js" id="script-resource-10"></script>
	<script src="js/d3.v3.js" id="script-resource-11"></script>
	<script src="js/rickshaw.min.js" id="script-resource-12"></script>
	<script src="js/raphael-min.js" id="script-resource-13"></script>
	<script src="js/morris.min.js" id="script-resource-14"></script>
	<script src="js/toastr.js" id="script-resource-15"></script>
	<script src="js/fullcalendar.min.js" id="script-resource-16"></script>
	<script src="js/neon-chat.js" id="script-resource-17"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="js/neon-custom.js" id="script-resource-18"></script>
	<!-- Demo Settings -->
	<script src="js/neon-demo.js" id="script-resource-19"></script>
	<script src="js/neon-skins.js" id="script-resource-20"></script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-28991003-7' ]);
		_gaq.push([ '_setDomainName', 'demo.neontheme.com' ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>