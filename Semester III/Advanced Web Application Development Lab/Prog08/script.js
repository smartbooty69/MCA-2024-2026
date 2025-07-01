var app = angular.module('studentApp', []);
app.controller('studentCtrl', function ($scope) {
    $scope.newStudent = { marks: {} };
    $scope.students = [];
    $scope.enterStudentDetails = function () {
        // Ensure marks object exists
        if (!$scope.newStudent.marks) $scope.newStudent.marks = {};
        $scope.students.push(angular.copy($scope.newStudent));
        $scope.newStudent = { marks: {} };
    };
    $scope.calculateCGPA = function (marks) {
        var s1 = parseFloat(marks.subject1) || 0;
        var s2 = parseFloat(marks.subject2) || 0;
        var s3 = parseFloat(marks.subject3) || 0;
        var averageMarks = (s1 + s2 + s3) / 3;
        return (averageMarks / 10).toFixed(2);
    };
}); 