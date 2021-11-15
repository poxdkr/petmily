<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 샘플 페이지</title>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="./style.css" type="text/css">
    <script>
    //jquery 시작하기
    $(function(){
     });
    
    	function registMember(){
    		alert("submit연결됨");
    		console.log($("#registForm").serialize());
    		
    		if($("#mnickname").val().trim() == ""){
			alert("사용할 닉네임을 입력해주세요!");    
			$("#mnickname").focus();
			return;
    		}
    		
    		if($("#mphone").val().trim() == ""){
    		alert("연락처를 입력해주세요!");
    		$("#mphone").focus();
			return;
        	}
    		
    		if($("#memail").val().trim() == ""){
        	alert("이메일을 입력해주세요!");
        	$("#memail").focus();
			return;
            }
    		
    		$("#registForm").submit();
    		
    	}
    
        function kakaoLogin() {
        	alert("연결확인");
        	Kakao.init('3ccf18d0d0cbf79ff0b3bb05c6b5bd8f');
           	Kakao.Auth.login({
                //scope: 'profile', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            const midx= res.id; //카카오톡 고유 아이디(숫자) long타입 //이걸 midx로 사용하겠음
                            
                            console.log("카카오 id : " + midx);
                            console.log("카카오 email : " + kakao_account.email);
                            let mname= kakao_account.profile.nickname;
                            let email = null;
                            if(kakao_account.email != null){
                            	email = kakao_account.email;
                            }
                            let thumbnail = kakao_account.profile.thumbnail_image_url;
                            
                            $.ajax({
                            	url:"getAjaxMemberLogin.do",
                            	data:"midx="+midx,
                            	dataType:"json",
                            	success : function(data){
                            		//alert("리턴된 데이터가 null이 아님");
                            		//alert("data 확인 : " + JSON.stringify(data));
                            		//컨트롤러 단에서 session에 유저 넣음. 별도 준비없이 mainpage로 토스함
                            		location.href = "test.jsp";
                            	},error : function(data){
                            		//alert("리턴된 데이터가 null임");
                            		//회원가입을 위한 준비를 시작
                            	let registHtml ="";
                            	registHtml += "<tr>";
                            	registHtml += "<td colspan=\"2\" id=registTitle style='font-size:25px; color:black;'>kakao로 시작합니다!</td>";
                            	registHtml += "</tr>";
                            	registHtml += "<tr>";
                            	registHtml += "<td colspan=\"2\" id=\"mphoto\"><img src='"+thumbnail+"' width=\"150px\">";
                            	registHtml += "<input type=\"hidden\" name=\"mphoto\" value='"+thumbnail+"'>";
                            	registHtml += "<input type=\"hidden\" name=\"midx\" value='"+midx+"'>";
                            	registHtml += "</td>";
                            	registHtml += "</tr>";
                            	registHtml += "<tr>";
                            	registHtml += "<td>카카오톡 닉네임</td> <td id=\"mnameVal\"><input type =\"text\" name= \"mname\" value='"+mname+"' id='mname' readonly></td>";
                            	registHtml += "</tr>";
                            	registHtml += "<tr>";
                            	registHtml += "<td>사용할 닉네임</td><td id=\"mnicknameVal\"><input type =\"text\" name= \"mnickname\" value='"+mname+"' id='mnickname'></td>";
                            	registHtml += "</tr>";
                            	registHtml += "<tr>";
                            	registHtml += "<td>연락처</td><td id=\"mphoneVal\"><input type=\"tel\" name=\"mphone\" placeholder='(연락처를 입력해주세요)' id='mphone'></td>";
                            	registHtml += "</tr>"
                            	registHtml += "<tr>";
                            	registHtml += "<td>Email</td><td id=\"memailVal\"><input type=\"email\" name=\"memail\" value='"+email+"' id='memail'></td>";
                            	registHtml += "</tr>"
                            	registHtml += "<tr>";
                            	registHtml += "<td colspan=\"2\"><button type=\"button\" id=\"submitBtn\" onclick='javascript:registMember()'>펫밀리 시작하기!</button></td>";
                            	registHtml += "</tr>";
                            		
                            	$("#registerTable").html(registHtml);
                            	$("#registerTable").css("display","inline-block");
                            	}
                            });
                        }
                    });
                   // window.location.href='kakaoLoginOk.jsp'; //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
   function kakaoLogout(){
	   if (!Kakao.Auth.getAccessToken()) {
		   console.log('Not logged in.');
		   return;
		 }
	   Kakao.Auth.logout(function() {
		   alert("KAKAO 로그아웃 되었습니다!");
		   console.log(Kakao.Auth.getAccessToken());
		 });
   }     
   

    </script>
</head>
<body>
<a href="javascript:kakaoLogin();">
<img src="./images/kakao.jpg" height="50px">
</a>

<h1><a href="javascript:kakaoLogout();">카카오 로그아웃하기</a></h1>
<hr>
<h1>(미구현)네이버로 로그인 하기</h1>
<hr>
<h1>(미구현)PETMILY 계정으로 로그인 하기</h1>
<p> (미구현)회원가입 | (미구현)아이디/비밀번호찾기 </p>
<hr>

<form action="registMember.do" method="post" id="registForm">
<table id="registerTable">
</table>
</form>

</body>
</html>