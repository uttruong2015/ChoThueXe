(function (app) {
    app.controller('phieuDangKyAddController', phieuDangKyAddController);
    phieuDangKyAddController.$inject = ['apiService', '$scope', 'notificationService','$state','commonService'];
    function phieuDangKyAddController(apiService, $scope, notificationService, $state, commonService) {
        $scope.Ngaydukien = new Date();
        $scope.Manv = $scope.authentication.userName;
        $scope.AddProductCategory = AddProductCategory;
        $scope.layTaCaLich = layTaCaLich;
        $scope.DanhSachNgay;
        $scope.MangMoi = [];
        $scope.luuLapLich = [];

        function AddProductCategory() {
            angular.forEach($scope.DanhSachNgay, function (item) {
                var ngaygio = $scope.thang + "-" + item;
                item = moment(ngaygio).format('MM-DD-yyyy')
                const newArr = $scope.luuLapLich.map(e => ({ ...e, Ngaydukien: item }))
                $scope.MangMoi.push(newArr);
            })
            apiService.post('/api/laplichxe/create', $scope.MangMoi,
                function (result) {
                    notificationService.displaySuccess('Đã thêm lịch thành công');
                    $state.go('laplich');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Thêm không thành công');
                });
        }

        function layTatCaXe() {
            apiService.get('/api/hangxe/gophangxevaxe', null,
                function (result) {
                    $scope.tatCaXe = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        $scope.check = function (gio, sttxe, checked) {
            var idx = $scope.luuLapLich.findIndex(x => x.gio === gio && x.Sttxe === sttxe);
            if (idx >= 0 && !checked) {
                $scope.luuLapLich.splice(idx, 1);
            }
            if (idx < 0 && checked) {
                $scope.luuLapLich.push({ Ngaydukien: $scope.Ngaydukien, gio: gio, Manv: $scope.Manv, Sttxe: sttxe, Tugio: gio, Dengio: gio + 1 });
            }
        };
        $scope.danhsachcheckbox = [];
        for (var i = 7; i <= 19; i++) {
            $scope.danhsachcheckbox.push(i)
        }

        const getDaysByMonth = (month) => {
            const daysInMonth = moment(month).daysInMonth();
            return Array.from({ length: daysInMonth }, (v, k) => k + 1)
        };
        $scope.capnhatthang = function () {
            $scope.myMonth = moment($scope.thang);
        }

        $scope.CapNhatNgay = function () {
            $scope.thang = moment($scope.thang).format('yyyy-MM');

            if ($scope.myArrayOfDates.length > 0) {
                var newArr = $scope.myArrayOfDates.map(e => e = moment(e).format('DD'))
                $scope.DanhSachNgay = newArr;
                $scope.NgayDaChon = newArr;
                $('#myModal').modal('hide');//ẩn modal
            }
            else {
                $scope.DanhSachNgay = getDaysByMonth($scope.thang);
            }
        }


        function layTaCaLich() {
            var config = {
                params: {
                    ngaydukien: $scope.luachonngay
                }
            }
            apiService.get('/api/laplichxe/laylichtheongay', config,
                function (result) {
                    //notificationService.displaySuccess('Đã thêm lịch thành công');
                }, function (error) {
                    console.log('Không lấy được dữ liệu');
                });
        }

        layTatCaXe();
        layTaCaLich();
    }
})(angular.module('uStora.phieudangky'));