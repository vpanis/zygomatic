$(document).ready(function(){
  var navbar_height = 70;
  var two_li_top_position = $("#sortable li:nth-child(2)").offset().top;
  var two_li_height = $("#sortable li:nth-child(2)").offset().top;
  var two_li_offset_height = 70;

  $(window).scroll(function() {
    // $("#pub").prepend( "<div class='padded'></div>" );
    var y_scroll_pos = window.pageYOffset;
    var scroll_pos_test = - navbar_height + two_li_top_position + two_li_height - two_li_offset_height;
    if (y_scroll_pos > scroll_pos_test) {
      $("#sortable li:nth-child(4)").after("<li id='pub'><div class=row><div class='col-xs-12'><div class='playlist-skit-card-container'><div class='playlist-skit-card-box'><div id='closing_cross'><i class='fa fa-times-circle' aria-hidden='true'></i></div><div class='playlist-skit-card-data'></div></div><div class='playlist-skit-card-comedian-avatar'></div></div></div></div></li>");
      $("#pub").hide().slideDown(750);
      $("#closing_cross").click(function(){
        $("#pub").fadeOut(750);
      });
      $(window).off("scroll");
    };
  });
});
