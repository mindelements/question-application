<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}/app/question" var="questionMvcUrl" />
<c:set value="${pageContext.request.contextPath}/resources" var="resourcesUrl" />
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MindElements</title>
<head>
<link rel="stylesheet" href="${resourcesUrl}/css/style.css" type="text/css" />
<link rel="stylesheet" href="${resourcesUrl}/css/demo.css" type="text/css"/>
<link rel="stylesheet" href="${resourcesUrl}/css/fm.checkator.jquery.css" type="text/css"/>
<link rel="stylesheet" href="${resourcesUrl}/css/jquery.mCustomScrollbar.css" type="text/css" />
<link rel="stylesheet" href="${resourcesUrl}/css/ladda.min.css" type="text/css" />
<link rel="stylesheet" href="${resourcesUrl}/css/responsive.css" type="text/css" />

<script src="${resourcesUrl}/jquery-1.11.1.min.js"></script>
<script src="${resourcesUrl}/js/functions.js"></script>
<script src="${resourcesUrl}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${resourcesUrl}/js/fm.checkator.jquery.js"></script>
<script src="${resourcesUrl}/js/ladda.min.js"></script>
<script src="${resourcesUrl}/js/spin.min.js"></script>
</head>

<body>
<div class="layout">
	<header>
    	<img src="${resourcesUrl}/images/logo.png" alt="Mind Elements">
    </header>
	<section class="pageContent">
    	
        <div class="container">
            <br/>
            <p>Please find below tools:</p>
            <br/>
            <ul>
               	<li><a href="${pageContext.request.contextPath}/app/question/welcome">Question Tool</a></li>
                <li><a href="${pageContext.request.contextPath}/app/quiz/welcome">Quiz Tool</a></li>            <ul>
            </ul>
            <!--
            <div class="blockDiv marginTop10 content" id="content-1">
            	<ul class="arrowList">
                	<li><a href="${pageContext.request.contextPath}/app/question/welcome">Memorize</a></li>
                    <li><a href="${pageContext.request.contextPath}/app/quiz/welcome">Practice Question</a></li>
                </ul>
            </div>
            -->
        </div>
        <div class="clear"></div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        Copy the link below and download the sample excel file on your browser.
        <br/>
        https://qa1-mindelements.rhcloud.com/question-web/resources/sample-multi.xlsx
        <br/>
        <br/>        
        (c) support@mindelements.net
        <br/>
        (w) www.mindelements.net
        <br/>
        <br/>
        <footer>
        	Copyright &copy; 2015
        </footer>
    </section>
</div>
</body>
</html>
