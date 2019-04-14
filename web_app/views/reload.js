$(document).ready(function () {
  // Listen to submit event on the <form> itself!
  $('#main').submit(function (e) {

    e.preventDefault();

    var hidden = $("#hidden").val();
    var text = $("#text").val();

    $.post("/webmessage", {
      hideden: hidden,
      text: text
    }).complete(function() {
        console.log("Success");
      });
  });
});