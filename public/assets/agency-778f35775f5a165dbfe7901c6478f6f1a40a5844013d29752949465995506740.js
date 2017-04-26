/*!
 * Start Bootstrap - Agency Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

$('.team-member.trainer-member .image').hover(function() {
  $(this).find('.primary-image').hide();
  $(this).find('.secondary-image').show();
});

$('.team-member.trainer-member .image').on('mouseleave', function() {
  $(this).find('.primary-image').show();
  $(this).find('.secondary-image').hide();
});

$('.team-member.trainer-member .image').on('click touch tap', function() {
  var primaryVisible = $(this).find('.primary-image').is(':visible');
  if (primaryVisible) {
    $(this).find('.primary-image').hide();
    $(this).find('.secondary-image').show();
  } else {
    $(this).find('.primary-image').show();
    $(this).find('.secondary-image').hide();
  }
});
