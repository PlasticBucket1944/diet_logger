$(function() {
    let selectedDay = $('.today'); // 選択日保持用変数
    $(selectedDay).addClass('selected-day');

    // 表示月の日付クリック時イベント
    $('.current-month').click(function() {
        $(selectedDay).removeClass('selected-day');
        $(this).addClass('selected-day');
        selectedDay = $(this);
    });
});