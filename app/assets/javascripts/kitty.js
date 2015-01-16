$(document).ready(function() {

})
// var app = angular.module('app_name', [array of module names]);
// for example - arr_of_module_names = ['ngRoute', 'ng-polymer-elements']

// initiate angular, no extra modules []
var app = angular.module('kitty', ['ngRoute']);

// define a controller inside angular
// args for function refers to modules if you have any
app.controller("PostCtrl", function($scope) {
  // $ here is scope not jquery
  $scope.brand = "Coca-cola";
  $scope.prices = [7.9, 10, 8.5];

  $scope.totalAmount = function(){
     var total = 0;
     for (var i = 0; i < $scope.prices.length; i++) {
        total += ($scope.prices[i]);
      }
     console.log("total is " + total);
     return total;
  }

  $scope.sumOfPrices = $scope.totalAmount();
  // if we user var addPrice = ....
  // then the function will not be available in the view
  // $scope.sumOfPrices = function(){
  //   var output = 0
  //   for (i=0; i<$scope.prices.length; i++) {
  //     output += $scope.prices[i];
  //   }
  //   return output;
  // };

  $scope.addPrice = function() {
    var newItem = parseFloat($scope.newPrice);

    $scope.prices.push(parseFloat($scope.newPrice));
    // data binding, this will update the inputbox
    $scope.newPrice = "";

    // console.log("sum of prices is "+$scope.sumOfPrices);
    $scope.sumOfPrices = $scope.totalAmount();
  }


  console.log($scope);
});