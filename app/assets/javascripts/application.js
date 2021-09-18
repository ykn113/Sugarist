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
//= require jquery
//= require skippr.min.js
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require trix
//= require jquery_ujs
//= require_tree .
//= jquery.raty.js
//= require Chart.bundle
//= require chartkick


// Top Slide
$(document).on('turbolinks:load', function () {
  $("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類('div' or 'img')
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 3000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});

// Home Slide
$(document).on('turbolinks:load', function() {
  $(".item-image-slide").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: true,

      responsive:[{
        breakpoint: 480,
        settings:{
          slidesToShow: 1,
          slidesToScroll: 1,
          autoplay: true,
          autoplaySpeed: 3000,
        }
      }],
  });
});

// トップに戻る
$(document).on('turbolinks:load', function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// Navbar日本語化
$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-home').hover(function(){
  oldtext = $(this).text();
    $(this).text("ホーム");
  }, function(){
    $(this).text(oldtext)
  });
});

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-recipe').hover(function(){
  oldtext = $(this).text();
      $(this).text("レシピ一覧");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-newpost').hover(function(){
  oldtext = $(this).text();
      $(this).text("レシピ作成");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-mypage').hover(function(){
  oldtext = $(this).text();
      $(this).text("マイページ");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-signout').hover(function(){
  oldtext = $(this).text();
      $(this).text("ログアウト");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-about').hover(function(){
  oldtext = $(this).text();
      $(this).text("アバウト");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-signup').hover(function(){
  oldtext = $(this).text();
      $(this).text("新規登録");
  }, function(){
      $(this).text(oldtext)
  });
})

$(document).on('turbolinks:load', function() {
  var oldtext;
  $('.nav-signin').hover(function(){
  oldtext = $(this).text();
      $(this).text("ログイン");
  }, function(){
      $(this).text(oldtext)
  });
})