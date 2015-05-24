
Question App Overview
===========

This application would allow you to upload an excel file, sample is provided on this link https://portal-mindelements.rhcloud.com/question-web/ 

The excel file is a collection of questions with the corresponding answer, answer selections and explanation.

The purpose of this application is to allow the user to memorize the answer for a specific question because the question is being prompted twice by default. 

For example, in order to pass or finish 1 question, the user has to answer it twice. If the user answers it correctly at first try, and wrong at second, then the logic will ask the question twice again.

This tool allow the user to memorize the answer for certain questions. 

By default, it has a queue for 8 questions, after the questions have been asked, if there are wrong answer selected, the user will be presented a screen to review the wrong answers. After this, it will start asking the question again. For example, if you have 16 questions, you will be asked 32 questions if you have answered all the question perfectly.

If not, the user will be stuck until the user have memorized all the answer.


Demo
=====

Try the demo to get a feel of how it worked. The demo is plain version of the application without the use of rest api as it is mostly done in jsp.

https://portal-mindelements.rhcloud.com/question-web/


How It Should Work using AngularJS
======

1. Create a default page i.e. start.html
2. Create the angular script on start.html 

The first angular ajax script should be calling "getFirstQuestion"

Below is the POST call to this url.

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getFirstQuestion/{memberNumber}/inputFile

There are two inputs to be passed on this ajax call

a. memberNumber should be passed with random number (8 numbers)
b. mulipart/encoded file upload. The field name is "file"

Below is the sample json response

```
{
  "question": "Which of the following is an example of a vulnerability?",
  "selection": {
    "d": "Unauthorized access to confidential resources",
    "b": "Misconfigured server",
    "c": "Virus infection",
    "a": "Denial of service attack"
  },
  "questionNumber": 8,
  "sessionId": "4a030e93-504f-4ff8-9e2c-420fccd5dff9",
  "answer": null,
  "explanation": null,
  "questionBucketDetails": {
    "questionNumber": 8,
    "totalQuestionRunningValue": 0,
    "totalQuestion": 12,
    "numberOfSetsDone": 1,
    "questionSetRunningValue": 0,
    "questionSetTotalValue": 8
  },
  "status": "QUESTION_AVAILABLE",
  "questionType": "single"
}
```
Based on quesiton type, you will create the answer selection as radio button or checkbox. If question type value is single, then it is a radio button. If multi-select, it should be checkbox.

You should layout the json response above like shown below:

Question: sample question
() Potato
() Apple
() Guava

For multi-select, it should be a check box


Question: sample question
[] Potato
[] Apple
[] Guava


On the bottom of the question and answer selection, you will have two button.

[Check Answer] [Next Question]

3. The chek answer button would call the angular script that will call the checkanswer ajax

You will need to pass here the generated member number and the sessionId 

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/checkAnswer/{answer}/{sessionId}/{questionNumber}

The answer is also listed on the response from above, the answer should a or b or c ,etc for single question type. For question type that is 'multi', the answer should be delimited by comma, i.e. a,b,c or a,c

Below is the sample response. You should have to show it so that user can see it clearly.

{"answer":"Answer is correct"}

The user will not be able to click the Next Button question until Check Answer button is clicked.

4. Next Question button logic. Call the getNextQuestion api call

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getNextQuestion/1111/d26fc144-0468-4f43-bfd5-8c19617e0bfb

For this call, you only need to send the sessionId and the generated member number. You should get a same signature response. Remove the old question and answer from UI, and replace with this new question that you will get from this api call.

5. Do the same logic on item 3.

6. Try to use this demo on how things work until finishing up all question. https://portal-mindelements.rhcloud.com/question-web/

You have to take care of the status. If the status is saying no question available, then you should call the getWrongAnswer.


Sample:

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getWrongAnswer/1111/d26fc144-0468-4f43-bfd5-8c19617e0bfb

```
{"question":"","selection":{},"questionNumber":10,"sessionId":"d26fc144-0468-4f43-bfd5-8c19617e0bfb","answer":"NA","explanation":"NA","questionBucketDetails":{"questionNumber":10,"totalQuestionRunningValue":0,"totalQuestion":10,"numberOfSetsDone":1,"questionSetRunningValue":1,"questionSetTotalValue":8},"status":"STATUS_NULL_QUESTIONS_NOT_ANSWERED"}
```

