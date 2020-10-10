(function (app) {
    app.controller('xeEditController', xeEditController);
    xeEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams','commonService'];
    function xeEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.productCategory = {
        }
        $scope.flatFolders = [];
        $scope.loadProductCategoryDetail = loadProductCategoryDetail;
        $scope.UpdateProductCategory = UpdateProductCategory;
       

      

        function loadProductCategoryDetail() {
            var config = {
                params: {
                    id: $stateParams.id
                }
            }
            apiService.get('/api/xe/getbyid/' , config, function (result) {
                $scope.productCategory = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }
        function UpdateProductCategory() {
            apiService.put('/api/xe/update', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã cập nhật xe số ' + $scope.productCategory.Sttxe + ' thành công');
                    $state.go('xe');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Cập nhật không thành công');
                });
        }

        function layTatCaHangXe() {
            apiService.get('/api/hangxe/getall', null,
                function (result) {
                    $scope.hangXe = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };
        layTatCaHangXe();
        loadProductCategoryDetail();
    }
})(angular.module('uStora.xe'));