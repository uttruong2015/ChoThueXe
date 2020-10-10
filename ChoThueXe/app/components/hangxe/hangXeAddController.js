(function (app) {
    app.controller('hangXeAddController', hangXeAddController);
    hangXeAddController.$inject = ['apiService', '$scope', 'notificationService','$state','commonService'];
    function hangXeAddController(apiService, $scope, notificationService, $state, commonService) {
        $scope.productCategory = {
        }
        $scope.hangXe = [];
        $scope.AddProductCategory = AddProductCategory;
        function AddProductCategory() {
            apiService.post('/api/hangxe/create', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã thêm xe thành công');
                    $state.go('hangxe');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Thêm không thành công');
                });
        }
       
    }
})(angular.module('uStora.hangxe'));