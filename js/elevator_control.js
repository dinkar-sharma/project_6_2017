function checkTime(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}

function displayTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  // add a zero in front of numbers<10
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('displayTime').innerHTML = h + ":" + m + ":" + s;
  t = setTimeout(function() {
    displayTime()
  }, 500);
}


function displayElevatorNetwork()
{
	document.getElementById('members-table').style.display = 'none';
	document.getElementById('elevator-network-table').style.display = 'inline-table';
}

function displayMembers()
{
	document.getElementById('elevator-network-table').style.display = 'none'; 
	document.getElementById('members-table').style.display = 'inline-table';
}

$('#elevator-network').click(function(){displayElevatorNetwork(); return false;});
$('#members').click(function(){displayMembers(); return false;});

displayTime();