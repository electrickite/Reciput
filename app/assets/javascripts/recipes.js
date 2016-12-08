// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var update_recipe_list_order = function(el, route) {
  var updated_order = [],
      recipe_id = $(el).data('recipe-id');

  $(el).find('li').each(function(i) {
    updated_order.push({ id: $(this).data('id'), sequence: i });
  });

  // Send the updated order via ajax
  $.ajax({
    type: 'PUT',
    url: window['Routes'][route](recipe_id),
    data: { order: updated_order }
  });
};

var recipe_ready = function() {
  $('#step-list.sortable').each(function() {
    var self = this;
    Sortable.create(self, {
      onUpdate: function() {
        update_recipe_list_order(self, 'sort_recipe_steps_path');
      }
    });
  });

  $('#ingredient-list.sortable').each(function() {
    var self = this;
    Sortable.create(self, {
      onUpdate: function() {
        update_recipe_list_order(self, 'sort_recipe_ingredients_path');
      }
    });
  });
};

$(document).ready(recipe_ready);
$(document).on('page:load', recipe_ready);
