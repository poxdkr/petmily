<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:choose>
		<c:when test="${empty myBoardList }">
			<div class="center">
				<br>
				<img src="resources/images/empty.png" width="200px">
				<p class="center ptag">등록된 게시물이 없습니다.<p>
				<br>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="list" items="${myBoardList }">
				<c:choose>
					<c:when test="${list.boardcate == 4 || list.boardcate == 5 }">
						<div class="block-item active  ">
							<div class="img-area" onclick="location.href='getKnowhow.do?bidx=${list.bidx }'">
								<div class="imgItem" style="background: url('./images/${list.bpict1}') center center no-repeat; background-size: cover;"></div>
							</div>
							<div class="text-area">
								<div class="item-title">
									<h4>
										<a>${list.btitle }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="block-item active  ">
							<div class="img-area" onclick="location.href='getBoard.do?bidx=${list.bidx }'">
									<div class="imgItem" style="background: url('/upload/${list.bpict1}') center center no-repeat; background-size: cover;"></div>
							</div>
							<div class="text-area">
								<div class="item-title">
									<h4>
										<a>${list.btitle }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:otherwise>	
	</c:choose>