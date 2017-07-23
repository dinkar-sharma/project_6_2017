function showDatabase(str)
{
	var xmlhttp;

	if (str=="") 
	{
		document.getElementById('debug-content');
		return;
	}
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	else
	{
		xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
	}

	xmlhttp.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
		{
			document.getElementById('debug-content').innerHTML = this.responseText;
		}
	}
	xmlhttp.open('POST', 'php/elevator_control.php?q'+str, true);
	xmlhttp.send();
}