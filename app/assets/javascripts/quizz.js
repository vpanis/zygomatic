$(document).ready(function(){
  $(".quizzbox").click(function(){
      if ($(this).next(".quizzbox").length > 0) {
        $(this).hide();
        $(this).next(".quizzbox").show();
      }
    });
});