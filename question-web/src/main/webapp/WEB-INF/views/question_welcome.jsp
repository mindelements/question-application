<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}/app/question" var="questionMvcUrl" />
<c:set value="${pageContext.request.contextPath}/resources" var="resourcesUrl" />
<html>
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
            <h1 class="pageTitle">Memorize question tool</h1>
            <input type="hidden" id="questionMvcUrl" value="${questionMvcUrl}" />
            <h3>Message : ${message}</h3>
            <div id="inline_content"></div>
            <div class="uploadSec marginTop10">
            	<form method="POST" enctype="multipart/form-data" action="${questionMvcUrl}/upload">
            	<div class="blockDiv">
                	<div class="width50P floatLeft lineHeight30">File to upload:</div>
                    <div class="width50P floatLeft fileField"><input type="file" name="file" id="file-select"><label for="file-select">Select File</label></div>
                    <div class="clear"></div>
                    
                    <div class="width50P floatLeft lineHeight30 marginTop10">Member Number:</div>
                    <div class="width50P floatLeft marginTop10"><input type="text" name="memberNumber" value="1234"></div>
                    <div class="clear"></div>
                </div>
                </form>
            </div>
            <div class="button-demo marginTop10"><div class="progress-demo textCenter"><button type="submit" class="ladda-button" data-color="mint" data-style="expand-right" data-size="xs">Upload</button></div></div>
            
            <div class="blockDiv paddingTop50">
            	<h3>Templates:</h3>
                <p><a href="/question-web/resources/memorize-this.xlsx">memorize-this.xlsx</a></p>
                <p><a href="/question-web/resources/sample.xlsx">sample.xlsx</a></p>
                <p><a href="/question-web/resources/sample-multi.xlsx">sample-multi.xlsx</a></p>
            </div>
        </div>
        <div class="clear"></div>
        
        <footer>
        	Copyright © 2015
        </footer>
    </section>
</div>	
</body>
</html>