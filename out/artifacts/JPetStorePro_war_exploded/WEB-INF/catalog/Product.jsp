<%--

       Copyright 2010-2016 the original author or authors.

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.

--%>
<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="${pageContext.request.contextPath}/category?id=${product.categoryId}">Return to ${product.categoryId}</a>
</div>

<div id="Catalog" class="container">

<h2>${product.name}</h2>
<form action="${pageContext.request.contextPath}/cart" method="post">
	<table class="table table-hover">
		<tr>
			<th>Item ID</th>
			<th>Product ID</th>
			<th>Description</th>
			<th>List Price</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="item" items="${itemList}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/item?id=${item.itemId}">${item.itemId}</a></td>
				<td>${item.product.productId}</td>
				<td>${item.attribute1} ${item.attribute2} ${item.attribute3}
				${item.attribute4} ${item.attribute5} ${product.name}</td>
				<td><fmt:formatNumber value="${item.listPrice}"
					pattern="$#,##0.00" /></td>
				<td>
					<input hidden name="itemId" value="${item.itemId}">
					<input type="submit" value="Add to Cart" class="btn btn-success">
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>





