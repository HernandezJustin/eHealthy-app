(function() {
  'use strict';

  angular.module("app").controller("favoritesCtrl", function($scope, $http, $timeout) {
    $scope.setup = function() {
      $http.get("/api/v1/favorites.json").then(function(response) {
        $scope.recipes = response.data;
      });
    }

    $scope.favorite = function(recipe, i, uid) {
      recipe.favorite = recipe.favorite ? 0 : 1
      console.log(recipe.favorite)
      // prefers to pass numbers/strings in the params instead of booleans
      // 0 is falsey in JS - so set favorite to 0 if 1, 1 if 0
      // Then Rails can handle the params appropriately
      var recipeParams = {
        recipe_id: recipe.id,
        favorite: recipe.favorite,
        user_id: uid
      }
      $http.post('/api/v1/favorites/'+ recipe.id + '.json', recipeParams).then(function(response) {
        recipe.favoriteMessage = response.data.success;
      });
      $timeout(function() {
        recipe.favoriteMessage = null;
      }, 1500)
    }
  });
})();
