$(function() {
  // $(".slider-for").not('.slick-initialized').slick()
  $('.slider-for').slick({
    slidesToShow: 3,
    swipeToSlide: true,
    swipe: true,
    centerMode: true,
    asNavFor: '.slider-nav',
    centerPadding: '5px',
    focusOnSelect: true,
    prevArrow: '<div class="prev-arrow slick-arrow"><i class="fas fa-angle-left"></i></div>',
    nextArrow: '<div class="next-arrow slick-arrow"><i class="fas fa-angle-right"></i></div>'
  });
  $('.slider-nav').slick({
    slidesToShow: 1,
    arrows: false,
    asNavFor: '.slider-for',
    adaptiveHeight: true,
    swipe: true
  });
});
