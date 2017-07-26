
function displayTime()
{
	var today = new Date();
	var timeNow = today.getTime();
	document.getElementById('displayTime').innerHTML = timeNow;
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