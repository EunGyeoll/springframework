<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         function handleBtn1() {
        	 var mid = $("#mid").val();
        	 var mpassword= $("#mpassword").val();
        	 
        	 console.log(mid);
        	 console.log(mpassword);
           $.ajax({
        	   url:"postMethodAjax",
           		type:"post",
           	/* 	data:"mid = summer&mpassword=67890", */
           	/* 	data: "mid=" + mid + "&mpassword=" +mpassword, */
           	/* 	data: {mid:mid, "summer", mpassword:67890}, */ // 이게 정석인 방식
           		data: {mid, mpassword},
           		success:function(data) {
           			//data :{"result":"success"}
           			//data :{"result":"fail", "reason":"wrongMid"}
           			//자동으로 json->javascript Object 변환
           		console.log(data); 
           		
           			$("#ajaxResponseInclude").html(data);
           		
           		
           		if(data.result==="success") {
           			$("#ajaxResponseInclude").html("로그인 성공");
           		}else {
           				if(data.reason === "wrongMid"){
           					$("#ajaxResponseInclude").html("아이디가 존재하지 않습니다");
           				} else {
           					$("#ajaxResponseInclude").html("비밀번호가 틀립니다");
           				}
           			}
           		
           		}});     
         }
         
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
                  <div class="card-header">postMethod</div>
                  <div class="card-body">
                     <form class="m-2" method="post" action="postMethod">
                        <input type="hidden" name="chNum" value="ch02"/>
                        <div class="form-group mb-2">
                            <label for="mid">아이디</label>
                            <input type="text" class="form-control" id="mid" name="mid" value="spring">
                        </div>
                        
                        <div class="form-group mb-2">
                            <label for="mpassword">패스워드</label>
                            <input type="password" class="form-control" id="mpassword" name="mpassword" value="12345">
                        </div>
                        <!-- 제출 버튼: 양식의 데이터를 서버로 보내겠다. -->
                        <button type="submit" class="btn btn-info btn-sm">로그인</button>

                     </form>
                     
                     <hr/>
                     
                     <button onclick="handleBtn1()" type="button" class="btn btn-success btn-sm">JavaScript로 요청</button>
                     <div id="ajaxResponseInclude" class="mt-2">
                        ???
                     </div>
                  </div>
               </div>
               <!-- #################################### -->
            </div>
         </div>
      </div> 
   </div>
</body>
</html>