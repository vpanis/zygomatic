$(document).ready(function(){
  $(".next-card").click(function(){
  	var current_quizz = $(this).parents(".quizzbox:first");
  	var next_quizz = $(current_quizz).next(".quizzbox");
      if (next_quizz.length > 0) {
      	// $(current_quizz).addClass('bravo');
        $(current_quizz).hide(500);
        $(next_quizz).show(500);
      }
    });
});

$(document).ready(function(){ 
  $(".bad-answer").click(function(){
        $(this).parents(".quizzbox:first").effect("shake");
				e.stopPropagation();
   });
});