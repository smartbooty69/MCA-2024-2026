angular.module('myApp', [])
.controller('MainController', ['$scope', function($scope) {
    $scope.typeFrom = '10';
    $scope.typeTo = '2';
    $scope.inputValue = '0';
    $scope.resultValue = '0';
    $scope.tags = {
        10: "Decimal:",
        2: "Binary:",
        8: "Octal:",
        16: "HexaDecimal:"
    };

    $scope.update = function() {
        // Update input and result labels are handled by AngularJS bindings
        if ($scope.inputValue.trim() === "") {
            $scope.resultValue = "";
            return;
        }
        var num = parseInt($scope.inputValue, parseInt($scope.typeFrom));
        if (isNaN(num)) {
            $scope.resultValue = "Invalid Input";
            return;
        }
        $scope.resultValue = num.toString(parseInt($scope.typeTo)).toUpperCase();
    };

    $scope.reverse = function() {
        if ($scope.resultValue.trim() === "") {
            $scope.inputValue = "";
            return;
        }
        var num = parseInt($scope.resultValue, parseInt($scope.typeTo));
        if (isNaN(num)) {
            $scope.inputValue = "Invalid Input";
            return;
        }
        $scope.inputValue = num.toString(parseInt($scope.typeFrom)).toUpperCase();
    };

    // Initialize UI
    $scope.update();
}]); 