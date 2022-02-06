$(function() {
    let selectedDay = $('.today'); // 選択日保持用変数(初期値は当日)
    selectedDay.attr('id', 'selected-day');
    // 一覧を更新
    getAndAddCalorieData();

    // 表示月の日付クリック時イベント
    $('.current-month').click(function() {
        // 選択日のIDを選択された日付に付け替える
        selectedDay.removeAttr('id');
        selectedDay = $(this).attr('id', 'selected-day');
        // 一覧を更新
        getAndAddCalorieData();
    });

    // 選択されている日付のカロリーデータを取得し、一覧に追加
    function getAndAddCalorieData() {
        // 選択されている日付を送信
        const sendData = $('#selected-day .hidden-date').data('value');

        // 選択された日のカロリーデータを取得し一覧に追加
        $.ajax({
            type: 'GET',
            url: '/calorie_intakes',
            data: { selected_day: sendData },
            dataType: 'json'
        })
        .done(function(calories) {
            $('#calories-table').empty(); // 一覧をリセット
            calories.forEach(function(calorie){
                addCalorieData(calorie);
            });
        })
        .fail(function() {
            alert('データの取得に失敗しました。');
            location.reload();
        });
    }

    // カロリーデータを一覧に追加
    function addCalorieData(calorie) {
        const html =   `<tr class="calorie-id" data-value="${ calorie.id }">
                            <td class="calorie-name" data-value="${ calorie.name }"> ${ calorie.name } </td>
                            <td class="calorie-date" data-value="${ calorie.date }"> ${ calorie.date } </td>
                            <td class="calorie-amount" data-value="${ calorie.amount }"> ${ calorie.amount } </td>
                            <td> <a class="edit-btn" href="">編集</a> </td>
                            <td> <a class="del-btn" data-confirm="本当に削除してよろしいでしょうか？" rel="nofollow" data-method="delete" href="/calorie_intakes/${ calorie.id }">削除</a> </td>
                        </tr>`;

        $('#calories-table').append(html);
    }
});