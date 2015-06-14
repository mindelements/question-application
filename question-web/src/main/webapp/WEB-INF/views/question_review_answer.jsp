<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}/app/question" var="questionMvcUrl" />
<c:set value="${pageContext.request.contextPath}/resources" var="resourcesUrl" />
<html>
<head>
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
        	<input type="hidden" id="questionMvcUrl" value="${questionMvcUrl}" /> 
			  <script>
              $(document).ready(function() {
                  
                  <!-- $("input[type=submit]").attr("disabled", "disabled"); -->
                  
                  $("input[type=submit]").removeAttr("disabled");  
                  
                  var questionMvcUrl = $('input#questionMvcUrl').val();	
                  
                  $("#reviewAnswers").click(function() {
                      var sessionId = $('input#sessionId').val();
                      var memberNumber = $('input#memberNumber').val();
                      var url = questionMvcUrl+"/review/"+memberNumber+"/"+sessionId;
                      window.location = url;
                    });
            
                  return false; // keeps the page from not refreshing 
              
              });
              </script>
              
              <form method="get" action="${questionMvcUrl}/next/${memberNumber}/${question.sessionId}">
                <input type="hidden" id="sessionId" name="sessionId" value="${question.sessionId}">
                <input type="hidden" id="number" name="number" value="${question.questionNumber}">	
                <input type="hidden" id="memberNumber" name="memberNumber" value="${memberNumber}">
            <h1 class="pageTitle">${message}</h1>
            <p>QuestionCode# : ${question.questionNumber} </p>
            <p>totalQuestionRunningValue# : ${question.questionBucketDetails.totalQuestionRunningValue} </p>
            <p>totalQuestion# : ${question.questionBucketDetails.totalQuestion}</p>
            <p>numberOfSetsDone# : ${question.questionBucketDetails.numberOfSetsDone} </p>
            <p>questionSetRunningValue# : ${question.questionBucketDetails.questionSetRunningValue}</p>
            <p>questionSetTotalValue# : ${question.questionBucketDetails.questionSetTotalValue}</p>
            
            <div class="uploadSec marginTop10">
            	
            	<div class="blockDiv">
                    <c:if test="${empty question.question}">
    
                        <c:if test = "${question.status == 'STATUS_NULL_QUESTIONS_NOT_ANSWERED'}">      
                            <h4>No more question to review.  </h4>
                        </c:if> 
                        <div class="button-demo marginTop10"><div class="progress-demo textCenter"><button class="ladda-button" type="submit" id="nextQuestion" data-color="mint" data-style="expand-right" data-size="xs">Next Question</button></div></div>
                    </c:if>
                </div>
                
                <div class="blockDiv">
                	<c:if test="${not empty question.question}">
                        <h4>Question : ${question.question}</h4>
                        <c:forEach var="entry" items="${question.selection}">
                            <br/><c:out value="${entry.key}" />=<c:out value="${entry.value}" />  		
                        </c:forEach>
                        <br/>
                        <h4>Answer : ${question.answer}</h4>
                        <h4>Explanation : </h4>
                         ${question.explanation}
                        <br/>
                        <h3 id="showStatus"></h3>
                        <div class="button-demo marginTop10"><div class="progress-demo textCenter"><button class="ladda-button" type="button" id="reviewAnswers" data-color="mint" data-style="expand-right" data-size="xs">Review Answers</button></div></div>
                    </c:if>
                </div>
            </div>
            </form>
        </div>
        <div class="clear"></div>
        
        <footer>
        	Copyright &copy; 2015
        </footer>
    </section>
</div>
</body>
</html>
