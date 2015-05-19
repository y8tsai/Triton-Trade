/*jslint browser: true*/
/*global $, jQuery, alert*/

var main = function () {
    
    'use strict';
    
    var sub = $('.sub-menu'), categories = $('.menu li>a');
    
    /* Hides sub-menu */
    sub.hide();
    
      /* Helps open sub-menu */
    categories.click(function (e) {
        e.preventDefault();
        if (!$(this).hasClass('active')) {
            categories.removeClass('active');
            sub.filter(':visible').slideUp('normal');
            $(this).addClass('active').next().stop(true, true).slideDown('normal');
        } else {
            $(this).removeClass('active');
            $(this).next().stop(true, true).slideUp('normal');
        }
    });

 /*   categories.click(function() {
        categories.removeClass('current');

          /*sub.hide();*/

         /* $(this).addClass('current');

          if ($(this).hasChildNodes()) {
            $(this).children().slideDown('normal');
          }


  });*/



  /* Push the body and the nav over by 285px over */
    $('.icon-menu').click(function () {
        $('.menu').animate({
            left: "0px"
        }, 200);
    });

  /* Then push them back */
    $('.close-button').click(function () {
        $('.menu').animate({
            left: "-260px"
        }, 200);
    });
};
$(document).ready(main);