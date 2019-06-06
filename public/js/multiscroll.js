/*===============================================
  MultiScroll
===============================================*/
$(function() {
  $('#multiscroll').multiscroll({
    easing: 'easeInOutQuart', 
    navigation: true,
    sectionSelector: '.ms-item',
    leftSelector: '.ms-left',
    rightSelector: '.ms-right'
  });
});