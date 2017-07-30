/*Inserts copyright with the current year*/
var today = new Date();
var year = today.getFullYear();
msg = "<p>Copyright &copy DAM Group " + year + "</p>";
var element = document.getElementById('foot');
element.innerHTML = msg;

/*Closes login window when curser is clicked out of login window*/
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) 
{
    if (event.target == modal) 
    {
        modal.style.display = "none";
    }
}

function getCookie(cookieName)
{
	var dc = document.cookie;
	var prefix = cookieName + "=";
	var begin = dc.indexOf(": " + prefix);

	if(begin == -1)
	{
		begin = dc.indexOf(prefix);
		if(begin != 0) return null;
	}
	else
	{
		begin += 2;
		var end = document.cookie.indexOf(";", begin);
		if(end == -1)
		{
			end = dc.length;
		}
	}
	return decodeURI(dc.substring(begin + prefix.length, end));
}

function hideLoginBtn()
{
	var username = getCookie("username");

	if(username != null)
	{
		document.getElementById('login').style.visibility = 'hidden';
		document.getElementById('sign-up').innerHTML = username;
	}
}

hideLoginBtn();