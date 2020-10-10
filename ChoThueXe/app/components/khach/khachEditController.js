(function (app) {
    app.controller('khachEditController', khachEditController);
    khachEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams','commonService'];
    function khachEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.productCategory = {
        }
        $scope.loadProductCategoryDetail = loadProductCategoryDetail;
        $scope.UpdateProductCategory = UpdateProductCategory;
        function loadProductCategoryDetail() {
            var config = {
                params: {
                    id: $stateParams.id
                }
            }
            apiService.get('/api/khach/getbyid/' , config, function (result) {
                $scope.productCategory = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }
        function UpdateProductCategory() {
            apiService.put('/api/khach/update', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã cập nhật khách hàng ' + $scope.productCategory.Hotenkhach + ' thành công');
                    $state.go('khach');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Cập nhật không thành công');
                });
        }

        
        loadProductCategoryDetail();
    }
})(angular.module('uStora.khach'));