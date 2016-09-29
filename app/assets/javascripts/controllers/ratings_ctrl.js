(function() {
  'use strict';

  angular.module('app').controller('ratingsCtrl', function($scope, $http) {
    $scope.setup = function(i){
      $http.get("/api/v1/reviews/"+i+".json").then(function(response) {
        $scope.recipe = response.data;
        fillStars();
      });
    };
    // $scope.test=function(i){
    //   $http.get("/api/v1/reviews/"+i+".json").then(function(response) {
    //     $scope.recipe = response.data;
    //     console.log(response)
    //   })
    // }
    $scope.rateRecipe = function(recipe, star, i) {

      var favoriteParams = {
        recipe_id: recipe.id,
        rating: star.rating
      };

      $http.post("/api/v1/reviews/"+i+".json", favoriteParams).success(function(response) {
        console.log()
        $scope.recipe.user_rating = response.user_rating;

        fillStars();
      });
    };

    function fillStars() {
      if($scope.recipe.user_rating)
        $scope.recipe.stars.forEach(function(star) {
            star.filled = $scope.recipe.user_rating.rating >= star.rating;
        });
      else{
        $scope.recipe.stars.forEach(function(star){
          star.filled = false;
        })
      }
    }

    $scope.emptyStar = function(recipe, star) {
      recipe.stars.forEach(function(s) {
        var compareValue = $scope.recipe.user_rating ? $scope.recipe.user_rating.rating : 0;
        if (s.rating > compareValue) {
          s.filled = false;
        }
      });
    };

    $scope.fillStar = function(recipe, star) {
      recipe.stars.forEach(function(s) {
        if (s.rating <= star.rating) {
          s.filled = true;
        }
      });
    };
  });
})();
