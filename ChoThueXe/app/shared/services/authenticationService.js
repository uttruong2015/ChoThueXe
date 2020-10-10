(function (app) {
    'use strict';
    app.service('authenticationService', ['authData', '$injector', '$http', '$q', '$window', 'localStorageService', '$interval',
        function (authData, $injector, $http, $q, $window, localStorageService, $interval) {
            var tokenInfo;

            this.setTokenInfo = function (data) {
                tokenInfo = data;
                localStorageService.set("TokenInfo", JSON.stringify(tokenInfo));



            };

            this.getTokenInfo = function () {
                return tokenInfo;
            };




            this.removeToken = function () {
                tokenInfo = null;
                localStorageService.set("TokenInfo", null);
                localStorageService.remove("TokenInfo");
            };

            this.init = function () {
                var tokenInfo = localStorageService.get("TokenInfo");
                if (tokenInfo) {
                    tokenInfo = JSON.parse(tokenInfo);
                    authData.authenticationData.IsAuthenticated = true;
                    authData.authenticationData.userName = tokenInfo.userName;
                    authData.authenticationData.fullName = tokenInfo.fullName;
                    authData.authenticationData.email = tokenInfo.email;
                    authData.authenticationData.accessToken = tokenInfo.accessToken;
                    authData.authenticationData.nameRoles = tokenInfo.nameRoles;
                    authData.authenticationData.ChucVu = tokenInfo.ChucVu;
                    authData.authenticationData.CoSo = tokenInfo.CoSo;
                    authData.authenticationData.refresh_token = tokenInfo.refresh_token;
                    authData.authenticationData.expires_in = tokenInfo.expires_in;
                }
            };

            this.setHeader = function () {
                delete $http.defaults.headers.common['X-Requested-With'];
                if ((authData.authenticationData !== undefined) && (authData.authenticationData.accessToken !== undefined) && (authData.authenticationData.accessToken !== null) && (authData.authenticationData.accessToken !== "")) {
                    $http.defaults.headers.common['Authorization'] = 'Bearer ' + authData.authenticationData.accessToken;
                    $http.defaults.headers.common['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
                }
                else {
                    var stateService = $injector.get('$state');
                    stateService.go('login');
                }
            };
            this.init();
        }
    ]);
})(angular.module('uStora.common'));