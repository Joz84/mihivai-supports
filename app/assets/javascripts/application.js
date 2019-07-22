//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require_tree .
 $(window).scroll(function(){

      var wintop = $(this).scrollTop();

    $('#animated_counter').each(function(){
    if(wintop > $(this).offset().top - ($(window).height())){
      $(this).addClass('radial-chart__value');

    }
  });
});
