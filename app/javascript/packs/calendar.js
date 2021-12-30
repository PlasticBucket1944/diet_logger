$(function() {
    let selectedDay = $('.today'); // 選択日保持用変数(初期値は当日)
    selectedDay.attr('id', 'selected-day');

    // 表示月の日付クリック時イベント
    $('.current-month').click(function() {
        // 選択日のIDを付け替える
        selectedDay.removeAttr('id');
        selectedDay = $(this).attr('id', 'selected-day');

        // 選択された日付を送信
        const sendData = $('#selected-day .hidden-date').data("value");

        // 選択された日のカロリーデータを取得し一覧に追加
        $.ajax({
            type: 'GET',
            url: '/calorie_intakes',
            data: { selected_day: sendData },
            dataType: 'json'
        })
        .done(function(calories) {
            $("#calories-table").empty(); // 一覧をリセット
            calories.forEach(function(calorie){
                addCalorie(calorie);
            });
        })
        .fail(function() {
            alert('データの取得に失敗しました。');
        });
    });

    // カロリーデータを一覧に追加
    function addCalorie(calorie){
        const html =   `<tr>
                            <td> ${ calorie.id} </td>
                            <td> ${ calorie.name } </td>
                            <td> ${ calorie.date } </td>
                            <td> ${ calorie.amount } </td>
                        </tr>`;

        $("#calories-table").append(html);
    }
});