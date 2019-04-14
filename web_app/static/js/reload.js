$(document).ready(function () {
  // Listen to submit event on the <form> itself!
	console.log("Ready!");

  $('#sendo').submit(function (e) {

    e.preventDefault();

    var hidden = $("#hidden").val();
    var text = $("#text").val();

    $("#sendo").trigger("reset");

    $.post("/webmessage", {
      hideden: hidden,
      text: text
    }).complete(function() {
       console.log("Success");
    });

    $('#history').load(document.URL +  ' #history');
  });
});