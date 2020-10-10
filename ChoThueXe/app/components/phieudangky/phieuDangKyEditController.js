(function (app) {
    app.controller('phieuDangKyEditController', phieuDangKyEditController);
    phieuDangKyEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService','$filter'];
    function phieuDangKyEditController(apiService, $scope, notificationService, $state, $stateParams, commonService, $filter) {
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
            apiService.get('/api/phieudk/getbyid/' , config, function (result) {
                $scope.productCategory = result.data;
                loadDangKyXe();
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }
        function loadDangKyXe() {
            var config = {
                params: {
                    sttphieu: $stateParams.id,
                    sttxe: $stateParams.Sttxe,
                    ngaysd: $stateParams.Ngaysd,
                    tugio: $stateParams.Tugio,
                }
            }
            apiService.get('/api/dangkyxe/getbyid/' , config, function (result) {
                $scope.productCategory = { ...$scope.productCategory, ...result.data };
                $scope.productCategory.Ngaysd = $filter('date')(new Date($scope.productCategory.Ngaysd), "yyyy-MM-dd");


            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateDangKyXe() {
            apiService.put('/api/dangkyxe/update', $scope.productCategory,
                function (result) {
                }, function (error) {
                    console.log(error);
                });
        }
        function UpdateProductCategory() {
            apiService.put('/api/phieudk/update', $scope.productCategory,
                function (result) {
                    //UpdateDangKyXe();
                    notificationService.displaySuccess('Đã cập nhật phieu ' + $scope.productCategory.Sttphieu + ' thành công');
                    $state.go('phieudangky');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Cập nhật không thành công');
                });
        }



        function layTatCaKhach() {
            apiService.get('/api/khach/getall', null,
                function (result) {
                    $scope.tatCaKhach = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };
        function layTatCaXe() {
            apiService.get('/api/xe/getall', null,
                function (result) {
                    $scope.tatCaXe = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        layTatCaKhach();
        layTatCaXe();
        loadProductCategoryDetail();
    }
})(angular.module('uStora.phieudangky'));