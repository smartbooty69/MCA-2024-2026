angular.module('myApp', [])
.controller('MainController', ['$scope', function($scope) {
    $scope.showInput = false;
    $scope.showButton = false;
    $scope.showResult = false;
    $scope.number = '';
    $scope.resultMessage = '';

    $scope.createText = function() {
        $scope.showInput = true;
    };

    $scope.createButton = function() {
        $scope.showButton = true;
    };

    $scope.createParagraph = function() {
        $scope.showResult = true;
    };

    $scope.findFactVal = function() {
        var n = parseInt($scope.number);
        if (isNaN(n) || n < 0) {
            alert("Please enter a valid non-negative integer.");
            return;
        }
        var f = $scope.factorial(n);
        $scope.resultMessage = "Factorial Value of " + n + " is " + f;
        $scope.showResult = true;
    };

    $scope.factorial = function(n) {
        if (n === 0 || n === 1) {
            return 1;
        } else {
            return n * $scope.factorial(n - 1);
        }
    };
}]); 