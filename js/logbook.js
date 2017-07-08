var today = new Date();
var	hourNow = today.getFullYear();
var dinkarBirthdate = new Date("Aug 4, 1996 12:00:00");

var age = today.getTime() - dinkarBirthdate.getTime();

age = Math.floor(age/31556900000);

msg = "<p>My age is " + age + " </p>";

var element = document.getElementById('age');
element.innerHTML = msg;