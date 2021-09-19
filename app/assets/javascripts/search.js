/*global $*/
/*global appendRecipe*/
/*global appendErrMsgToHTML*/

// const search_list = $('.recipe-results');

    function appendRecipe(search_list, recipe) {
      var html = `<p><a href="recipes/${recipe.id}" data-method="get"> ${recipe.name}</a></p>`
      search_list.append(html);
    }

      // function appendErrMsgToHTML(msg) {
      //   var html = `<p>${ msg }<p>`
      //   search_list.append(html);
      // }



$(document).on('turbolinks:load', function() {
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
          const search_list = $('.recipe-results');
          $('.recipe-results').empty();
            recipes.forEach(function(recipe) {
              appendRecipe(search_list, recipe)
            });
          }

          else {
            $('.recipe-results').empty();
              appendErrMsgToHTML("一致するレシピがありません");
            }
    })

    .fail(function(error) {
      alert('error');
    });
  });
});