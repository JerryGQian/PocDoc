$(document).ready(function () {
  // Listen to submit event on the <form> itself!
  console.log("Ready!");
  
  var element = document.getElementsByClassName("mesgs");
  element[0].scrollTop = element[0].scrollHeight;

  var element = document.getElementById("history");
  element.scrollTop = element.scrollHeight;

  var element = document.getElementById("#scroll");
  element.scrollTop = element.scrollHeight

  $('#sendo').submit(function (e) {

    e.preventDefault();

    var hidden = $("#hido").val();
    var text = $("#koji").val();
    var usrr = $("#uji").val();

    $.post("/webmessage", {
      token: hidden,
      user: usrr,
      content: text
    }).complete(function() {
       console.log("Success");
    });

    $("#sendo").trigger("reset");
    $('#history').load(document.URL +  ' #history');
  });
});