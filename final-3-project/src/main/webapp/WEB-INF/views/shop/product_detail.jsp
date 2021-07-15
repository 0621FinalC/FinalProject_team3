<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>상품</title>
<link href="${pageContext.request.contextPath }/resources/css/shop/product_detail.css" rel="stylesheet" />
 
</head>
<body>
   
    <h2>상품 정보</h2>
    <table>
        <tr>
            <!-- 이미지를 불러오기위한 url 작성 -->
            <c:set var="path" value="${pageContext.request.contextPath}" />
            <c:set var="picture_url" value="${dto.picture_url }" />
			<c:if test="${fn:contains(picture_url , '[') or fn:contains(picture_url , ']') }">
				<c:set var="picture_url" value="${fn:replace(picture_url, '[', '%5B') }" />
				<c:set var="picture_url" value="${fn:replace(picture_url, ']', '%5D') }" />
			</c:if>
            <td><img src="${path}/resources/img/product/${picture_url}" width="300px"
                height="300px"></td>
            <td align="center">
                <table>
 
 					<tr>
                        <td>종류</td>
                        <td>${dto.CATEGORY }</td>
                    </tr>
                    <tr>
                        <td>상품명</td>
                        <td>${dto.PRODUCTNAME }</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><fmt:formatNumber value="${dto.PRICE}" type="currency" /></td>
                    </tr>
                    <tr>
                        <td>상품설명</td>
                        <td>${dto.EXPLANATION }</td>
                    </tr>
                    <tr>
                    	<td>등록일자</td>
                    	<td>${dto.REGISTERDATE }</td>
                    </tr>
                  
                    <tr>
                    	<td>재고</td>
                    	<td>${dto.INVENTORY }</td>
                    </tr>
                    <tr align="center">
						<td colspan="2">
							<form name="form1" method="post" action="${path}/cart/insert">
								<input type="hidden" name="pid" value="${dto.PID}">
								<select name="cartqty">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개
								<input type="submit" value="장바구니에 담기">
							</form>
							<a href="${path}/product/list.do">상품목록</a>
						</td>
					</tr>
    </table>
</body>
</html>