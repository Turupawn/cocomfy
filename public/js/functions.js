$(function() {

  "use strict";


  /*===============================================
    Preloaders
  ===============================================*/
  var $body = $("body");

  $(window).on("load", function () {
    $body.addClass("loaded");
  });

  if ($body.attr("data-preloader") === "1") {
    $body.append($("<div class='preloader preloader-1'><div><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "2") {
    $body.append($("<div class='preloader preloader-2'><div><svg class='loader-circular' viewBox='25 25 50 50'><circle class='loader-path' cx='50' cy='50' r='20' fill='none' stroke-width='2' stroke-miterlimit='10'/></svg></div></div>"));
  }
  else if ($body.attr("data-preloader") === "3") {
    $body.append($("<div class='preloader preloader-3'><div><span></span><span></span><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "4") {
    $body.append($("<div class='preloader preloader-4'><div><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "5") {
    $body.append($("<div class='preloader preloader-5'><div><span></span><span></span><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "6") {
    $body.append($("<div class='preloader preloader-6'><div><span></span><span></span><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "7") {
    $body.append($("<div class='preloader preloader-7'><div><span></span><span></span><span></span><span></span><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "8") {
    $body.append($("<div class='preloader preloader-8'><div><span></span><span></span><span></span><span></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "9") {
    $body.append($("<div class='preloader preloader-9'><div><span class='spinner-box'><span></span><span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "10") {
    $body.append($("<div class='preloader preloader-10'><div><h6 class='heading-uppercase'>Loading</h6><span class='spinner'></span></div></div>"));
  }
  else if ($body.attr("data-preloader") === "11") {
    $body.append($("<div class='preloader preloader-11'><div><span class='spinner'><span></div></div>"));
  }


  /*===============================================
    Navbar Menu
  ===============================================*/
  var nav = $(".nav");
  var navToggle = $(".nav-toggle-btn");

  //
  // Show Nav menu on Toggle //
  //
  navToggle.on("click", function(e) {
    var d = $(".nav-dropdown");
    var s = $(".sub-dropdown");
    var dMenu = $(".dropdown-menu");
    var sMenu = $(".sub-dropdown-menu");

    if (nav.hasClass("nav-show")) {
      nav.removeClass("nav-show");
      if (dMenu.hasClass("dropdown-menu-show")) {
        dMenu.removeClass("dropdown-menu-show");
        d.removeClass("dropdown-minus");
      }
      if (sMenu.hasClass("sub-dropdown-menu-show")) {
        sMenu.removeClass("sub-dropdown-menu-show");
        s.removeClass("sub-dropdown-minus");
      }
    }
    else {
      nav.addClass("nav-show");
    }
    e.stopPropagation();
  });

  //
  // Navicon transform into X //
  //
  navToggle.on("click", function() {
    if (navToggle.hasClass("nav-toggle-close")) {
      navToggle.removeClass("nav-toggle-close");
    }
    else {
      navToggle.addClass("nav-toggle-close");
    }
  });

  //
  // Navbar Dropdown //
  //
  var dropdownBtn = $(".nav-dropdown .nav-link");
  var subDropdownBtn = $(".sub-dropdown a");

  dropdownBtn.on("click", function() {
    var d = $(this).parent(".nav-dropdown").children(".dropdown-menu");
    if (d.hasClass("dropdown-menu-show")) {
      d.removeClass("dropdown-menu-show");
    }
    else {
      d.addClass("dropdown-menu-show");
    }
  });

  subDropdownBtn.on("click", function(e) {
    var s = $(this).parent(".sub-dropdown").children(".sub-dropdown-menu");

    if (s.hasClass("sub-dropdown-menu-show"))  {
      s.removeClass("sub-dropdown-menu-show");
    }
    else {
      s.addClass("sub-dropdown-menu-show");
    }
    e.stopPropagation();
  });

  //
  // Transform plus into minus //
  //
  dropdownBtn.on("click", function() {
    var m = $(this).parent(".nav-dropdown").children(".dropdown-menu");
    var d = $(this).parent(".nav-dropdown");

    if (m.hasClass("dropdown-menu-show")) {
      d.addClass("dropdown-minus");
    }
    else {
      d.removeClass("dropdown-minus");
    }
  });

  subDropdownBtn.on("click", function() {
    var m = $(this).parent(".sub-dropdown").children(".sub-dropdown-menu");
    var s = $(this).parent(".sub-dropdown");

    if (m.hasClass("sub-dropdown-menu-show")) {
      s.addClass("sub-dropdown-minus");
    }
    else {
      s.removeClass("sub-dropdown-minus");
    }
  });

  //
  // Close Nav Menu //
  //
  $(document).on("click", function(e) {
    if ( $(e.target).closest(".nav").length === 0 ) {
      if (nav.hasClass("nav-show")) {
        var d = $(".dropdown-menu");
        var s = $(".sub-dropdown-menu");

        nav.removeClass("nav-show");
        if (d.hasClass("dropdown-menu-show")) {
          d.removeClass("dropdown-menu-show");
          $(".nav-dropdown").removeClass("dropdown-minus");
        }
        if (s.hasClass("sub-dropdown-menu-show")) {
          s.removeClass("sub-dropdown-menu-show");
          $(".sub-dropdown").removeClass("sub-dropdown-minus");
        }
      }
      if (navToggle.hasClass("nav-toggle-close")) {
        navToggle.removeClass("nav-toggle-close");
      }
    }
  });

  //
  // Prevent content jumping to top on click(href='#') //
  //
  $(".navbar a[href='#']").on("click", function(e) {
    e.preventDefault();
  });

  //
  // Position toggle button left if nav is aligned left //
  //
  if (nav.hasClass("mr-auto")) {
    navToggle.addClass("left");
  }

  //
  // Sticky Navbar //
  //
  if ($(".navbar-sticky").length) {
    var navbarSticky = $(".navbar-sticky");
    var navbarOffset = navbarSticky.offset().top;

    $(window).on("scroll", function() {
      var navbarPlaceholder = $(".navbar-placeholder");

      if ($(window).scrollTop() >= navbarOffset) {
        navbarSticky.addClass("navbar-sticky-apply");
        navbarPlaceholder.addClass("navbar-placeholder-padding");
      }
      else {
        navbarSticky.removeClass("navbar-sticky-apply");
        navbarPlaceholder.removeClass("navbar-placeholder-padding");
      }

      if ($(window).scrollTop() >= navbarOffset + 20) {
        navbarSticky.addClass("navbar-shrink");
      }
      else {
        navbarSticky.removeClass("navbar-shrink");
      }
    });
    // Navbar Sticky Placeholder
    $("<div class='navbar-placeholder'></div>").insertAfter(".navbar-sticky");
  }


  /*===============================================
    Fullscreen Toggle Menu
  ===============================================*/
  var toggleMenu = $(".fullscreen-menu");
  var toggleBtn = $(".fullscreen-toggle-btn");

  //
  // Show Toggle menu on Toggle //
  //
  toggleBtn.on("click", function(e) {
    if (toggleMenu.hasClass("fullscreen-menu-show")) {
      toggleMenu.removeClass("fullscreen-menu-show");
    }
    else {
      toggleMenu.addClass("fullscreen-menu-show");
    }
    e.stopPropagation();
  });

  //
  // Hide Toggle button //
  //
  toggleBtn.on("click", function() {
    if (toggleBtn.hasClass("fullscreen-toggle-hide")) {
      toggleBtn.removeClass("fullscreen-toggle-hide");
    }
    else {
      toggleBtn.addClass("fullscreen-toggle-hide");
    }
  });

  //
  // Close Toggle menu //
  //
  $(document).on("click", function() {
    if (toggleMenu.hasClass("fullscreen-menu-show")) {
      toggleMenu.removeClass("fullscreen-menu-show");
      toggleBtn.removeClass("fullscreen-toggle-hide");
    }
  });


  /*===============================================
    Mega Menu
  ===============================================*/
  var megaMenuToggle = $(".nav-megadropdown");

  megaMenuToggle.on("click", function() {
    var m = $(this).children(".mega-menu");
    var l = $(this).children(".nav-link");
    if (m.hasClass("mega-menu-show")) {
      m.removeClass("mega-menu-show");
      l.removeClass("nav-link-minus");
    }
    else {
      m.addClass("mega-menu-show");
      l.addClass("nav-link-minus");
    }
  });

  var megaMenu = $(".mega-menu");

  navToggle.on("click", function() {
    if (megaMenu.hasClass("mega-menu-show")) {
      megaMenu.removeClass("mega-menu-show");
      $(".nav-link").removeClass("nav-link-minus");
    }
  });

  $(document).on("click", function(e) {
    if ( $(e.target).closest(".nav").length === 0 ) {
      if (megaMenu.hasClass("mega-menu-show")) {
        megaMenu.removeClass("mega-menu-show");
        $(".nav-link").removeClass("nav-link-minus");
      }
    }
  });


  /*===============================================
    Sidebar Menu
  ===============================================*/
  var sidebarDropdownLink = $(".sidebar-dropdown-link");

  sidebarDropdownLink.on("click", function() {
    var sidebarDropdownMenu = $(this).parent().children(".sidebar-dropdown");
    var $this = $(this);

    if (sidebarDropdownMenu.hasClass("sidebar-dropdown-show")) {
      sidebarDropdownMenu.removeClass("sidebar-dropdown-show");
      $this.removeClass("minus");
    }
    else {
      sidebarDropdownMenu.addClass("sidebar-dropdown-show");
      $this.addClass("minus");
    }
  });

  var sidebarToggle = $(".sidebar-nav-toggle");
  var sidebarNavContent = $(".sidebar-nav-content");

  sidebarToggle.on("click", function() {
    if (sidebarToggle.hasClass("sidebar-nav-toggle-close")) {
      sidebarToggle.removeClass("sidebar-nav-toggle-close");
      sidebarNavContent.removeClass("sidebar-nav-show");
    }
    else {
      sidebarToggle.addClass("sidebar-nav-toggle-close");
      sidebarNavContent.addClass("sidebar-nav-show");
    }
  });

  //
  // Prevent content jumping to top on click(href='#') //
  //
  $(".sidebar-menu a[href='#']").on("click", function(e) {
    e.preventDefault();
  });
  

  /*===============================================
    Subscribe Lightbox
  ===============================================*/
  var subscribeBtn = $(".subscribe-lightbox-link");
  var subscribeLightbox = $(".subscribe-lightbox");

  subscribeBtn.on("click", function(e) {
    if (subscribeLightbox.hasClass("subscribe-lightbox-show")) {
      subscribeLightbox.removeClass("subscribe-lightbox-show");
    }
    else {
      subscribeLightbox.addClass("subscribe-lightbox-show");
    }
    e.stopPropagation();
  });

  $(document).on("click", function(e) {
    if ( $(e.target).closest(".subscribe-lightbox div[class^='col-']").length === 0 ) {
      if (subscribeLightbox.hasClass("subscribe-lightbox-show")) {
        subscribeLightbox.removeClass("subscribe-lightbox-show");
      }
    }
  });


  /*===============================================
    Search Form
  ===============================================*/
  var searchWrapper = $(".search-wrapper");
  var searchToggle = $(".search-toggle");

  //
  // Show Nav menu when Toggle button clicked //
  //
  searchToggle.on("click", function(e) {
    if (searchWrapper.hasClass("search-wrapper-show")) {
      searchWrapper.removeClass("search-wrapper-show");
    }
    else {
      searchWrapper.addClass("search-wrapper-show");
    }
    e.stopPropagation();
  });

  $(document).on("click", function(e) {
    if ( $(e.target).closest(".search-wrapper div[class^='col-']").length === 0 ) {
      if (searchWrapper.hasClass("search-wrapper-show")) {
        searchWrapper.removeClass("search-wrapper-show");
      }
    }
  });


  /*===============================================
    Shrink Navbar when starts scrolling
  ===============================================*/
  var navbarFixed = $(".navbar-fixed");

  $(window).on("scroll", function() {
    if ($(window).scrollTop() >= 10) {
      navbarFixed.addClass("navbar-shrink");
    } else {
      navbarFixed.removeClass("navbar-shrink");
    }
  });


  /*===============================================
    Smooth Scrollin on links
  ===============================================*/
  var htmlBody = $("html,body");
  var ssBtn = $(".scrolldown-btn, .scrolldown, .navbar a");

  ssBtn.on("click", function(e) {
    htmlBody.animate({scrollTop: $(this.hash).offset().top}, 800, "easeInOutQuart");
    e.preventDefault();
  });


  /*===============================================
    Scroll to top button
  ===============================================*/
  var scrollTopBtn = $(".scrolltotop");
  //
  // Show/Hide button //
  //
  $(window).on("scroll", function(){
    if ($(this).scrollTop() > 700) { // 700px from top
      scrollTopBtn.addClass("scrolltotop-show");
    }
    else {
      scrollTopBtn.removeClass("scrolltotop-show");
    }
  });

  //
  // Animate button //
  //
  scrollTopBtn.on("click", function(){
    htmlBody.animate({scrollTop : 0}, 800, "easeInOutQuart");
    return false;
  });
  

  /*===============================================
    Portfolio
  ===============================================*/
  $(".portfolio-wrapper").imagesLoaded( function() {
    var $portfolioWrapper = $(".portfolio-wrapper").isotope({
      itemSelector: ".portfolio-item",
      transitionDuration: 350
    });
    var filter = $(".filter ul li");

    // Portfolio Filter //
    filter.on("click", function() {
      var filterValue = $(this).attr("data-filter");
      $portfolioWrapper.isotope({ filter: filterValue });

      filter.removeClass("active");
      $(this).addClass("active");
    });
  });
  

  /*===============================================
    Owl Carousel Sliders
  ===============================================*/
  $(".owl-carousel").each( function() {
    var $carousel = $(this);

    var $defaults = {
      rewind: true,
      navText: ["<i class='ti-angle-left'></i>","<i class='ti-angle-right'></i>"],
      autoHeight: true, 
      autoplayTimeout: 4000,
      autoplayHoverPause: true
    }

    var $options = {
      items: $carousel.data("owl-items"),
      margin: $carousel.data("owl-margin"),
      loop: $carousel.data("owl-loop"),
      center: $carousel.data("owl-center"),
      mouseDrag: $carousel.data("owl-mouseDrag"),
      touchDrag: $carousel.data("owl-touchDrag"),
      pullDrag: $carousel.data("owl-pullDrag"),
      freeDrag: $carousel.data("owl-freeDrag"),
      stagePadding: $carousel.data("owl-stagePadding"),
      autoWidth: $carousel.data("owl-autoWidth"),
      startPosition: $carousel.data("owl-startPosition"),
      URLhashListener: $carousel.data("owl-URLhashListener"),
      nav: $carousel.data("owl-nav"),
      rewind: $carousel.data("owl-rewind"),
      navElement: $carousel.data("owl-navElement"),
      slideBy: $carousel.data("owl-slideBy"),
      dots: $carousel.data("owl-dots"),
      dotsEach: $carousel.data("owl-dotsEach"),
      autoplay: $carousel.data("owl-autoplay"),
      autoplayTimeout: $carousel.data("owl-autoplayTimeout"),
      smartSpeed: $carousel.data("owl-smartSpeed"),
      fluidSpeed: $carousel.data("owl-fluidSpeed"),
      autoplaySpeed: $carousel.data("owl-autoplaySpeed"),
      navSpeed: $carousel.data("owl-navSpeed"),
      dotsSpeed: $carousel.data("owl-dotsSpeed"),
      dragEndSpeed: $carousel.data("owl-dragEndSpeed"),
      callback: $carousel.data("owl-callback"),
      video: $carousel.data("owl-video"),
      videoHeight: $carousel.data("owl-videoHeight"),
      videoWidth: $carousel.data("owl-videoWidth"),
      itemElement: $carousel.data("owl-itemElement"),
      stageElement: $carousel.data("owl-stageElement"),
      navContainer: $carousel.data("owl-navContainer"),
      dotsContainer: $carousel.data("owl-dotsContainer")
    }

    var $responsive = {
      responsive: {
        0 : {
          items: $carousel.data("owl-xs")
        },
        // breakpoint from 576px+
        576 : {
          items: $carousel.data("owl-sm")
        },
        // breakpoint from 768px+
        768 : {
          items: $carousel.data("owl-md")
        },
        // breakpoint from 992px+
        992 : {
          items: $carousel.data("owl-lg")
        },
        // breakpoint from 1200px+
        1200 : {
          items: $carousel.data("owl-xl")
        }
      }
    }

    $carousel.owlCarousel( $.extend( $defaults, $options, $responsive) );
  });

  //
  // Home Portfolio Carousel navigation //
  //
  var homePortfolioPrev = $("#homePortfolioPrev");
  var homePortfolioNext = $("#homePortfolioNext");

  homePortfolioNext.on("click", function(){
    $("#homePortfolioSlider").trigger("next.owl.carousel", [300]);
  });
  homePortfolioPrev.on("click", function(){
    $("#homePortfolioSlider").trigger("prev.owl.carousel", [300]);
  });
  

  /*===============================================
    Magnific Popup
  ===============================================*/
  //
  // Lightbox - Single Image //
  //
  $(".lightbox-image").each(function () {
    $(this).magnificPopup({
      type: 'image',
      fixedContentPos: false,
      removalDelay: 200,
      closeOnContentClick: true, 
      image: {
        titleSrc: 'data-image-title'
      }
    });
  });

  //
  // Lightbox - Gallery //
  //
  $(".gallery-box").on('click', function () {
    $(this).next().magnificPopup('open');
  });

  $(".gallery-wrapper").each(function () {
    $(this).magnificPopup({
      delegate: 'a',
      removalDelay: '200',
      type: 'image',
      fixedContentPos: false,
      gallery: {
          enabled: true
      },
      image: {
        titleSrc: 'data-gallery-title'
      }
    });
  });

  //
  // Lightbox - Youtube video //
  //
  var popupYoutube = $(".popup-youtube");
  var youtubeSrc = popupYoutube.attr("data-youtube-src");

  popupYoutube.magnificPopup({
    items: { src: youtubeSrc },
    type: "iframe",
    fixedContentPos: false,
    removalDelay: 200,
    preloader: false,
    iframe: {
      patterns: {
        youtube: {
          index: "youtube.com/", // String that detects type of video (in this case YouTube). Simply via url.indexOf(index).
          id: "v=",
          src: youtubeSrc
        }
      },
      srcAction: "iframe_src" // Templating object key. First part defines CSS selector, second attribute. "iframe_src" means: find "iframe" and set attribute "src".
    }
  });

  //
  // Lightbox - Vimeo video //
  //
  var popupVimeo = $(".popup-vimeo");
  var vimeoSrc = popupVimeo.attr("data-vimeo-src");

  popupVimeo.magnificPopup({
    items: { src: vimeoSrc },
    type: "iframe",
    fixedContentPos: false,
    removalDelay: 200,
    preloader: false,
    iframe: {
      patterns: {
        vimeo: {
          index: "vimeo.com/", // String that detects type of video (in this case YouTube). Simply via url.indexOf(index).
          id: "/",
          src: vimeoSrc
        }
      },
      srcAction: "iframe_src" // Templating object key. First part defines CSS selector, second attribute. "iframe_src" means: find "iframe" and set attribute "src".
    }
  });


  /*===============================================
    Blog Masonry
  ===============================================*/
  $(".blog-masonry").masonry({
    itemSelector: '.blog-post-box'
  });


  /*===============================================
    Parallax
  ===============================================*/
  $(".parallax").jarallax({
    speed: 0.2
  });


  /*===============================================
    Countdown
  ===============================================*/
  //
  // Countdown - Legacy style //
  //
  $(".countdown").each(function() {
    var finalDate = $(this).attr('data-countdown');

    $(this).countdown(finalDate, function(event) {
      $(this).html(event.strftime(''
        + '<div><h2 class="font-light">%D</h2><h6 class="heading-uppercase">Days</h6></div>'
        + '<div><h2 class="font-light">%H</h2><h6 class="heading-uppercase">Hours</h6></div>'
        + '<div><h2 class="font-light">%M</h2><h6 class="heading-uppercase">Minutes</h6></div>'
        + '<div><h2 class="font-light">%S</h2><h6 class="heading-uppercase">Seconds</h6></div>'));
    });
  });

  //
  // Countdown - Basic style //
  //
  $(".countdown-basic").each(function() {
    var finalDate = $(this).attr('data-countdown');

    $(this).countdown(finalDate, function(event) {
      $(this).html(event.strftime('%D days %H:%M:%S'));
    });
  });


  /*===============================================
    Accordion
  ===============================================*/
  var accordionTitle = $(".accordion-title");

  accordionTitle.on("click", function() {
    var accordionList = $(this).parent("li");
    var accordionContent = this.nextElementSibling;

    if (accordionList.hasClass("active")) {
      accordionList.removeClass("active");
      accordionContent.style.maxHeight = null;
    }
    else {
      accordionList.addClass("active");
      if ($(this).closest(".accordion").hasClass("accordion-oneopen")) {
        $(this).closest(".accordion").children("li").removeClass("active");
        accordionList.addClass("active");
        $(".accordion-oneopen > li > .accordion-content").css("max-height", "0");
      }
      accordionContent.style.maxHeight = accordionContent.scrollHeight + "px";
    }
  });

  //
  // Give max-height to Accordion's active content //
  //
  if ($(".accordion li").hasClass("active")) {
    var accordionActiveContent = $(".accordion > li.active > .accordion-content");
    var accordionHeight = accordionActiveContent.prop("scrollHeight");
    
    accordionActiveContent.css({'max-height': accordionHeight + "px"});
  }

  
  /*===============================================
    Fun Facts Counter
  ===============================================*/
  $(".facts-wrapper").appear(function() {

    var fcounter = $(".facts-counter");

    fcounter.each(function () {
      $(this).prop("Counter",0).animate({
          Counter: $(this).text()
      }, {
          duration: 3000,
          easing: "swing",
          step: function (now) {
              $(this).text(Math.ceil(now));
          }
      });
    });

  },{accX: 0, accY: -10});


  /*===============================================
    Quantity
  ===============================================*/
  $(".product-quantity .button-circle").on("click", function() {
    var $qBtn = $(this);
    var oldVal = $qBtn.parent().find("input").val();

    if ($(this).hasClass("inc")) {
      var newVal = parseFloat(oldVal) + 1;
    }
    else {
      // Don't allow decrementing below one
      if (oldVal > 1) {
        var newVal = parseFloat(oldVal) - 1;
      }
      else {
        newVal = 1;
      }
    }

    $qBtn.parent().find("input").val(newVal);
  });


  /*===============================================
    Returning Customer Login
  ===============================================*/
  //
  // Login //
  //
  var loginBtn = $(".return-login-btn");

  loginBtn.on("click", function() {
    var l = $(".return-login");

    if (l.hasClass("return-login-show")) {
      l.removeClass("return-login-show");
    }
    else {
      l.addClass("return-login-show");
    }
  });

  //
  // Create Account //
  //
  var createAccountToggle = $(".create-account-toggle input");

  createAccountToggle.on("click", function() {
    var c = $(".create-account-box");
    
    if (createAccountToggle.is(":checked")) {
      c.addClass("create-account-box-show");
    }
    else {
      c.removeClass("create-account-box-show");
    }
  });


  /*===============================================
    Popover
  ===============================================*/
  $('[data-toggle="popover"]').popover();


  /*===============================================
    Tooltip
  ===============================================*/
  $('[data-toggle="tooltip"]').tooltip();


  /*===============================================
    Google Maps
  ===============================================*/
  var mapCanvas = $("#map-canvas");

  if (mapCanvas.length) {
    var initLatitude = mapCanvas.attr("data-latitude");
    var initLongitude = mapCanvas.attr("data-longitude");

    var map = new GMaps({
      el: "#map-canvas",
      lat: initLatitude,
      lng: initLongitude,
      zoom: 16,
      scrollwheel: false
    });
    
    map.addMarker({
      lat : initLatitude,
      lng : initLongitude
    });
  }


  /*===============================================
    Contact Form
  ===============================================*/
  $("#contactform").on("submit", function(e) {
    var name = $("#name").val();
    var email = $("#email").val();
    var subject = $("#subject").val();
    var message = $("#message").val();

    if (name === "") {
      $("#name").addClass("error-color");
    }
    if (email === "") {
      $("#email").addClass("error-color");
    }
    if (subject === "") {
      $("#subject").addClass("error-color");
    }
    if (message === "") {
      $("#message").addClass("error-color");
    }

    else {
      $.ajax({
        url:"../assets/php/contact-form.php",
        data:$(this).serialize(),
        type:"POST",
        success:function(data){
          $("#success").addClass("show-result"); //=== Show Success Message==
          $("#contactform").each(function(){
            this.reset();
          });
        },
        error:function(data){
          $("#error").addClass("show-result"); //===Show Error Message====
        }
      });
      var forms = $("#contactform input, #contactform textarea");
      forms.removeClass("error-color");
    }

    e.preventDefault();
  });


});