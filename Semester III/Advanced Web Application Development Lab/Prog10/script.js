angular.module('studentApp', [])
.controller('studentCtrl', ['$scope', function($scope) {
    $scope.student = {};
    $scope.action = 'View All Records';
    $scope.records = [];
    $scope.message = '';
    // Simulated database
    $scope.db = [
        { rno: '1', na: 'Alice', m1: 80, m2: 90, result: 'Pass' },
        { rno: '2', na: 'Bob', m1: 60, m2: 30, result: 'Fail' }
    ];

    $scope.handleAction = function() {
        $scope.message = '';
        $scope.records = [];
        if ($scope.action === 'View All Records') {
            $scope.records = angular.copy($scope.db);
        } else if ($scope.action === 'View a Specific Record') {
            var found = $scope.db.filter(function(rec) {
                return rec.rno === $scope.student.rno;
            });
            if (found.length) {
                $scope.records = found;
            } else {
                $scope.message = 'No record found for Roll No: ' + $scope.student.rno;
            }
        } else if ($scope.action === 'Insert Record') {
            if (!$scope.student.rno || !$scope.student.na || isNaN(Number($scope.student.m1)) || isNaN(Number($scope.student.m2))) {
                $scope.message = 'All fields are required for insertion.';
                return;
            }
            // Check for duplicate
            var exists = $scope.db.some(function(rec) { return rec.rno === $scope.student.rno; });
            if (exists) {
                $scope.message = 'Error: Duplicate Roll Number. Record already exists.';
                return;
            }
            var resultValue = (Number($scope.student.m1) >= 35 && Number($scope.student.m2) >= 35) ? 'Pass' : 'Fail';
            $scope.db.push({
                rno: $scope.student.rno,
                na: $scope.student.na,
                m1: Number($scope.student.m1),
                m2: Number($scope.student.m2),
                result: resultValue
            });
            $scope.message = 'Record Inserted Successfully';
            $scope.student = {};
        }
    };
}]); 