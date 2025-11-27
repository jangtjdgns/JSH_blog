<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section>
	<h3 class="font-bold text-3xl">게시판 페이지</h3>

	<section>
		<div id="search">
			<form action="list" method="POST">
				<div>
					<input name="searchKeyword" placeholder="검색어를 입력하세요." value="${searchKeyword }" />
				</div>
				<div>
					<select name="searchType" placeholder="선택">
						<option value="1" ${searchType == 1 ? 'selected' : ''}>제목</option>
						<option value="2" ${searchType == 2 ? 'selected' : ''}>내용</option>
						<option value="3" ${searchType == 3 ? 'selected' : ''}>제목+내용</option>
					</select>
				</div>
				<div>
					<button>검색</button>
				</div>
			</form>
		</div>

		<div>
			<c:forEach var="article" items="${articles }">
				<div>${article.id }</div>
				<div>${article.regDate }</div>
				<div>${article.updateDate }</div>
				<div>
					<a href="detail?id=${article.id }">${article.title }</a>
				</div>
				<div class="border-b"></div>
			</c:forEach>

			<a href="write" class="btn">게시글 작성</a>
	</section>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>