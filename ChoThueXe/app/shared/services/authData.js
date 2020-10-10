(function (app) {
    'use strict';
    app.factory('authData', [function () {
        var authDataFactory = {};

        var authentication = {
            IsAuthenticated: false,
            userName: "",
            fullName: "",
            email: "",
            nameRoles: "",
            ChucVu: "",
            CoSo: "",
            refresh_token: "",
            expires_in: ""
        };

        authDataFactory.authenticationData = authentication;

        return authDataFactory;
    }]);
})(angular.module('uStora.common'));