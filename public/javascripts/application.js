// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
$(document).ready(function(){
  $('.clickable').click(function() {
    window.location = $(this).attr("url");
  });
});
