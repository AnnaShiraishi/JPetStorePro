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

<div id="BackLink"><a href="${pageContext.request.contextPath}/main">Return to Main Menu</a></div>

<div id="Catalog" class="container">

<table class="table table-hover">
	<tr>
		<th>&nbsp;</th>
		<th>Product ID</th>
		<th>Name</th>
	</tr>
	<c:forEach var="product" items="${productList}">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/product?id=${product.productId}">${product.productId}</a>
					${product.description}
			</td>
			<td>
				<span style="color: BLACK; "><b>
					<a href="">${product.productId}</a>
				 ${product.productId}
				</b></span>
			</td>
			<td>${product.name}</td>
		</tr>
	</c:forEach>

</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>




