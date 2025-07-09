angular.module('arithmeticApp', [])
.controller('arithmeticCtrl', ['$scope', function($scope) {
    $scope.a = null;
    $scope.b = null;
    $scope.result = undefined;

    $scope.calculate = function(operation) {
        var a = parseFloat($scope.a);
        var b = parseFloat($scope.b);
        if (isNaN(a) || isNaN(b)) {
            $scope.result = 'Please enter valid numbers for both a and b.';
            return;
        }
        switch(operation) {
            case 'add':
                $scope.result = a + b;
                break;
            case 'sub':
                $scope.result = a - b;
                break;
            case 'mul':
                $scope.result = a * b;
                break;
            case 'div':
                $scope.result = b !== 0 ? a / b : 'Infinity';
                break;
            default:
                $scope.result = 'Invalid Operation';
        }
    };
}]); 