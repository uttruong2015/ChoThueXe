
(function (app) {
    'use strict';

    app.service('loginService', ['$http', '$q', 'authenticationService', 'authData', 'apiService', '$interval', 'localStorageService',
        function ($http, $q, authenticationService, authData, apiService, $interval, localStorageService) {
            var userInfo;
            var deferred;
            this.login = function (userName, password) {
                deferred = $q.defer();
                var data = "grant_type=password&username=" + userName + "&password=" + password;
                $http.post('/oauth/token', data, {
                    headers:
                        { 'Content-Type': 'application/x-www-form-urlencoded' }
                }).then(function (response) {
                    var config = {
                        params: {
                            username: userName
                        }
                    };
                    apiService.get('/api/applicationuser/getbyname/', config, function (res) {
                        userInfo = {
                            accessToken: response.data.access_token,
                            userName: res.data.UserName,
                            fullName: res.data.FullName,
                            email: res.data.Email,
                            nameRoles: res.data.Roles,
                            ChucVu: res.data.ChucVu,
                            CoSo: res.data.CoSo,
                            refresh_token: response.data.refresh_token,
                            expires_in: response.data.expires_in,
                        };

                        authenticationService.setTokenInfo(userInfo);
                        authData.authenticationData.IsAuthenticated = true;
                        authData.authenticationData.accessToken = userInfo.accessToken;
                        authData.authenticationData.userName = userInfo.userName;
                        authData.authenticationData.fullName = userInfo.fullName;
                        authData.authenticationData.email = userInfo.email;
                        authData.authenticationData.nameRoles = userInfo.nameRoles;
                        authData.authenticationData.ChucVu = userInfo.ChucVu;
                        authData.authenticationData.CoSo = userInfo.CoSo;
                        authData.authenticationData.refresh_token = userInfo.refresh_token;
                        authData.authenticationData.expires_in = userInfo.expires_in;
                        deferred.resolve(null);

                    }, null);

                }, function (err, status) {
                    initialValue();
                    deferred.resolve(err);
                })
                return deferred.promise;
            };



            this.refreshToken = function () {
                var loginServiceURL = '/oauth/token';
                var deferred = $q.defer();
                var token = localStorageService.get("TokenInfo");
                token = JSON.parse(token);
                var data = "grant_type=refresh_token&refresh_token=" + token.refresh_token + "&client_id=" + token.userName;

                $http.post(loginServiceURL, data).then(function (response) {
                    var config = {
                        params: {
                            username: token.userName
                        }
                    };
                    apiService.get('/api/applicationuser/getbyname/', config, function (res) {
                        userInfo = {
                            accessToken: response.data.access_token,
                            userName: res.data.UserName,
                            fullName: res.data.FullName,
                            email: res.data.Email,
                            nameRoles: res.data.Roles,
                            ChucVu: res.data.ChucVu,
                            CoSo: res.data.CoSo,
                            refresh_token: response.data.refresh_token,
                            expires_in: response.data.expires_in,
                        };

                        authenticationService.setTokenInfo(userInfo);
                        authData.authenticationData.IsAuthenticated = true;
                        authData.authenticationData.accessToken = userInfo.accessToken;
                        authData.authenticationData.userName = userInfo.userName;
                        authData.authenticationData.fullName = userInfo.fullName;
                        authData.authenticationData.email = userInfo.email;
                        authData.authenticationData.nameRoles = userInfo.nameRoles;
                        authData.authenticationData.ChucVu = userInfo.ChucVu;
                        authData.authenticationData.CoSo = userInfo.CoSo;
                        authData.authenticationData.refresh_token = userInfo.refresh_token;
                        authData.authenticationData.expires_in = userInfo.expires_in;
                        deferred.resolve(null);

                    }, null);

                }, function (err, status) {
                    initialValue();
                    deferred.resolve(err);
                })
                return deferred.promise;
            }


            this.logOut = function () {
                apiService.post('/api/account/logout', null, function (response) {
                    authenticationService.removeToken();
                    initialValue();
                }, null);
            };
            function initialValue() {
                authData.authenticationData.IsAuthenticated = false;
                authData.authenticationData.userName = "";
                authData.authenticationData.fullName = "";
                authData.authenticationData.email = "";
                authData.authenticationData.accessToken = "";
                authData.authenticationData.nameRoles = "";
                authData.authenticationData.ChucVu = "";
                authData.authenticationData.CoSo = "";
                authData.authenticationData.refresh_token = "";
                authData.authenticationData.expires_in = "";
            }
        }]);
})(angular.module('uStora.common'));