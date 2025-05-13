namespace DB.CommonStr;

using { Currency } from '@sap/cds/common';

type PhoneNumber: Integer; //@assert.format : '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
type Email: String(255) ;//@assert.format : '/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/';

//Constant Value
type Gender: String(1) enum{
    Male = 'M';
    Female = 'F';
    Undisclosed = 'U';
}

type AmountT : Decimal(10,2)@(
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit:'CURRENCY_CODE'
);


aspect Amount: {
    CURRENCY: Currency @(title : '{i18n>XCEL_CURR}');
    GROSS_AMOUNT: AmountT @(title : '{i18n>XCEL_GROSS}');
    NET_AMOUNT: AmountT @(title : '{i18n>XCEL_NET}');
    TAX_AMOUNT: AmountT @(title : '{i18n>XCEL_TAX}');
}

