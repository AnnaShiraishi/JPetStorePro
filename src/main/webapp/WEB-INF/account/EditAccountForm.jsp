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

<div id="Catalog" class="container">

	<form action="${pageContext.request.contextPath}/myaccount" method="post">

	<h3>User Information</h3>

	<table class="table table-hover">
		<tr>
			<td>User ID:</td>
			<td>${account.username}</td>
			<td><input hidden="hidden" name="username" value="${account.username}"></td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input name="password" type="password" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input name="repeatedPassword" type="password" /></td>
		</tr>
		<p style="color: red">${requestScope.message}</p>
	</table>
	<%@ include file="IncludeAccountFields.jsp"%>

	<input name="editAccount" value="Save Account Information" type="submit"><br>
	<a href="${pageContext.request.contextPath}/listorders">My Orders</a>

	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
