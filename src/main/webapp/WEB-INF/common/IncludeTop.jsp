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
    <nav class="navbar-expand-lg navbar navbar-dark bg-success">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/main">JPetStore</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent" style="alignment: center">
            <ul class="navbar-nav mr-auto justify-content-center">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Category
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=fish">Fish</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=dogs">Dogs</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=reptiles">Reptiles</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=cats">Cats</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=birds">Birds</a>
                    </div>
                </li>
                <c:if test="${sessionScope.authenticated == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/signon">Sign In</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.authenticated}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.account.username}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/myaccount">My Account</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/signout">Sign Out</a>
                        </div>
                    </li>
                </c:if>
                <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/cart">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/help.html">Help</a>
                </li>
            </ul>

            <form action="${pageContext.request.contextPath}/search" method="post" id="searchForm" class="form-inline my-2 my-lg-0">
                <span class="nav-justified mr-sm-2" ><font color="white" id="searchMsg">${searchMsg}</font></span>

                <div class="dropdown show">

                    <input type="text" name="keyword" size="14" id="searchText" class="inputTag form-control mr-sm-2 dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"/>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="searchText" id="searchDropDown">
                    </div>
                </div>

                <input type="submit" name="searchProducts" value="Search" id="searchProductsBtn" class="btn btn-outline-light my-2 my-sm-0" style="*:above: #e3f2fd;"/>
            </form>
        </div>
    </nav>


</div>
<div id="Content">