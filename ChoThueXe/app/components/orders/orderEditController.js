(function (app) {
    app.controller('orderEditController', orderEditController);
    orderEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];
    function orderEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.PaymentStatus = 2;
        $scope.isTracTrade = false;
        $scope.isDone = false;
        $scope.checkTractrade = checkTractrade;


        function checkTractrade() {
            if ($scope.isTracTrade === false) {
        
            } else {
                $scope.PaymentStatus = 1;
                $scope.order.PaymentStatus = 1;
            }
        }

        $scope.checkDone = checkDone;
  
        function checkDone() {
            if ($scope.isDone === false) {

            } else {
                $scope.PaymentStatus = 2;
                $scope.order.PaymentStatus = 2;
            }
        }

        $scope.order = {
            UpdatedDate: new Date()
        }
        $scope.loadOrderDetail = loadOrderDetail;
        $scope.UpdateOrder = UpdateOrder;

        function loadOrderDetail() {

            apiService.get('/api/order/getbyid/' + $stateParams.id, null, function (result) {
                $scope.order = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateOrder() {
            $scope.order.PaymentStatus = 2;
            apiService.put('/api/order/update', $scope.order,
                function (result) {
                    notificationService.displaySuccess('Đã cập nhật ' + result.data.CustomerName + ' thành công');
                    $state.go('orders');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Cập nhật không thành công');
                });
        }
        loadOrderDetail();
    }
})(angular.module('uStora.orders'));