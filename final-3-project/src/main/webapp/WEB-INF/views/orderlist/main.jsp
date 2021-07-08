<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style type="text/css">
	img {
		width:80px; height:80px;
	}
</style>
</head>
<body>
	<h1>주문 내역</h1>
	<div>
		<table>
			<thead>
				<th>주문일자</th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>주문번호</th>
				<th>결제금액</th>
				<th>주문상태</th>
			</thead>
			<tbody>
				<c:url var="detail" value="/order/detail"/>
				<c:forEach var="order" items="${orderlist }">
					<tr>
						<fmt:parseDate var="dateString" value="${order.getOrderdate() }" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:formatDate var="orderDate" value="${dateString }" pattern="yyyy.MM.dd (HH시 mm분)" />
						<td>${orderDate }</td>
						
						<c:set var="pname" value="${order.getProductname() }" />
						<c:choose>
							<c:when test="${fn:contains(pname , '외') }">
								<c:set var="pname" value="${fn:substringBefore(pname, ' 외') }"/>
							</c:when>
							
							<c:when test="${fn:contains(pname , '[') or fn:contains(pname , ']') }">
								<c:set var="pname" value="${fn:replace(pname, '[', '%5B') }" />
								<c:set var="pname" value="${fn:replace(pname, ']', '%5D') }" />
							</c:when>
						</c:choose>
						
						<td><img src="../resources/img/product/${pname }.jpg"></td>
						<td><a href="${detail }?ordno=${order.getOid() }">${order.getProductname() }</a></td>
						<td>${order.getOid() }</td>
						<td><fmt:formatNumber value="${order.getTotalprice() }" />원</td>
						<td>${order.getOrderstat() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>