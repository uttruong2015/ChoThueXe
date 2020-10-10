(function (app) {
    app.controller('lapLichListController', lapLichListController);

    lapLichListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox', '$filter']
    function lapLichListController($scope, apiService, notificationService, $ngBootbox, $filter) {
        $scope.productCategories = [];
        $scope.page = 0;
        $scope.pagesCount = 0;
        $scope.loading = true;
        $scope.keyword = '';

        $scope.search = search;

        $scope.deleteProductCategory = deleteProductCategory;

        $scope.selectAll = selectAll;

        $scope.deleteProductCategoryMulti = deleteProductCategoryMulti;

        function deleteProductCategoryMulti() {
            $ngBootbox.confirm('Tất cả dữ liệu đã chọn sẽ bị xóa. Bạn muốn tiếp tục?').then(function () {
              
                var listId = [];
                $.each($scope.selected, function (i, item) {
                    listId.push(item.Maso);
                });
                var config = {
                    params: {
                        selected: JSON.stringify(listId)
                    }
                }
                apiService.del('/api/phieudk/deletemulti', config, function (result) {
                    notificationService.displaySuccess('Xóa thành công ' + result.data + ' bản ghi.');
                    $('#checkAll').prop('checked', false);
                    search();
                }, function (error) {
                    notificationService.displayError('Xóa không thành công');
                });
            });
        }

        $scope.isAll = false;
        function selectAll() {
            if ($scope.isAll === false) {
                angular.forEach($scope.productCategories, function (item) {
                    item.checked = true;
                });
                $scope.isAll = true;
            } else {
                angular.forEach($scope.productCategories, function (item) {
                    item.checked = false;
                });
                $scope.isAll = false;
            }
        }

        $scope.$watch('productCategories', function (n, o) {
            var checked = $filter('filter')(n, { checked: true });

            if (checked.length) {
                $scope.selected = checked;
                $('#btnDelete').removeAttr('disabled');
            }
            else {
                $('#btnDelete').attr('disabled', 'disabled');
            }
        }, true);

        function deleteProductCategory(sttphieu, sttxe, ngaysd, tugio) {
            $ngBootbox.confirm('Bạn chắc chắn muốn xóa bản ghi này?').then(function () {
                var config = {
                    params: {
                        sttphieu: sttphieu,
                        sttxe: sttxe,
                        ngaysd: ngaysd,
                        tugio: tugio,
                    }
                }
                apiService.del('/api/dangkyxe/delete', config, function () {
                    xoaphieudk(sttphieu)
                    notificationService.displaySuccess('Đã xóa thành công.');
                    search();
                }, function () {
                    notificationService.displayWarning('Xóa không thành công!!!');
                })
            });
        }
        function xoaphieudk(id) {
                var config = {
                    params: {
                        id: id,
                    }
                }
                apiService.del('/api/phieudk/delete', config, function () {
                    search();
                }, function () {
                })
        }


        function search() {
            getProductCategories();
        }

        $scope.getProductCategories = getProductCategories;

        function getProductCategories(page) {
            $scope.loading = true;
            page = page || 0;
            var config = {
                params: {
                    page: page,
                    pageSize: 5,
                    filter: $scope.keyword
                }
            }
            apiService.get('/api/phieudk/getlistpaging', config, function (result) {
                $scope.productCategories = result.data.Items;
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.loading = false;
            }, function () {
                console.log('Không có khách hàng nào!!!');
            });
        }
       
        $scope.getProductCategories();
    }
})(angular.module('uStora.laplich'));