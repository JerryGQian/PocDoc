$(document).ready(function () {
  // Listen to submit event on the <form> itself!
  console.log("Ready!");
  
  var element = document.getElementById(".msg_history");
  element.scrollTop = element.scrollHeight;

  var element = document.getElementById(".mesgs");
  element.scrollTop = element.scrollHeight;

  var element = document.getElementById("#scroll");
  element.scrollTop = element.scrollHeight

  $('#sendo').submit(function (e) {

    e.preventDefault();

    var hidden = $("#hido").val();
    var text = $("#koji").val();

    console.log(hidden);
    console.log(text);

    $.post("/webmessage", {
      token: hidden,
      content: text
    }).complete(function() {
       console.log("Success");
    });

    $("#sendo").trigger("reset");
    $('#history').load(document.URL +  ' #history');
  });
});