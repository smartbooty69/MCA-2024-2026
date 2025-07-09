angular.module('studentApp', [])
.controller('studentCtrl', ['$scope', function($scope) {
    $scope.student = {};
    $scope.records = [];
    $scope.message = '';
    // Simulated database
    $scope.db = [
        { rno: '1', na: 'Alice', m1: 80, m2: 90, result: 'PASS' },
        { rno: '2', na: 'Bob', m1: 60, m2: 30, result: 'FAIL' }
    ];

    $scope.insertRecord = function() {
        $scope.message = '';
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
        var resultValue = (Number($scope.student.m1) >= 40 && Number($scope.student.m2) >= 40) ? 'PASS' : 'FAIL';
        $scope.db.push({
            rno: $scope.student.rno,
            na: $scope.student.na,
            m1: Number($scope.student.m1),
            m2: Number($scope.student.m2),
            result: resultValue
        });
        $scope.message = 'Record Inserted Successfully';
        $scope.student = {};
        $scope.records = [];
    };

    $scope.updateRecord = function() {
        $scope.message = '';
        if (!$scope.student.rno || !$scope.student.na || isNaN(Number($scope.student.m1)) || isNaN(Number($scope.student.m2))) {
            $scope.message = 'All fields are required for update.';
            return;
        }
        var found = $scope.db.find(function(rec) { return rec.rno === $scope.student.rno; });
        if (!found) {
            $scope.message = 'No record found to update.';
            return;
        }
        found.na = $scope.student.na;
        found.m1 = Number($scope.student.m1);
        found.m2 = Number($scope.student.m2);
        found.result = (found.m1 >= 40 && found.m2 >= 40) ? 'PASS' : 'FAIL';
        $scope.message = 'Record Updated Successfully';
        $scope.student = {};
        $scope.records = [];
    };

    $scope.deleteRecord = function() {
        $scope.message = '';
        if (!$scope.student.rno) {
            $scope.message = 'Roll Number is required for deletion.';
            return;
        }
        var index = $scope.db.findIndex(function(rec) { return rec.rno === $scope.student.rno; });
        if (index === -1) {
            $scope.message = 'No record found to delete.';
            return;
        }
        $scope.db.splice(index, 1);
        $scope.message = 'Record Deleted Successfully';
        $scope.student = {};
        $scope.records = [];
    };

    $scope.viewAll = function() {
        $scope.records = angular.copy($scope.db);
        $scope.message = '';
    };

    $scope.clearForm = function() {
        $scope.student = {};
        $scope.records = [];
        $scope.message = '';
    };
}]); 