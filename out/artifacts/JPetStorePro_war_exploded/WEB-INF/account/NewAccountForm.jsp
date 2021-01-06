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
	<form id="signup" action="${pageContext.request.contextPath}/signup" method="post">

		<h3 class="infoTitle">User Information</h3>

		<div class="form-group">
			<label for="username">User Name</label>
			<input type="text" class="form-control" name="username" value="${account.username}" id="username" />
			<small id="check-username-span"></small>
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<input type="text" class="form-control" name="password" value="${account.password}" id="password" />
		</div>
		<div class="form-group">
			<label for="repeatedPassword">Repeat Password</label>
			<input type="text" class="form-control" name="repeatedPassword" id="repeatedPassword" />
			<small id="check-password-span"></small>
		</div>

		<h3 class="infoTitle">Account Information</h3>

		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputFirstName">First Name</label>
				<input class="form-control" name="firstName" value="${account.firstName}" id="inputFirstName" />
			</div>
			<div class="form-group col-md-4">
				<label for="inputLastName">Last Name</label>
				<input class="form-control" name="lastName" value="${account.lastName}" id="inputLastName" />
			</div>
			<div class="form-group col-md-4">
				<label for="inputPhone">Phone</label>
				<input class="form-control" name="phone" value="${account.phone}" id="inputPhone" />
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail">Email</label>
				<div class="input-group">
					<input type="email" class="form-control" name="email" value="${account.email}" id="inputEmail" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="sendEmailBtn">Send Email</button>
					</div>
				</div>
				<small id="check-email-span"></small>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPIN">PIN</label>
				<input class="form-control" name="PIN" placeholder="Please Enter the PIN you reserved." id="inputPIN" />
				<small id="check-PIN-span"></small>
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress1">Address 1</label>
			<input type="text" class="form-control" name="addr1" value="${account.address1}" id="inputAddress1">
		</div>
		<div class="form-group">
			<label for="inputAddress2">Address 2</label>
			<input type="text" class="form-control" name="addr2" value="${account.address2}" id="inputAddress2">
		</div>
		<div class="form-row">
			<div class="form-group col-md-3">
				<label for="inputCity">City</label>
				<input type="text" class="form-control" name="city" id="inputCity">
			</div>
			<div class="form-group col-md-3">
				<label for="inputState">State</label>
				<input type="text" class="form-control" name="state" id="inputState">
			</div>
			<div class="form-group col-md-3">
				<label for="inputZip">Zip</label>
				<input type="text" class="form-control" name="zip" id="inputZip">
			</div>
			<div class="form-group col-md-3">
				<label for="inputCountry">Country</label>
				<input type="text" class="form-control" name="country" id="inputCountry">
			</div>
		</div>

		<h3 class="infoTitle">Profile Information</h3>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="languagePreference">Language Preference</label>
				<select id="languagePreference" name="languagePreference" class="form-control custom-select">
					<option value="english"<c:if test="${account.languagePreference == 'english'}">selected="selected"</c:if>>English</option>
					<option value="japanese"<c:if test="${account.languagePreference == 'japanese'}">selected="selected"</c:if>>Japanese</option>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="favoriteCategory">Favourite Category</label>
				<select id="favoriteCategory" name="favoriteCategory" class="form-control custom-select">
					<option value="FISH"<c:if test="${account.favouriteCategoryId == 'FISH'}">selected="selected"</c:if>>Fish</option>
					<option value="DOGS"<c:if test="${account.favouriteCategoryId == 'DOGS'}">selected="selected"</c:if>>Dogs</option>
					<option value="REPTILES"<c:if test="${account.favouriteCategoryId == 'REPTILES'}">selected="selected"</c:if>>Reptiles</option>
					<option value="CATS"<c:if test="${account.favouriteCategoryId == 'CATS'}">selected="selected"</c:if>>Cats</option>
					<option value="BIRDS"<c:if test="${account.favouriteCategoryId == 'BIRDS'}">selected="selected"</c:if>>Birds</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<div class="custom-control custom-switch">
					<input <c:if test="${account.listOption}">checked</c:if> type="checkbox" class="custom-control-input" id="listOpt" name="listOpt"/>
					<label class="custom-control-label" for="listOpt">Enable MyList</label>
				</div>
			</div>
			<div class="form-group col-md-6">
				<div class="custom-control custom-switch">
					<input <c:if test="${account.bannerOption}">checked</c:if> type="checkbox" class="custom-control-input" id="bannerOpt" name="bannerOpt"/>
					<label class="custom-control-label" for="bannerOpt">Enable MyBanner</label>
				</div>
			</div>
		</div>



		<p style="color: red">${requestScope.message}</p>

		<input name="editAccount" id="editAccount" value="Creat New Account" class="btn btn-success my-1" type="button" /><br>

	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>