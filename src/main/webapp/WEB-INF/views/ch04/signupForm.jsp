<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>

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

   <div class="d-flex flex-column "><!-- viewport height -->
      <%@include file="/WEB-INF/views/common/header.jsp"%>
      <div class="flex-grow-1 m-2">
         <div class="d-flex row">
            <div class="col-md-4">
               <%@include file="/WEB-INF/views/common/menu.jsp"%>            
            </div>
            
            <div class="col-md-8">
               <!-- #################################### -->
               <div class="card">
                  <div class="card-header">회원가입 양식</div>
                  <div class="card-body">
                     <form class="m-2" method="post" action="signup" > <!-- 여기 action 바꿔야함 -->
                     
                        <div class="form-group mb-2">
                            <label for="mid">아이디</label>
                            <div> <!-- 에러메시지를 출력하라는 태그 -->
                            <input type="text" class="form-control" id="mid" name="mid" value="${ch04SignupForm.mid}">  <!-- $붙은 건 값을 넣겠다는뜻 -->
                            <div class= "text-danger" style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.mid"/></div> <!-- 에러메시지를 갖고 옴. path는 에러메세지 경로 지정 -->
                        </div>
                 
                        <div class="form-group mb-2">
                            <label for="mpassword1">패스워드</label>
                            <input type="password" class="form-control" id="mpassword1" name="mpassword1" value="${ch04SignupForm.mpassword1}">
                            <div class = "text-danger"  style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.mpassword1"/></div>  <!-- 에러메시지를 출력하라는 태그 -->
                        </div> 
                        
                           <div class="form-group mb-2">
                            <label for="mpassword2">패스워드 확인</label>
                            <input type="password" class="form-control" id="mpassword2" name="mpassword2" value="${ch04SignupForm.mpassword2}">
                            <div class = "text-danger"  style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.mpassword2"/></div>  <!-- 에러메시지를 출력하라는 태그 -->
                        </div> 
                        
                           <div class="form-group mb-2">
                            <label for="mname">이름</label>
                            <input type="text" class="form-control" id="mname" name="mname" value="${ch04SignupForm.mname}">
                            <div class = "text-danger"  style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.mname"/></div>  <!-- 에러메시지를 출력하라는 태그 -->
                        </div> 
                            
                            
                             <div class="form-group mb-2">
                            <label for="mphoneNum">전화번호</label>
                            <input type="text" class="form-control" id="mphoneNum" name="mphoneNum" value="${ch04SignupForm.mphoneNum}">
                            <div class = "text-danger"  style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.mphoneNum"/></div>  <!-- 에러메시지를 출력하라는 태그 -->
                        </div>  
                          
                           <div class="form-group mb-2">
                            <label for="mphoneNum">이메일</label>
                            <input type="text" class="form-control" id="memail" name="memail" value="${ch04SignupForm.memail}">
                            <div class = "text-danger"  style ="font-size: 0.7rem"><form:errors path="ch04SignupForm.memail"/></div>  <!-- 에러메시지를 출력하라는 태그 -->
                        </div>  
                                  
                       
                        
                        </div>
                        <!-- 제출 버튼: 양식의 데이터를 서버로 보내겠다. -->
                        <button type="submit" class="btn btn-info btn-sm">회원가입</button>
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
