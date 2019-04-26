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

$(document).ready(function() {
  var container = $('.zoom-card-container').filter(function(index) {
    return $($('.zoom-card-container')[index]).css('display').toLowerCase() == 'block';
  });
  if (container.hasClass('large')) {
    $('.zoom-btn-sm').toggleClass('scale-out');
    $('.zoom-card').css('background-color', '#bc2a8d');
    container.find('#instagram-content').toggleClass('scale-out');
  }
});

$('#zoomBtn').click(function() {
  $('.zoom-btn-sm').toggleClass('scale-out');
  if (!$('.zoom-card').hasClass('scale-out')) {
    $('.zoom-card').toggleClass('scale-out');
  }

  var container = $('.zoom-card-container').filter(function(index) {
    return $($('.zoom-card-container')[index]).css('display').toLowerCase() == 'block';
  });
  container.find('#twitter-content').addClass('scale-out');
  container.find('#instagram-content').addClass('scale-out');
  container.find('#facebook-content').addClass('scale-out');
});
 
$('.zoom-btn-sm').click(function() {
  var btn = $(this);
  var card = $('.zoom-card');

  var container = $('.zoom-card-container').filter(function(index) {
    return $($('.zoom-card-container')[index]).css('display').toLowerCase() == 'block';
  });

  var twitterContent = container.find('#twitter-content');
  var instagramContent = container.find('#instagram-content');
  var facebookContent = container.find('#facebook-content');

  if (btn.hasClass('zoom-btn-instagram')) {
    twitterContent.addClass('scale-out');
    facebookContent.addClass('scale-out');
    instagramContent.toggleClass('scale-out');
    card.css('background-color', '#bc2a8d');
  } else if (btn.hasClass('zoom-btn-twitter')) {
    instagramContent.addClass('scale-out');
    facebookContent.addClass('scale-out');
    twitterContent.toggleClass('scale-out');
    card.css('background-color', '#1da1f2');
  } else if (btn.hasClass('zoom-btn-facebook')) {
    twitterContent.addClass('scale-out');
    instagramContent.addClass('scale-out');
    facebookContent.toggleClass('scale-out');
    card.css('background-color', '#3b5998');
  } else {
    twitterContent.addClass('scale-out');
    instagramContent.addClass('scale-out');
    facebookContent.addClass('scale-out');
    $('.zoom-card').toggleClass('scale-out');
    card.css('background-color', '#7b1fa2');
  }
});
