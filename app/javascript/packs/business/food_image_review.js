$( document ).on('ready', function() {
  console.log(1)
  var oneobjowlcarousel = $(".owl-carousel-one");
  if (oneobjowlcarousel.length > 0) {
    oneobjowlcarousel.owlCarousel({
        responsive: {
        0:{
            items:1,
        },
        600:{
            items:1,
        },
        1000: {
          items: 1,
        },
        1200: {
          items: 1,
          },
        },

        lazyLoad: true,
        pagination: false,
        loop: false,
        dots: false,
        autoPlay: 2000,
        nav: true,
        stopOnHover: true,
        navText:["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"]
    });
  }
  $('.food-image-review').on('click', function(e){
    var index = $(this).index()
    oneobjowlcarousel.trigger('to.owl.carousel', [index, 500, true]);
  })
})
