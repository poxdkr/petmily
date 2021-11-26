<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<c:forEach var="tmp" items="${clist }">
	<c:if test="${tmp.content ne '' && tmp.content ne null }">
	<c:choose>
		<c:when test="${sessionScope.user.midx ne tmp.send_midx }">
		<!-- 받은 메시지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<%-- <img class="profile_img" src="/resources/upload/profile/${tmp.profile}" alt="보낸사람 프로필" onError="this.src='http://storage.enuri.info/pic_upload/knowbox2/202009/0841147752020092540507c61-d3bc-4f18-a8ff-cd36a240ca2f.jpg';"/> --%>
				<img class="profile_img" src="${tmp.profile}" alt="보낸사람 프로필" onError="this.src='http://storage.enuri.info/pic_upload/knowbox2/202009/0841147752020092540507c61-d3bc-4f18-a8ff-cd36a240ca2f.jpg';"/>
			</div>
			<div class="received_msg">
				<c:choose>
					<c:when test="${tmp.delete_chk != 1 }">
						<div class="received_withd_msg">
							<p>${tmp.content }</p>
							<span class="time_date"> ${tmp.send_time }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="received_withd_msg del_Message">
							<p><i class="fa fa-exclamation-circle" aria-hidden="true"></i>${tmp.content }</p>
							<span class="time_date">${tmp.send_time }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메시지 -->
		<div class="outgoing_msg">
			<c:choose>
				<c:when test="${tmp.delete_chk != 1 }">
					<div class="sent_msg">
						<p>${tmp.content }</p>
						<span class="time_date"> ${tmp.send_time }<label class="del" onclick="deleteMessage(${tmp.msgidx }, ${tmp.room })"></label></span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="sent_msg del_Message">
						<p><i class="fa fa-exclamation-circle" aria-hidden="true"></i>${tmp.content }</p>
						<span class="time_date"> ${tmp.send_time }</span>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</c:otherwise>
	
	</c:choose>
</c:if>

</c:forEach>