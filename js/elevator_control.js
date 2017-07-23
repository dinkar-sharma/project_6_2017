$(document).ready(function(){
    $("button").click(function(){
        $.ajax(
          {url: "../php/elevator_control.php", type: "POST"
        });
    });
});