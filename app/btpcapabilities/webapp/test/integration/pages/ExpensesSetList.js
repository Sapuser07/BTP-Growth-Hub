sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'btp.app.btpcapabilities',
            componentId: 'ExpensesSetList',
            contextPath: '/ExpensesSet'
        },
        CustomPageDefinitions
    );
});