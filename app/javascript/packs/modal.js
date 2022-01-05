$(function() {
    $('.js-modal-open').on('click',function() {
        $('.js-modal').fadeIn();
        return false; // aタグを無効にする
    });
    $('.js-modal-close').on('click',function() {
        $('.js-modal').fadeOut();
        return false; // aタグを無効にする
    });
});