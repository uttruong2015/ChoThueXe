(function (app) {
    app.controller('xeAddController', xeAddController);
    xeAddController.$inject = ['apiService', '$scope', 'notificationService','$state','commonService'];
    function xeAddController(apiService, $scope, notificationService, $state, commonService) {
        $scope.productCategory = {
            
        }
        
        $scope.hangXe = [];
        $scope.AddProductCategory = AddProductCategory;

        

        

        

        function AddProductCategory() {
            apiService.post('/api/xe/create', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã thêm xe thành công');
                    $state.go('xe');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Thêm không thành công');
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
         function layMaXeCuoiCung() {
             apiService.get('/api/xe/laymacuoicung', null,
                function (result) {
                    var str;
                    if (result.data != null) {
                        $scope.maCuoiCung = result.data;
                        str = "" + (parseInt($scope.maCuoiCung.Sttxe) + 1);
                    }
                    else {str = "" + 1;}
                    const pad1 = "000";
                    var ma = pad1.substring(0, pad1.length - str.length) + str;
                    $scope.productCategory.Sttxe = ma;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        
        layMaXeCuoiCung();
        layTatCaHangXe();
    }
})(angular.module('uStora.xe'));