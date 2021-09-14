$(function () {
  $('.text-field').on('keyup', function () {
    var title = $.trim($(this).val());
    console.log(title); // 検索窓の値が取れているか確認
  });
});

$(function () {
  $('.text_field').on('keyup', function () {
    var title = $.trim($(this).val());

    $.ajax({
      type: 'GET', 
      url: '/searches/search', 
      data:  { title: title }, 
      dataType: 'json'
    })
  });
});