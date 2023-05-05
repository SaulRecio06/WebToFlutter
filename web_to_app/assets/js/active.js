

/*-----------------------------------------------------------------------------------

    Template Name: Aahar Food Delivery Html5 Template
    Template URI: https://themeforest.net/user/hastech
    Description: Aahar Food Delivery Html5 Template
    Author: Hastech
    Author URI: https://themeforest.net/user/hastech
    Version: 1.0

-----------------------------------------------------------------------------------*/

/*============= Cartbox Toggler ==============*/

function cartboxToggler() {
  var trigger = $('.minicart-trigger'),
    container = $('.cartbox-wrap');
  $('<div class="body-overlay"></div>').prependTo(container);

  trigger.on('click', function (e) {
    e.preventDefault();
    container.toggleClass('is-visible');
  })
  $('.cartbox-close').on('click', function () {
    container.removeClass('is-visible');
  })
  container.find('.body-overlay').on('click', function () {
    container.removeClass('is-visible');
  })
};
// cartboxToggler();

function cartboxClose() {
  var trigger = $('.minicart-trigger'),
    container = $('.cartbox-wrap');
  container.find('.body-overlay').trigger("click");
};

/*============= FavoritoBox Toggler ==============*/

function favoritoboxToggler() {
  var trigger = $('.minicart-favoritos-trigger'),
    container = $('.favoritosbox-wrap');
  $('<div class="body-overlay"></div>').prependTo(container);

  trigger.on('click', function (e) {
    e.preventDefault();
    container.toggleClass('is-visible');
  })
  $('.cartbox-close.favoritos').on('click', function () {
    container.removeClass('is-visible');
  })
  container.find('.body-overlay').on('click', function () {
    container.removeClass('is-visible');
  })
};
// favoritoboxToggler();

function favoritoboxClose() {
  var trigger = $('.minicart-favoritos-trigger'),
    container = $('.favoritosbox-wrap');
  container.find('.body-overlay').trigger("click");
};

/*=========== Sticky Header ===========*/
function stickyHeader() {

  $(window).on('scroll', function () {
    var sticky_menu = $('.sticky__header');
    var pos = sticky_menu.position();
    if (sticky_menu.length) {
      var windowpos = sticky_menu.top;
      $(window).on('scroll', function () {
        var windowpos = $(window).scrollTop();
        if (windowpos > pos.top + 250) {
          sticky_menu.addClass('is-sticky');
        } else {
          sticky_menu.removeClass('is-sticky');
        }
      });
    }
  });
}
// stickyHeader();





/*============= Checkout Login/Register Toggle ==============*/
function checkoutLoginToggle() {
  var checkoutMethodList = $('.checkout-method-list li');
  checkoutMethodList.on('click', function () {
    var form = $(this).data('form');
    if (!$(this).hasClass('active')) {
      $('.checkout-method-list li').removeClass('active');
      $(this).addClass('active');
      $('.checkout-method form').slideUp(500);
      $('.' + form).delay(500).slideDown();
    }
  });
}
// checkoutLoginToggle();





/*============= Checkout Shipping Form Toggle ==============*/
function checkoutShippingToggle() {
  var shipingFormToggle = $('.shipping-form-toggle');
  var shipingForm = $('.shipping-form');
  shipingFormToggle.on('click', function () {
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      shipingForm.slideUp();
    } else {
      $(this).addClass('active');
      shipingForm.slideDown();
    }
  });
}
// checkoutShippingToggle();





/*============= Payment Method Toggle ==============*/
function paymentMethodToggle() {
  var paymentMethodList = $('.payment-method-list li');
  var paymentFormToggle = $('.payment-form-toggle');
  var paymentForm = $('.payment-form');
  paymentMethodList.on('click', function () {
    paymentMethodList.removeClass('active');
    $(this).addClass('active');
    if ($(this).hasClass('payment-form-toggle')) {
      paymentForm.slideDown()
    } else {
      paymentForm.slideUp()
    }
  });
}
// paymentMethodToggle();