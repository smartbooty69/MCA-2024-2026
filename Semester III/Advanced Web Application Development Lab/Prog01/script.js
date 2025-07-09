angular.module('myApp', [])
.controller('MainController', ['$scope', function($scope) {
    $scope.items = ['Coffee', 'Tea'];
    $scope.message = '';
    $scope.showNewButton = false;

    $scope.addElement = function() {
        var item = prompt("Enter an item to be added into the list:");
        if (item) {
            $scope.items.push(item);
        }
    };

    $scope.removeElement = function() {
        if ($scope.items.length > 0) {
            $scope.items.pop();
        }
    };

    $scope.removeAllElement = function() {
        $scope.items = [];
    };

    $scope.elementCount = function() {
        $scope.message = 'Number of Elements in the List is ' + $scope.items.length;
    };

    $scope.addButton = function() {
        $scope.showNewButton = true;
    };

    $scope.hello = function() {
        alert("Welcome to JavaScript Programming using AngularJS!");
    };
}]); 