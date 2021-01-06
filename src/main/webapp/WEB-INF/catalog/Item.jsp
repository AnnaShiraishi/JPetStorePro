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
<a href="${pageContext.request.contextPath}/product?id=${product.productId}">
	Return to ${product.productId}
</a>
</div>

<div id="Catalog" class="container">
<form action="${pageContext.request.contextPath}/cart" method="post">
<table class="table table-hover">
	<tr>
		<td><img src="${pageContext.servletContext.contextPath}/images/${product.picture}" /> ${product.description}</td>
	</tr>
	<tr>
<%--		input--%>
		<td><b> ${item.itemId} </b></td>
	</tr>
	<tr>
		<td><b><span style="font-size: medium; "> ${item.attribute1}
		${item.attribute2} ${item.attribute3}
		${item.attribute4} ${item.attribute5}
		${product.name} </span></b></td>
	</tr>
	<tr>
		<td>${product.name}</td>
	</tr>
	<tr>
		<td><c:if test="${item.quantity <= 0}">
        Back ordered.
      </c:if> <c:if test="${item.quantity > 0}">
      	${item.quantity} in stock.
	  </c:if></td>
	</tr>
	<tr>
		<td><fmt:formatNumber value="${item.listPrice}"
			pattern="$#,##0.00" /></td>
	</tr>

	<tr>
		<td>
			<input hidden name="itemId" value="${item.itemId}">
			<input type="submit" value="Add to Cart" class="btn btn-success">
		</td>
	</tr>
</table>
</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>



