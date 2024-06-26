<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- 사용자 정의 자바스크립트 -->
<script>
  
</script>
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
                  <div class="card-header">request 범위 데이터 사용</div>
                  <div class="card-body">
                     <p>회원 ID: ${member1.mid}</p>
                     <p>회원 Name: ${member1.mname}</p>
                     <p>회원 Email: ${member1.memail}</p>
                     
                     <hr>
                     
                    <p>회원 ID: ${member2.mid}</p>
                     <p>회원 Name: ${member2.mname}</p>
                     <p>회원 Email: ${member2.memail}</p>
                  </div>
               </div>
               <!-- #################################### -->
            </div>
         </div>
      </div>
   </div>
</body>
</html>