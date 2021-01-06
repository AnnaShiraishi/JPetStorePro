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
	<a class="card-link back-link" href="${pageContext.request.contextPath}/checkout" class="Button">
		< Check Out
	</a>
</div>

<div id="Catalog" class="container">
	<form action="${pageContext.request.contextPath}/vieworder" method="post">

		<h4>Payment Details</h4>

		<div class="form-group row">
			<label for="cardType" class="col-sm-2 col-form-label">Card Type</label>
			<div class="col-sm-8">
			<select name="cardType" class="form-control custom-select" id="cardType">
				<option value="Visa"<c:if test="${order.cardType == 'Visa'}">selected="selected"</c:if>>Visa</option>
				<option value="MasterCard"<c:if test="${order.cardType == 'MasterCard'}">selected="selected"</c:if>>MasterCard</option>
				<option value="American Express"<c:if test="${order.cardType == 'American Express'}">selected="selected"</c:if>>American Express</option>
			</select>
			</div>
		</div>

		<div class="form-group row">
			<label for="cardNumber" class="col-sm-2 col-form-label">Card Number</label>
			<div class="col-sm-8">
				<input name="creditCard" class="form-control" id="cardNumber" value="${order.creditCard}" />
			</div>
		</div>

		<div class="form-group row">
			<label for="expireDate" class="col-sm-2 col-form-label">Expiry Date (MM/YYYY)</label>
			<div class="col-sm-8">
				<input name="expiryDate" class="form-control" id="expireDate" value="${order.expiryDate}" />
			</div>
		</div>

		<h4>Billing Address</h4>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputFirstName">First Name</label>
				<input class="form-control" name="billToFirstName" value="${account.firstName}" id="inputFirstName" />
			</div>
			<div class="form-group col-md-6">
				<label for="inputLastName">Last Name</label>
				<input class="form-control" name="billToLastName" value="${account.lastName}" id="inputLastName" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress1">Address 1</label>
			<input type="text" class="form-control" name="billAddress1" value="${account.address1}" id="inputAddress1">
		</div>
		<div class="form-group">
			<label for="inputAddress2">Address 2</label>
			<input type="text" class="form-control" name="billAddress2" value="${account.address2}" id="inputAddress2">
		</div>
		<div class="form-row">
			<div class="form-group col-md-3">
				<label for="inputCity">City</label>
				<input type="text" class="form-control" name="billCity" value="${account.city}" id="inputCity">
			</div>
			<div class="form-group col-md-3">
				<label for="inputState">State</label>
				<input type="text" class="form-control" name="billState" value="${account.state}" id="inputState">
			</div>
			<div class="form-group col-md-3">
				<label for="inputZip">Zip</label>
				<input type="text" class="form-control" name="billZip" value="${account.zip}" id="inputZip">
			</div>
			<div class="form-group col-md-3">
				<label for="inputCountry">Country</label>
				<input type="text" class="form-control" name="billCountry" value="${account.country}" id="inputCountry">
			</div>
		</div>

		<div class="custom-control custom-switch">
			<input type="checkbox" class="custom-control-input" id="shippingAddressRequired" name="shippingAddressRequired" data-toggle="collapse" data-target="#shipAddressForm" aria-expanded="false" aria-controls="shipAddressForm"/>
			<label class="custom-control-label" for="shippingAddressRequired">Ship to different address</label>
		</div>

		<div class="collapse" id="shipAddressForm">
			<h4>Shipping Address</h4>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputFirstName">First Name</label>
					<input class="form-control" name="shipToFirstName" id="inputFirstName" />
				</div>
				<div class="form-group col-md-6">
					<label for="inputLastName">Last Name</label>
					<input class="form-control" name="shipToLastName" id="inputLastName" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress1">Address 1</label>
				<input type="text" class="form-control" name="shipAddress1" id="inputAddress1">
			</div>
			<div class="form-group">
				<label for="inputAddress2">Address 2</label>
				<input type="text" class="form-control" name="shipAddress2" id="inputAddress2">
			</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="inputCity">City</label>
					<input type="text" class="form-control" name="shipCity" id="inputCity">
				</div>
				<div class="form-group col-md-3">
					<label for="inputState">State</label>
					<input type="text" class="form-control" name="shipState" id="inputState">
				</div>
				<div class="form-group col-md-3">
					<label for="inputZip">Zip</label>
					<input type="text" class="form-control" name="shipZip" id="inputZip">
				</div>
				<div class="form-group col-md-3">
					<label for="inputCountry">Country</label>
					<input type="text" class="form-control" name="shipCountry" id="inputCountry">
				</div>
			</div>
		</div>

		<input type="submit" class="btn btn-success" value="Continue" />

	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>