<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}/app/quiz" var="quizMvcUrl" />
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
<input type="hidden" id="quizMvcUrl" value="${quizMvcUrl}" />
  <script>
  $(document).ready(function() {

	  var quizMvcUrl = $('input#quizMvcUrl').val();		  
	  var sessionId = $('input#sessionId').val();
	  var memberNumber = $('input#memberNumber').val();
	  
	  
	  $('#inline_content input:radio').click(function() { 
		    var ansVal = $(this).val();
		    var ans = $(this).attr('name')+'/'+ansVal;	 			
			var url = quizMvcUrl+"/save/"+ans+"/"+memberNumber+"/"+sessionId;   
		    if(ansVal.length > 0) {
		    $.ajax({ // ajax call starts
		          url: url, // JQuery loads serverside.php
		          dataType: 'json', // Choosing a JSON datatype
		          success: function(data) // Variable data contains the data we get from serverside
		          {
		        	  //alert(data);
		          }
		      });
	        }		  
	  }); 
	  
	  $('#inline_content input:checkbox').click(function() { 
		    var chk = $(this).attr('name');
		    var chkVal = $("input:checkbox[name="+chk+"]:checked").map(function() { return this.value; }).get().join(",");
		    var ans = $(this).attr('name')+'/'+chkVal;
			var url = quizMvcUrl+"/save/"+ans+"/"+memberNumber+"/"+sessionId;   
			if (chkVal.length > 0) {
		    $.ajax({ // ajax call starts
		          url: url, // JQuery loads serverside.php
		          dataType: 'json', // Choosing a JSON datatype
		          success: function(data) // Variable data contains the data we get from serverside
		          {
		        	  //alert(data);
		          }
		      });	
		      
		      }
		      	  
	  });	  
	  
	  
	  $( ".result_link" ).click(function() {
	  			
		var url = quizMvcUrl+"/results/"+memberNumber+"/"+sessionId; 	
  		$(location).attr('href',url);
  			
		});
	  
  });
  </script>


<div class="layout" id="scroller">
	<header>
    	<img src="${resourcesUrl}/images/logo.png" alt="Mind Elements">
    </header>
	<section class="pageContent">
    	
        <div class="container">
            <h1 class="pageTitle">Questions</h1>
            <div class="questionsSec marginTop10" id="inline_content">
            	<div class="content" id="content-1">

                	<c:forEach items="${questionBucketList}" var="element" varStatus="status"> 

                    <div class="queOne">
                        <h2>${status.count}. ${element.question}</h2>
                        <div class="blockDiv paddingLeft20">
                            <input type="hidden" id="sessionId" name="sessionId" value="${element.sessionId}">
                            <input type="hidden" id="memberNumber" name="memberNumber" value="${element.memberNumber}">	                        
                            <ul>
                                	<c:if test="${ element.questionType == 'single' }">
										<c:forEach var="entry" items="${element.selection}">
                                		
                                        <li><label><input name="${element.questionNumber}" class="radio1" type="radio" value="<c:out value="${entry.key}" />"> <c:out value="${entry.value}" /> </label><div class="clear"></div></li>
                                        
                                        </c:forEach>
									</c:if>
                                    
                                   	<c:if test="${ element.questionType == 'multi' }">
										<c:forEach var="entry" items="${element.selection}">
                                        
                                        <li><label><input type="checkbox" name="${element.questionNumber}" value="<c:out value="${entry.key}" />" class="checkbox1"> <c:out value="${entry.value}" /></label><div class="clear"></div></li>
                                        
                                        </c:forEach>
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                    
                    </c:forEach>

                </div>
                
                <div class="button-demo"><div class="progress-demo textCenter"><button class="ladda-button result_link" data-color="mint" data-style="expand-right" data-size="xs">RESULT</button></div></div>

            </div>
        </div>
        <div class="clear"></div>
        
        <footer>
        	Copyright &copy; 2015
        </footer>
    </section>
</div>

</body>
</html>
