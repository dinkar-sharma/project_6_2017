$(document).ready(function(){
    $("button").click(function(){
    	$('#debug-content').load('php/elevator_control.php',
    		{
    			floorRequest: 1
    		});
    });
});

