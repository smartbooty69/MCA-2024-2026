var app = angular.module('crudApp', []);
app.controller('crudCtrl', function ($scope) {
    $scope.users = [
        { name: 'Shiv Kumar', email: 'shiv@company.com' },
        { name: 'Iqbal Khan', email: 'iqbal@company.com' }
    ];
    $scope.newUser = {};
    $scope.addUser = function () {
        if ($scope.newUser.name && $scope.newUser.email) {
            $scope.users.push(angular.copy($scope.newUser));
            $scope.newUser = {};
        }
    };
    $scope.editUser = function (user) {
        var editedName = prompt("Edit user's name:", user.name);
        var editedEmail = prompt("Edit user's email:", user.email);
        if (editedName !== null && editedEmail !== null) {
            user.name = editedName;
            user.email = editedEmail;
        }
    };
    $scope.deleteUser = function (user) {
        var confirmDelete = confirm("Are you sure you want to delete this user?");
        if (confirmDelete) {
            var index = $scope.users.indexOf(user);
            $scope.users.splice(index, 1);
        }
    };
}); 