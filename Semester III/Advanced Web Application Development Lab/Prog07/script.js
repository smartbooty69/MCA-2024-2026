var app = angular.module('mathApp', []);
app.controller('mathCtrl', function ($scope) {
    $scope.inputNumber = '';
    $scope.result = undefined;
    $scope.calculateFactorial = function () {
        var n = parseInt($scope.inputNumber);
        if (!isNaN(n) && n >= 0) {
            $scope.result = factorial(n);
        } else {
            $scope.result = 'Invalid input';
        }
    };
    $scope.calculateSquare = function () {
        var n = parseFloat($scope.inputNumber);
        if (!isNaN(n)) {
            $scope.result = n * n;
        } else {
            $scope.result = 'Invalid input';
        }
    };
    function factorial(n) {
        if (n === 0 || n === 1) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}); 