Create a button here, [Review Answer] With this button, you would call getWrongAnswer until it is finish. Once done, you should see a different status. You should then call the getNextQuestion API again.

You should show the answer value and the explanation here. Try the demo. https://portal-mindelements.rhcloud.com/question-web/

The reason that we are showing the wrong answer is to show to the user the correct answer and its explanation.


8. This will be same process until all questions are finished. 


Development

=============

1. To be able to call the rest api, you should be creating your angular ajax script on this location


question-application/tree/master/question-web/src/main/webapp

Clone the application from here:

https://github.com/mindelements/question-application

2. If you dont know how to run this applicaton on eclipse, then I can provide access to github so that you can commit your code directly on github, and it will get deployed automatically on the server. Around 15-30 seconds.

You will see your output on this location after deployment

https://qa1-mindelements.rhcloud.com/mindelements-question-web/

I recommend you to signup to github so that I can enable your account on this project.

3. Look at the sample index.html and index2.html on this location:

question-application/tree/master/question-web/src/main/webapp

4. You dont have to setup a local web server on your desktop. Just clone the project using github for windows and commit once you're done. The build will run automatically.

5. You have to create a design that will make this application usable in both mobile and desktop. 

6. If you know how to fork this project, that will be great. Fork it and create your change in your project and just send a pull request.


Other Old Notes
==========

Main page

* https://qa1-mindelements.rhcloud.com/question-web/

Initial REST POST call with file attachement

POST getFirstQuestion

* https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getFirstQuestion/{memberNumber}/inputFile

Sample
* https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getFirstQuestion/1111/inputFile

```
{"question":"What is ABC related for?","selection":{"d":"TV","b":"Space","c":"Travel","a":"Food"},"questionNumber":2,"sessionId":"d26fc144-0468-4f43-bfd5-8c19617e0bfb","answer":null,"explanation":null,"questionBucketDetails":{"questionNumber":2,"totalQuestionRunningValue":0,"totalQuestion":10,"numberOfSetsDone":1,"questionSetRunningValue":0,"questionSetTotalValue":8},"status":"QUESTION_AVAILABLE"}
```

Get remaining question one by one
GET getNextQuestion
*https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getNextQuestion/{memberNumber}/{sessionId}

Sample
*https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getNextQuestion/1111/d26fc144-0468-4f43-bfd5-8c19617e0bfb

```
{"question":"other question 7","selection":{"d":"other answer d 7","b":"other answer b 7","c":"other answer c 7","a":"other answer 7"},"questionNumber":10,"sessionId":"d26fc144-0468-4f43-bfd5-8c19617e0bfb","answer":null,"explanation":null,"questionBucketDetails":{"questionNumber":10,"totalQuestionRunningValue":0,"totalQuestion":10,"numberOfSetsDone":1,"questionSetRunningValue":1,"questionSetTotalValue":8},"status":"QUESTION_AVAILABLE"}
```

Check the answer for every question

GET checkAnswer

* https://qa1-mindelements.rhcloud.com/question-web/rest/questions/checkAnswer/{answer}/{sessionId}/{questionNumber}

Sample

* https://qa1-mindelements.rhcloud.com/question-web/rest/questions/checkAnswer/a/1111/d26fc144-0468-4f43-bfd5-8c19617e0bfb/1

```
{"answer":"Answer is correct"}
```

Get the list of wrong answer one by one

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getWrongAnswer/{memberNumber}/{sessionId}

Sample:

https://qa1-mindelements.rhcloud.com/question-web/rest/questions/getWrongAnswer/1111/d26fc144-0468-4f43-bfd5-8c19617e0bfb

```
{"question":"","selection":{},"questionNumber":10,"sessionId":"d26fc144-0468-4f43-bfd5-8c19617e0bfb","answer":"NA","explanation":"NA","questionBucketDetails":{"questionNumber":10,"totalQuestionRunningValue":0,"totalQuestion":10,"numberOfSetsDone":1,"questionSetRunningValue":1,"questionSetTotalValue":8},"status":"STATUS_NULL_QUESTIONS_NOT_ANSWERED"}
```

Swagger Documentation
==================

Check for QuestionBucket and AnswerBucket response json

* https://portal-mindelements.rhcloud.com/question-rest/apidocs/#!/questions
 

Real-time Development
======================

Once code is committed or changed on github. The code is build automatically. The output application will show on link below:

* https://qa1-mindelements.rhcloud.com/question-web/


 
