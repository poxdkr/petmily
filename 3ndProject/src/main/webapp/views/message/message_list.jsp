<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.petmily.member.MemberVO"%>
<%

//로그인 정보 가져오기
MemberVO logIn = (MemberVO) session.getAttribute("user");

//사용할 데이터 세팅
session.setAttribute("tmpmidx", logIn.getMidx());
session.setAttribute("searchNick", logIn.getMnickname());

// 사용 변수 초기화
int gRoom = -1;
int recv_midx = -1;

if (session.getAttribute("recv_midx") != null) {
	recv_midx = (Integer) session.getAttribute("recv_midx");
}

if (session.getAttribute("gRoom") != null) {
	gRoom = (Integer) session.getAttribute("gRoom");
}

%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메시지함</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all' />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 폰트용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
<!-- <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- jQuery UI and CSS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- Bootstrap CDN  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<!-- 메시지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
<!-- CSS File -->
<link href="./resources/css/message_list.css" rel="stylesheet">
<script>
	var gRoomNo = <%=gRoom%>;
	var recv_midx = <%=recv_midx%>;
</script>
</head>

<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<%@ include file="/header.jsp"%>
				</div>
			</header>

			<!-- #masthead -->
			<div class="content-body">
				<div class="container-wrapper scraped-container">
					<div class="list-title">
					</div>
					<div class="main-content show-list">
						<div>

	<div class="msg-container">

		<div class="messaging">
			<div class="inbox_msg">
				<!-- 메시지 목록 영역 -->
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>메시지함</h4>
						</div>
						<!-- 메시지 검색 -->
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" name="search-bar" placeholder="Search">
								<span class="search-btn-div">
									<button type="button" onclick="search()">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<!-- 메시지 리스트 -->
					<div class="inbox_chat"></div>
				</div>

				<!-- 메시지 내용 영역 -->
				<div class="mesgs">
					<!-- 메시지 내용 목록 -->
					<div class="msg_history" name="contentList">
						<!-- 메시지 내용이 올 자리 -->
					</div>
					<div class="send_message"></div>
					<!-- 메시지 입력란이 올자리 -->
				</div>
			</div>

		</div>
	</div>

	<script>
	
	// 처음 메시지 리스트 가져오기
	const FirstMessageList = function(){
		$.ajax({
			url:"message_ajax_list.do",
			method:"get",
			data:{
			},
			success:function(data){
				console.log("메시지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 리스트 클릭 처리
				$('.chat_list').on('click', function(){
					let room = $(this).attr('room');
					let recv_midx = $(this).attr('recv-midx');
					
					gRoomNo = room;
					
					// 엔터키 처리를 위한 세션 등록용
					sessionStorage.setItem("curRoom", room);
					sessionStorage.setItem("curRecv_midx", recv_midx);
					
					// active 효과
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메시지 입력' name='input-msg' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					$('.send_message').html(send_msg);
					
					$('.msg_send_btn').on('click',function(){
						
						SendMessage(room, recv_midx);
						
					});
					
					MessageContentList(room);
					
				});
				if ( gRoomNo > 0 ){
					$('.chat_list_box:first').addClass('active_chat');
				}
			}
			
		})
	};
	
	// 메시지 리스트 재출력
	const MessageList = function(){
		$.ajax({
			url:"message_ajax_list_r.do",
			method:"get",
			data:{
			},
			success:function(data){
				if(data.length == 0) return;
				
				$('.inbox_chat').html(data);
				
				if(gRoomNo > 0){
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+gRoomNo).removeClass('active_chat');
					$('.chat_list_box'+gRoomNo).addClass('active_chat');
					MessageContentList(gRoomNo);
				}
				
				$('.chat_list').on('click', function(){

					let room = $(this).attr('room');
					let recv_midx = $(this).attr('recv-midx');
					gRoomNo = room;
					
					// 엔터키 처리를 위한 세션 등록용
					sessionStorage.setItem("curRoom", room);
					sessionStorage.setItem("curRecv_midx", recv_midx);
					
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메시지 입력' name='input-msg' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					$('.send_message').html(send_msg);
					$('.msg_send_btn').on('click',function(){
						SendMessage(room, recv_midx);
					});
					MessageContentList(room);
				});
			}
		})
	};
	
	// 메시지 리스트 가져오기 + 안 읽은 메시지 처리
	const MessageContentList = function(room) {
		
		$.ajax({
			url:"message_content_list.do",
			method:"GET",
			data:{
				room : room,
			},
			success:function(data){
				$('.msg_history').html(data);
				
				// 스크롤 처리
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		})
		
		$('.unread'+room).empty();
	
	};
	
	
	// 메시지 전송 함수
	const SendMessage = function(room, recv_midx){
		let content = $('.write_msg').val();
		
		content = content.trim();
		
		if(content == ""){
			alert("메시지를 입력하세요!");
		}else{
			$.ajax({
				url:"message_send_inlist.do",
				method:"GET",
				data:{
					room : room,
					recv_midx: recv_midx,
					content: content
				},
				success:function(data){
					$('.write_msg').val("");
					
					MessageContentList(room);
					
					FirstMessageList();
					
				},
				error: function(request, status, error) {
					alert("ajax 오류!");
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
			
		};
	}
	function external(room, recv_midx){
		$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
		$('.chat_list_box'+room).addClass('active_chat');
		
		// 엔터키 처리를 위한 세션 등록용
		sessionStorage.setItem("curRoom", room);
		sessionStorage.setItem("curRecv_midx", recv_midx);
		
		let send_msg = "";
		send_msg += "<div class='type_msg'>";
		send_msg += "	<div class='input_msg_write row'>";
		send_msg += "		<div class='col-11'>";
		send_msg += "			<input type='text' class='write_msg form-control' placeholder='메시지 입력' name='input-msg' />";
		send_msg += "		</div>";
		send_msg += "		<div class='col-1'>";
		send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
		send_msg += "		</div>";
		send_msg += "	</div>";
		send_msg += "</div>";
          
		$('.send_message').html(send_msg);
		$('.input-msg').focus();
		$('.msg_send_btn').on('click',function(){
			SendMessage(room, recv_midx);
		});
		MessageContentList(room);
	}
	
	//사람 검색
	function search(){
		var search = $(".search-bar").val().trim();
		
		if(search == ""){
			alert("상대방의 닉네임을 입력하세요!");
			return;
		}
		if(search == '${searchNick }'){
			alert("자기 자신에게는 메시지를 보낼 수 없습니다.");
			$(".search-bar").val("");
			$(".search-bar").focus;
			return;
		}else{
			$.ajax({
				url:"search.do",
				method:"GET",
				data:{
					mnickname : search
				},
				success:function(data){
					console.log("data : " + data);
					if(data != 0 && data != null){
						location.href= "message_send.do?recv_midx=" + data;
						$('.input-msg').focus();
						return;
					}else{
						alert("일치하는 닉네임이 없습니다.");
						$(".search-bar").focus();
						return;
					}
				},
				error: function(request, status, error) {
					alert("ajax 오류!");
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
		
	};

	
	//메시지 삭제
	function deleteMessage(msgidx, room){
		var yn = confirm("정말로 해당 메시지를 삭제하시겠습니까?");
		if(yn){
			$.ajax({
				url:"message_delete.do",
				method:"GET",
				data:{
					msgidx : msgidx,
					room : room
				},
				success:function(data){
					console.log("메시지 내용 가져오기 성공");
					$('.msg_history').html(data);
					$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

				},
				error: function(request, status, error) {
					alert("ajax 오류!");
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
				
			})
			$('.unread'+room).empty();
		};					
	}
	
	// 메시지 리스트 갱신 함수
	function initeChat(){
	  	setInterval(function() {
	  		MessageList();
    	}, 1000);
	};
	
	$(document).ready(function(){
		// 메시지 리스트 리로드
		FirstMessageList();
		initeChat();
		if(<%=gRoom%> > 0 && <%=recv_midx%>){
			MessageContentList(gRoomNo);
			MessageList();
			external(gRoomNo, recv_midx);
		}
		//엔터키 처리용
		$('body').keypress(function(e){
			if(e.keyCode!=13) return;
			var currentFocus = document.activeElement.name;
			if(currentFocus == "search-bar"){
				search();
				return;
			}
			
			if(currentFocus == "input-msg"){
				SendMessage(sessionStorage.getItem("curRoom"), sessionStorage.getItem("curRecv_midx"));
				return;
			}
		});
	});
	</script>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- .container -->
		<%@ include file="/footer.jsp"%>
		<!-- #page -->
		<script src='resources/js/jquery.js'></script>
		<script src='resources/js/plugins.js'></script>
		<script src='resources/js/scripts.js'></script>
		<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>