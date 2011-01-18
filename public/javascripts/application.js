// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
$(document).ready(function(){
  $('.clickable').click(function() {
    window.location = $(this).attr("url");
  });
  $('.lightbox').lightBox({
  overlayBgColor: '#FFF',
  overlayOpacity: 0.6,
  imageLoading: '/images/lightbox-ico-loading.gif',
  imageBtnClose: '/images/lightbox-btn-close.gif',
  imageBtnPrev: '/images/lightbox-btn-prev.gif',
  imageBtnNext: '/images/lightbox-btn-next.gif',
  containerResizeSpeed: 350,
  txtImage: 'Icmagem',
  txtOf: 'de'
   });        
});
