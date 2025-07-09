angular.module('myApp', [])
.controller('MainController', ['$scope', function($scope) {
    $scope.dob = '';
    $scope.cdate = '';
    $scope.currentAge = '';

    $scope.getDOB = function() {
        if (!$scope.dob || !$scope.cdate) {
            alert('Please enter both Date of Birth and Current Date.');
            return;
        }
        var dob = new Date($scope.dob);
        var currentDate = new Date($scope.cdate);
        if (dob > currentDate) {
            alert('Date of Birth cannot be after Current Date.');
            return;
        }
        var years = currentDate.getFullYear() - dob.getFullYear();
        var months = currentDate.getMonth() - dob.getMonth();
        var days = currentDate.getDate() - dob.getDate();
        if (days < 0) {
            months--;
            var prevMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 0);
            days += prevMonth.getDate();
        }
        if (months < 0) {
            years--;
            months += 12;
        }
        $scope.currentAge = 'Your age is ' + years + ' years, ' + months + ' months and ' + days + ' days.';
    };
}]); 