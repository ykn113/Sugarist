// $(function () {
//   $('.text-field').on('keyup', function () {
//     var title = $.trim($(this).val());
//     console.log(title); // 検索窓の値が取れているか確認
//   });
// });

$(document).on('turbolinks:load', function() {

     var search_list = $('.recipe-results');

     function appendRecipe(recipe) {
       var html = `<div class="recipe-results"><p>
         <a href = "<%= recipe_path (recipe.id) %>" data-method="get"> ${recipe.name}</a>
         </p></div>`
       search_list.append(html);
     }

       function appendErrMsgToHTML(msg) {
         var html = `<div class="name">${ msg }</div>`
         search_list.append(html);
       }
     })



$(function () {
  $('.text_field').on('keyup', function () {
    var title = $.trim($(this).val());
    console.log(title);

    $.ajax({
      type: 'GET', 
      url: '/searches/search', 
      data:  { keyword: name }, 
      dataType: 'json'
    })
    .done(function(recipe) {
      if (name.length === 0) {
        $('.recipe-results').empty();
        }
        
        else if (name.length !== 0) {
          $('.recipe-results').empty();
            name.forEach(function(recipe) {
              appendRecipe(recipe);
            });
          }
          
          else {
            $('.recipe-results').empty();
              appendErrMsgToHTML("一致するレシピがありません");
            }
    })
            
    .fail(function() {
      alert('error');
    });
    
  });
});