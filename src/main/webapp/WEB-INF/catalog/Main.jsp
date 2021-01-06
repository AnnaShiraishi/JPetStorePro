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

<div id="Welcome">
	<div id="WelcomeContent">
		<c:if test="${account != null }">
			<c:if test="${authenticated}">
				Welcome ${account.firstName}!
			</c:if>
		</c:if>
	</div>
</div>

<div id="Main" class="container">
	<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active" data-interval="3000">
				<a href="${pageContext.request.contextPath}/category?id=fish">
				<img src="${pageContext.servletContext.contextPath}/images/slide/fish.png" class="d-block w-100" alt="fish">
				</a>
			</div>
			<div class="carousel-item" data-interval="3000">
				<a href="${pageContext.request.contextPath}/category?id=dogs">
					<img src="${pageContext.servletContext.contextPath}/images/slide/dogs.png" class="d-block w-100" alt="dogs">
				</a>
			</div>
			<div class="carousel-item" data-interval="3000">
				<a href="${pageContext.request.contextPath}/category?id=reptiles">
					<img src="${pageContext.servletContext.contextPath}/images/slide/reptiles.png" class="d-block w-100" alt="reptiles">
				</a>
			</div>
			<div class="carousel-item" data-interval="3000">
				<a href="${pageContext.request.contextPath}/category?id=cats">
					<img src="${pageContext.servletContext.contextPath}/images/slide/cats.png" class="d-block w-100" alt="cats">
				</a>
			</div>
			<div class="carousel-item" data-interval="3000">
				<a href="${pageContext.request.contextPath}/category?id=birds">
					<img src="${pageContext.servletContext.contextPath}/images/slide/birds.png" class="d-block w-100" alt="birds">
				</a>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

<div id="Separator">&nbsp;</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>

