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
      $("#last-answer").click(function(){
      $(".quizz-badge-popup").fadeIn(500);
      $(".quizz-badge-popup").delay(3000).fadeOut(500);
   });
  });


$(document).ready(function(){
  $(".update_pill").click(function(){
        $(".pile1").hide();
        $(".pile2").show();
      });
});

$(document).ready(function(){
  $(".update_score").click(function(){
        $(".message1").hide(200);
        $(".message2").show(200);
      });
});

$(document).ready(function(){
  $(".bad-answer").click(function(){
        $(this).parents(".quizzbox:first").effect("shake");
				e.stopPropagation();
   });
});

