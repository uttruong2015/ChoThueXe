(function (app) {
    app.controller('hangXeEditController', hangXeEditController);
    hangXeEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams','commonService'];
    function hangXeEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.productCategory = { }
        $scope.loadProductCategoryDetail = loadProductCategoryDetail;
        $scope.UpdateProductCategory = UpdateProductCategory;
       

      

        function loadProductCategoryDetail() {
            var config = {
                params: {
                    id: $stateParams.id
                }
            }
            apiService.get('/api/hangxe/getbyid/' , config, function (result) {
                $scope.productCategory = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }
        function UpdateProductCategory() {
            apiService.put('/api/hangxe/update', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã cập nhật hạng xe mã ' + $scope.productCategory.Mahangxe + ' thành công');
                    $state.go('hangxe');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Cập nhật không thành công');
                });
        }

       
        loadProductCategoryDetail();
    }
})(angular.module('uStora.hangxe'));