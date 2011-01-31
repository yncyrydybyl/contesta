// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
$(document).ready(function(){
  $('.clickable').click(function() {
    window.location = $(this).attr("url");
  });

  var boxen = [];

  $('a[rel*=lightbox_]').each(function() {
    if ($.inArray($(this).attr('rel'),boxen)) boxen.push($(this).attr('rel'));
  });
  $(boxen).each(function(i,val) { 
     $('a[rel='+val+']').lightBox({
      overlayBgColor: '#FFF',
      overlayOpacity: 0.6,
      imageLoading: '/images/lightbox-ico-loading.gif',
      imageBtnClose: '/images/lightbox-btn-close.gif',
      imageBtnPrev: '/images/lightbox-btn-prev.gif',
      imageBtnNext: '/images/lightbox-btn-next.gif',
      containerResizeSpeed: 350
     });
  });
});
