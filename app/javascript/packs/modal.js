$(function() {
    // 編集ボタンクリック時イベント
    $(document).on('click', '#calories-table .edit-btn', function () {
        // 選択されたデータを取得
        const id     = $(this).parent().parent().data('value');
        const name   = $(this).parent().parent().find('.calorie-name').data('value');
        const date   = $(this).parent().parent().find('.calorie-date').data('value');
        const amount = $(this).parent().parent().find('.calorie-amount').data('value');

        // データをモーダルフォームにセット
        $('#update-form').attr('action', '/calorie_intakes/' + id);
        $('#calorie_intake_name').val(name);
        $('#calorie_intake_date').val(date);
        $('#calorie_intake_amount').val(amount);

        $('.js-modal').fadeIn();
        return false; // aタグを無効にする
    });
    $(document).on('click', '.js-modal-close', function () {
        console.log('fire');
        $('.js-modal').fadeOut();
        return false; // aタグを無効にする
    });
});