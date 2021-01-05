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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="StyleSheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" type="text/css"
          media="screen"/>
    <link rel="StyleSheet" href="${pageContext.servletContext.contextPath}/css/jpetstore.css" type="text/css"
          media="screen"/>
    <link rel="StyleSheet" href="${pageContext.servletContext.contextPath}/css/jpetstoremain.css" type="text/css"
          media="screen"/>
    <meta name="generator"
          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org"/>
    <title>JPetStore Demo</title>
    <meta content="text/html; charset=windows-1252"
          http-equiv="Content-Type"/>
    <meta charset="utf-8"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="Pragma" content="no-cache"/>
</head>

<body>

<div id="Header">

    <div id="Logo">
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="${pageContext.request.contextPath}/cart"><img align="middle" name="img_cart"
                                                                   src="${pageContext.servletContext.contextPath}/images/cart.gif"/></a>

            <img align="middle" src="${pageContext.servletContext.contextPath}/images/separator.gif"/>

            <c:if test="${sessionScope.authenticated == null}">
                <a href="${pageContext.request.contextPath}/signon">Sign In</a>
            </c:if>
            <c:if test="${sessionScope.authenticated}">
                <a href="${pageContext.request.contextPath}/signout">Sign Out</a>
                <img align="middle" src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
                <a href="${pageContext.request.contextPath}/myaccount">My Account</a>
            </c:if>
            <img align="middle" src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
            <a href="${pageContext.request.contextPath}/help.html">?</a>
        </div>
    </div>

	<nav id="quick-links-nav">
		<div class="quick-links">
			<div class="link-container">
				<a href="${pageContext.request.contextPath}/main" class="quick-link">
					JPetStore
				</a>
			</div>
            <div class="link-container"><a class="quick-link" href="${pageContext.request.contextPath}/category?id=fish">fish</a></div>
            <div class="ink-container"><a class="quick-link" href="${pageContext.request.contextPath}/category?id=dogs">dogs</a></div>
            <div class="link-container"><a class="quick-link" href="${pageContext.request.contextPath}/category?id=reptiles">reptiles</a></div>
            <div class="link-container"><a class="quick-link" href="${pageContext.request.contextPath}/category?id=cats">cats</a></div>
            <div class="link-container"><a class="quick-link" href="${pageContext.request.contextPath}/category?id=birds">birds</a></div>

            <div id="Search">
                <div id="SearchContent">
                    <form action="${pageContext.request.contextPath}/search" method="post">
                        <input type="text" name="keyword" size="14"/>
                        <input type="submit" name="searchProducts" value="Search"/>
                        <span style="color: #ff0000">${searchMsg}</span>
                    </form>
                </div>
            </div>
		</div>
	</nav>

<%--    <div id="QuickLinks">
        <a href="${pageContext.request.contextPath}/category?id=fish"><img
                src="${pageContext.servletContext.contextPath}/images/sm_fish.gif"/></a>
        <img src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
        <a href="${pageContext.request.contextPath}/category?id=dogs"><img
                src="${pageContext.servletContext.contextPath}/images/sm_dogs.gif"/></a>
        <img src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
        <a href="${pageContext.request.contextPath}/category?id=reptiles"><img
                src="${pageContext.servletContext.contextPath}/images/sm_reptiles.gif"/></a>
        <img src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
        <a href="${pageContext.request.contextPath}/category?id=cats"><img
                src="${pageContext.servletContext.contextPath}/images/sm_cats.gif"/></a>
        <img src="${pageContext.servletContext.contextPath}/images/separator.gif"/>
        <a href="${pageContext.request.contextPath}/category?id=birds"><img
                src="${pageContext.servletContext.contextPath}/images/sm_birds.gif"/></a>
    </div>--%>
</div>
<div id="Content">