// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_img").change(function(){
    $('#img_prev').removeClass('hidden');
    $('.present_img').remove();
    readURL(this);
  });
});

$(function() {
  $(document).on("ajax:success", ".fav", function(e) {
    if ($('#' + e.detail[0]).hasClass('fa-heart')) {
      $('#' + e.detail[0]).removeClass('fa-heart').addClass('fa-heart-o');
    } else {
  $('#' + e.detail[0]).removeClass('fa-heart-o').addClass('fa-heart');
    }
  })
})

$( document ).on('turbolinks:load', function() {
  var pagetop = $('#page_top');
  pagetop.hide();
  $(window).scroll(function () {
      if ($(this).scrollTop() > 10) {  //100pxスクロールしたら表示
          pagetop.fadeIn();
      } else {
          pagetop.fadeOut();
      }
  });
  pagetop.click(function () {
      $('body,html').animate({
          scrollTop: 0
      }, 800); //0.5秒かけてトップへ移動
      return false;
  });
});
