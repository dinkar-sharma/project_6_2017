// var today = new Date();
// var	hourNow = today.getFullYear();

// var dinkarBirthdate = new Date("Aug 4, 1996 12:00:00");
// var anasBirthdate = new Date("Feb 21, 1994 12:00:00");
// var mikeBirthdate = new Date("July 7, 1989 12:00:00");

// var dEle = document.getElementById('dinkar');
// var aEle = document.getElementById('anas');
// var mEle = document.getElementById("mike");


// function bDayFunc(bDay){

// 	var age = today.getTime() - bDay.getTime();

// 	age = Math.floor(age/31556900000);

// 	msg = "<p>My age is " + age + " </p>";
	
// 	//return msg; 
// }

// if ( dEle.innerHTML == 'dinkar'){
// 	bDayFunc(dinkarBirthdate);
// 	dEle.innerHTML = msg;
// } 
// if ( aEle.innerHTML == 'anas') {
// 	bDayFunc(anasBirthdate);
// 	aEle.innerHTML = msg;
// } 
// if( mEle.innerHTML == 'mike'){
// 	bDayFunc(mikeBirthdate);
// 	mEle.innerHTML = msg;
// }

$(document).ready(function(){
  $("#week1").on("hide.bs.collapse", function(){
    $(".test").html('<span class="glyphicon glyphicon-collapse-down"></span> Week 1');
  });
  $("#week1").on("show.bs.collapse", function(){
    $(".test").html('<span class="glyphicon glyphicon-collapse-up"></span> Week 1');
  });
});







