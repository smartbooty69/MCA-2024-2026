var app = angular.module('calculatorApp', []);
app.controller('calculatorCtrl', function ($scope) {
    $scope.display = "";
    $scope.appendToDisplay = function (value) {
        $scope.display += value;
    };
    $scope.clearDisplay = function () {
        $scope.display = "";
    };
    $scope.performOperation = function (operator) {
        $scope.appendToDisplay(operator);
    };
    $scope.calculateResult = function () {
        try {
            $scope.display = eval($scope.display).toString();
        } catch (error) {
            $scope.display = 'Error';
        }
    };
});
