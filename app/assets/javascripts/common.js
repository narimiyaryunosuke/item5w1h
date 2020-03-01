/* global $ */

/* drawer */
$(function(){
  $('.drawer-nav').css('display','none');
  $('.drawer-icon').on('click', function () {
    $('.drawer-nav').slideToggle(300); 
    $(this).toggleClass('m_checked');
  });
});



