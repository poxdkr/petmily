<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.room } chat_list_box">
	<c:choose>
		<c:when test="${sessionScope.user.midx eq tmp.send_midx }">
			<div type="button" class="chat_list" room="${tmp.room }" recv-midx="${tmp.recv_midx }" other-nick="${tmp.other_nick }">
		</c:when>
		<c:otherwise>
			<div type="button" class="chat_list" room="${tmp.room }" recv-midx="${tmp.send_midx }" other-nick="${tmp.other_nick }">
		</c:otherwise>
	</c:choose>
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img" >
					<%-- <img class="profile_img" src="/petmily/resources/upload/profile/${tmp.profile}" alt="aa" onError="this.src='http://storage.enuri.info/pic_upload/knowbox2/202009/0841147752020092540507c61-d3bc-4f18-a8ff-cd36a240ca2f.jpg';"/> --%>
					<img class="profile_img" src="${tmp.profile}" alt="aa" onError="this.src='http://storage.enuri.info/pic_upload/knowbox2/202009/0841147752020092540507c61-d3bc-4f18-a8ff-cd36a240ca2f.jpg';"/>
				</div>
				<div class="chat_ib">
					<h5>${tmp.other_nick }<span class="chat_date">${tmp.send_time }</span>
					</h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.content }</p>
						</div>
						<%-- 안 읽은 메시지 갯수 체크하여 알람 표시 --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.room }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>