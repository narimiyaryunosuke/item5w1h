/* global $ */

/* drawer */
$(function(){
  $('.drawer-nav').css('display','none');
  $('.drawer-icon').on('click', function () {
    $('.drawer-nav').slideToggle(300); 
    $(this).toggleClass('m_checked');
  });
});

/* datepicker */
$(function () {
  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD',
    icons: {
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
  });
});


