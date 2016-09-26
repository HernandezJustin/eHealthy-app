(function() {
  'use strict';
  angular.module('app').controller('commentsCtrl', function($scope, $http, $timeout) {
    $scope.setup = function(i) {
      $http.get("/api/v1/comments/"+i+".json").then(function(response) {
        $scope.recipe = response.data;
      });
    };

    $scope.createComment = function(comment, recipe, i) {
    var commentParams = {
      comment_text: comment,
      recipe_id: recipe.id
    };
    $http.post("/api/v1/comments/"+i+".json", commentParams).success(function(response) {
      $scope.recipe = response;
      $scope.createdMessage = response.created;
      $scope.error = null;
      $scope.comment = null;
      $timeout(function() {
        $scope.createdMessage = null;
      }, 1500);
    }).error(function(response) {
      $scope.error = response.error;
      $scope.success = null;
      });
    };
    $scope.showEdit = function(recipe, comment) {
      console.log($scope.recipe.comments)
      if ($scope.recipe.user.email === comment.commenter.email) {
        comment.edit = true;
      }
    };

    $scope.removeEdit = function(comment) {
      comment.edit = false;
    };

    $scope.editComment = function(comment) {
      comment.editable = true;
    };

    $scope.updateComment = function(comment, i) {
      var commentParams = {
        comment_text: comment.comment_text
      };
      $http.patch("/api/v1/comments/' + "+i+" + '.json", commentParams)
      .success(function(response) {
        $scope.framework = response;
        $scope.updatedMessage = response.updated;
        $scope.error = null;
        $scope.comment = null;
        $timeout(function() {
          $scope.updatedMessage = null;
        }, 1500);
      }).error(function(response) {
        $scope.error = response.error;
        $scope.success = null;
      });
    };
  });
})();
