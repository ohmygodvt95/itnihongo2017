// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap.min
//= require sticky-kit/jquery.sticky-kit.min
//= require masonry/dist/masonry.pkgd.min
//= require toastr
//= require_tree .
//= require_self

var preloader = $('#spinner-wrapper');
$(window).on('load', function() {
  var preloaderFadeOutTime = 2000;

  function hidePreloader() {
    preloader.fadeOut(preloaderFadeOutTime);
  }
  hidePreloader();
});

jQuery(document).ready(function($) {
  $("#sidebar").stick_in_parent({parent: '.wrapper',  offset_top: 80});
});
