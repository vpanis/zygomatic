$(document).ready(function(){
  $(".quizzbox").click(function(){
      if ($(this).next(".quizzbox").length > 0) {
        $(this).hide(1000);
        $(this).next(".quizzbox").show(1000);
      }
    });
});
