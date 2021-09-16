/*global $*/
/*global appendRecipe*/
/*global appendErrMsgToHTML*/


     const search_list = $('.recipe-results');

     function appendRecipe(recipe) {
       var html = `<p>
         <a href="recipes/${recipe.id}" data-method="get"> ${recipe.name}</a>
         </p>`
       search_list.append(html);
     }

       function appendErrMsgToHTML(msg) {
         var html = `<p>${ msg }<p>`
         search_list.append(html);
       }



$(function () {
  $('.text-field').on('keyup', function () {
    var name = $.trim($(this).val());
    console.log(name);

    $.ajax({
      type: 'GET',
      url: '/search',
      data:  { keyword: name },
      dataType: 'json'
    })
    .done(function(recipes) {
      if (name.length === 0) {
        $('.recipe-results').empty();
        }

        else if (name.length !== 0) {
          $('.recipe-results').empty();
            recipes.forEach(function(recipe) {
              appendRecipe(recipe);
              console.log(recipe);
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