<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<div class="d-flex flex-column ">
		<!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-md-4">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>
				</div>

				<div class="col-md-8">
					<!-- #################################### -->
					<div class="card">
						<div class="card-header">회원가입</div>
						<div class="card-body">
							<form method="post" action="${pageContext.request.contextPath}/ch17/join">
								<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  --%>
								<div class="form-group mb-2">
									<label for="manme">Member Id</label> <input type="text"
										class="form-control" id="mid" name="mid">
								</div>

								<div class="form-group mb-2">
									<label for="manme">Member name</label> <input type="text"
										class="form-control" id="mname" name="mname">
								</div>
								<div class="form-group mb-2">
									<label for="mpassword">Member Password</label> <input
										type="password" class="form-control" id="mpassword"
										name="mpassword">
								</div>

								<div class="form-group mb-2">
									<label for="memail">Member email</label> <input type="email"
										class="form-control" id="memail" name="memail">


									<div class="form-group mb-2">
										<label for="mrole">Member Role</label> <select
											class="form-control" id="mrole" name="mrole">
											<option value="ROLE_ADMIN">Admin</option>
											<option value="ROLE_MANAGER">Manager</option>
											<option value="ROLE_USER" selected>User</option>
										</select>
									</div>

								</div>
								<button type="submit" class="btn btn-info btn-sm mt-2">회원가입</button>
							</form> 
						</div>
					</div>
					<!-- #################################### -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>