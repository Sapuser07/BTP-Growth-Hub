sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'btp/users/userset/test/integration/FirstJourney',
		'btp/users/userset/test/integration/pages/UserSetList',
		'btp/users/userset/test/integration/pages/UserSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, UserSetList, UserSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('btp/users/userset') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUserSetList: UserSetList,
					onTheUserSetObjectPage: UserSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);