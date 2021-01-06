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
	<form action="${pageContext.request.contextPath}/confirmorder" method="post">

	<table class="table table-hover">
		<tr>
			<th colspan=2>Shipping Address</th>
		</tr>

		<tr>
			<td>First name:</td>
			<td><input name="shipToFirstName" value="${order.shipToFirstName}" /></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><input name="shipToLastName" value="${order.shipToLastName}" /></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><input name="shipAddress1" value="${order.shipAddress1}" /></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><input name="shipAddress2" value="${order.shipAddress2}" /></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input name="shipCity" value="${order.shipCity}" /></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><input name="shipState" value="${order.shipState}" /></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><input name="shipZip" value="${order.shipZip}" size="10" /></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input name="shipCountry" value="${order.shipCountry}" size="15" /></td>
		</tr>

	</table>

	<input type="submit" value="Continue" />

	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>