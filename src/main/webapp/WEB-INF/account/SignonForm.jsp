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
	<div class="col-sm">
	</div>
	<div class="col-sm">
		<form action="signon" method="post">
			<script src="https://www.google.com/recaptcha/api.js" async defer></script>
			<div class="form-group">
			<h3>Login</h3>
			<small>Please enter your username and password.</small>
			</div>
			<div class="form-group">
				<label>Username</label>
				<input type="text" name="username" class="form-control"/>
			</div>
			<div class="form-group">
				<lable>Password</lable>
				<input type="password" name="password" class="form-control"/>
			</div>
			<div class="g-recaptcha" data-sitekey="6Ldoh-EZAAAAAC2d08S9f8JZqsD7BxGZggk8qB2V" align="center"></div>
			<p style="color: red">${requestScope.message}</p>
			<input type="submit" name="signon" value="Login" class="btn btn-success" />

		</form> Need a user name and password? <a href="${pageContext.request.contextPath}/signup">Register Now!</a>
	</div>
	<div class="col-sm">
	</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>