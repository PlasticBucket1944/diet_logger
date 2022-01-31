$(function() {
    // 追加ボタンクリック時イベント
    $(document).on('click', '.add-btn', function () {
        // 更新用のinputが存在していたら削除
        if($('#update-input').length) {
            $('#update-input').remove();
        };

        // モーダルフォームをクリア
        $('#update-form').attr('action', '/calorie_intakes');
        $('#calorie_intake_name').val('');
        $('#calorie_intake_date').val('');
        $('#calorie_intake_amount').val('');

        $('.js-modal').fadeIn();
        return false; // aタグを無効にする
    });

    // 編集ボタンクリック時イベント
    $(document).on('click', '#calories-table .edit-btn', function () {
        // 選択されたデータを取得
        const id     = $(this).parent().parent().data('value');
        const name   = $(this).parent().parent().find('.calorie-name').data('value');
        const date   = $(this).parent().parent().find('.calorie-date').data('value');
        const amount = $(this).parent().parent().find('.calorie-amount').data('value');

        // 更新用のinputが存在していなかったらfromに追加
        if(!$('#update-input').length) {
            $('#update-form').prepend('<input id="update-input" type="hidden" name="_method" value="patch">');
        };

        // データをモーダルフォームにセット
        $('#update-form').attr('action', '/calorie_intakes/' + id);
        $('#calorie_intake_name').val(name);
        $('#calorie_intake_date').val(date);
        $('#calorie_intake_amount').val(amount);

        $('.js-modal').fadeIn();
        return false; // aタグを無効にする
    });

    // クローズボタン、またはモーダル背景クリック時イベント
    $(document).on('click', '.js-modal-close', function () {
        $('.js-modal').fadeOut();
        return false; // aタグを無効にする
    });
});