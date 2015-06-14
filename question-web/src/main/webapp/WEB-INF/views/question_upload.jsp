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
<script src="${resourcesUrl}/jquery.validate.js"></script>
<script type="text/javascript">jQuery(document).ready(function($){$("#validateForm").validate();});</script>
</head>
<body>
<div class="layout" id="scroller">
	<header>
    	<img src="${resourcesUrl}/images/logo.png" alt="Mind Elements">
    </header>
	<section class="pageContent">
    	<input type="hidden" id="questionMvcUrl" value="${questionMvcUrl}" /> 
		  <script>
          $(document).ready(function() {
              $("#checkAnswer").click(function(){
                  
                  $("#showStatus").text("");
                  
                  var questionMvcUrl = $('input#questionMvcUrl').val();		  
                  var sessionId = $('input#sessionId').val();
                  var number = $('input#number').val();
                  var memberNumber = $('input#memberNumber').val();
                  
                  var finalAns = '';
                  
                  var answer = $('input:radio[name=answer]:checked').val();
                  
                  var answerbox = $('input:checkbox[name=answerbox]:checked').val();
                  
                  if (typeof(answer) != 'undefined' && answer != null)
                    {
                        finalAns = answer;
                    }
        
                    if (typeof(answerbox) != 'undefined' && answerbox != null)
                    {
                        finalAns = $("input:checkbox[name=answerbox]:checked").map(function() { return this.value; }).get().join(",");
                        
                    }
                              
                  
                    
                  var url = questionMvcUrl+"/check/"+number+"/"+finalAns+"/"+memberNumber+"/"+sessionId;	    
                $.ajax({ // ajax call starts
                      url: url, // JQuery loads serverside.php
                      dataType: 'json', // Choosing a JSON datatype
                      success: function(data) // Variable data contains the data we get from serverside
                      {
                          $("#showStatus").text(data.answer);
                      }
                  });
                  return false; // keeps the page from not refreshing 
                
              });	  
          });
          </script>
        <div class="container">
        	<form method="get" id="validateForm" action="${questionMvcUrl}/next/${memberNumber}/${question.sessionId}">
            <input type="hidden" id="sessionId" name="sessionId" value="${question.sessionId}">
            <input type="hidden" id="number" name="number" value="${question.questionNumber}">	
            <input type="hidden" id="memberNumber" name="memberNumber" value="${memberNumber}">	
            <h1 class="pageTitle">${message}</h1>
            <p>QuestionCode# : ${question.questionNumber}</p>
            <p>totalQuestionRunningValue# : ${question.questionBucketDetails.totalQuestionRunningValue} </p>
            <p>totalQuestion# : ${question.questionBucketDetails.totalQuestion}</p>
            <p>numberOfSetsDone# : ${question.questionBucketDetails.numberOfSetsDone} </p>
            <p>questionSetRunningValue# : ${question.questionBucketDetails.questionSetRunningValue}</p>
            <p>questionSetTotalValue# : ${question.questionBucketDetails.questionSetTotalValue}</p>
            <div class="questionsSec marginTop10">
            	<div class="blockDiv">
                
                    <div class="queOne">
                        <h2>Question : ${question.question}</h2>
                        <div class="blockDiv paddingLeft20">
                            <ul>
                                <c:if test="${ question.questionType == 'single' }">
                                    <c:forEach var="entry" items="${question.selection}">

                                        <li><label><input name="answer" class="radio1" type="radio" value="<c:out value="${entry.key}" />"> <c:out value="${entry.value}" /></label><div class="clear"></div></li>

                                    </c:forEach>
                                </c:if>

                                <c:if test="${ question.questionType == 'multi' }">
                                    <c:forEach var="entry" items="${question.selection}">

                                        <li><label><input type="checkbox" name="answerbox" class="checkbox1" value="<c:out value="${entry.key}" />"> <c:out value="${entry.value}" /></label><div class="clear"></div></li>

                                    </c:forEach>
                                </c:if>

                                
                                

                            </ul>
                        </div>
                    </div>
                    
                    
                    
                </div>
                
                <h3 id="showStatus"></h3>
                <div class="button-demo inBlock marginTop10"><div class="progress-demo textCenter"><button class="ladda-button" data-color="mint" data-style="expand-right" data-size="xs" type="button" id="checkAnswer">Check Answer</button></div></div>
                <div class="button-demo inBlock marginTop10"><div class="progress-demo textCenter"><button class="ladda-button" data-color="mint" data-style="expand-right" data-size="xs" type="submit" id="nextQuestion">Next Question</button></div></div>
                
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
