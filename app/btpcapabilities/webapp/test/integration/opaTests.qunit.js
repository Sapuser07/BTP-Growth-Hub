sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'btp/app/btpcapabilities/test/integration/FirstJourney',
		'btp/app/btpcapabilities/test/integration/pages/ExpensesSetList',
		'btp/app/btpcapabilities/test/integration/pages/ExpensesSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ExpensesSetList, ExpensesSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('btp/app/btpcapabilities') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheExpensesSetList: ExpensesSetList,
					onTheExpensesSetObjectPage: ExpensesSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);