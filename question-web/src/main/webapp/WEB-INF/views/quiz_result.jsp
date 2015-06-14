<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath}/app/quiz" var="quizMvcUrl" />
<c:set value="${pageContext.request.contextPath}/resources" var="resourcesUrl" />
<html>
<head>
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MindElements</title>

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
        	<input type="hidden" id="quizMvcUrl" value="${quizMvcUrl}" />
            <input type="hidden" id="uniqueid" value="${uniqueid}" /> 
            <script>
				$(document).ready(function() {
				});
            </script>
            <h1 class="pageTitle">Results</h1>
            <div class="uploadSec marginTop10">
            	<div class="blockDiv" id="inline_content">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="result-tbl">
                    <c:set var="counter" value="0" scope="page" />
                    <c:set var="counterCorrect" value="0" scope="page" />
                    <c:forEach items="${questionBucketList}" var="element" varStatus="status"> 
                      <c:set var="counter" value="${counter + 1}" scope="page"/>
                      <tr>
                        <c:choose>
                            <c:when test="${element.correct == 'true'}">
                            
                                <c:set var="counterCorrect" value="${counterCorrect + 1}" scope="page"/>
                               <td>
                            </c:when>
                            <c:otherwise>
                                <td style="padding-left: 5px;color:red">	        
                            </c:otherwise>
                        </c:choose>	
                        <b>${status.count}. ${element.question}</b>
                        <br/>
                        ${element.selections}
                        <c:forEach var="entry" items="${element.selection}">
                            <br/>${entry.key}. <c:out value="${entry.value}" />
                        </c:forEach>
                        <br/><br/>
                        Answer: ${element.answer} 
                        <br/>
                        Your Answer: ${element.memberAnswer}
                        <br/>
                        Correct: ${element.correct}
                        <br/>
                        Explanation: 
                        <br/><br/>
                        ${element.explanation}
                        <br/>
                      </td>
                      </tr>
                      <tr><td>&nbsp;</td></tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
            <div class="blockDiv paddingTop50 fontBold">
            	<h3>Summary</h3>
                <p> Total Correct Answer: ${counterCorrect}</p>
                <p>Total Question: ${counter}</p>
                <p><fmt:formatNumber var="average" value="${ ( counterCorrect / counter ) * 100 }" maxFractionDigits="0" /></p>
                <p>average: ${average} %</p>
            </div>
        </div>
        <div class="clear"></div>
        
        <footer>
        	Copyright &copy; 2015
        </footer>
    </section>
</div>
</div>
</body>
</html>
