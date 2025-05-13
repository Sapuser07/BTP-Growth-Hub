//Namespaces provide a mechanism for isolating groups of resources, such as an Users table that can exist in multiple namespaces
//Its uniquly Identify in a Project Level
namespace DB.Master;

//Import Reusable Library via Using anotation
using {
    cuid,
    managed
} from '@sap/cds/common';

using {DB.CommonStr as Common} from './CommonStr';


//Context refers to the purpose of the database table and defines its category.
context MasterColl {

    //Define the List of tables with Entity anotation
    entity Users : cuid, managed {
        UserID           : Integer            @(title: '{i18n>User_UserID}');
        FirstName        : String(40)         @(title: '{i18n>User_FirstName}');
        LastName         : String(40)         @(title: '{i18n>User_LastName}');
        Email            : Common.Email       @(title: '{i18n>User_Email}');
        Phone            : Common.PhoneNumber @(title: '{i18n>User_Phone}');
        Status           : String(1)          @(title: '{i18n>}User_Status');
        Sex              : Common.Gender; //Check with Anubhav
        //Association with Categories Table - Farward Navigation
        //As per Design, Users GUID will connect with Primary key (NODE_KEY) of Categories table
 
        //Lazy Load
        Items_Categories : Composition of many Categories
                               on Items_Categories.ID = $self;

    }

    //Child Table
    entity Categories : managed {
            //Lazy Load
        key ID           : Association to Users;
            //Categories Field
            UserID       : Integer    @(title: '{i18n>}');
            CategoryID   : Integer    @(title: '{i18n>}');
            CategoryName : String(80) @(title: '{i18n>}');
    }
}


context ExpenseColl {

    entity Expense : cuid, managed {
        UserID      : Integer        @(title: '{i18n>}Exp_UserID');
        CategoryID  : Integer        @(title: '{i18n>}Exp_CategoryID');
        Description : String(255)    @(title: '{i18n>Exp_Description}');
        Amount      : Common.AmountT @(title: '{i18n>Exp_Amount}');
        Date        : DateTime       @(title: '{i18n>Exp_Date}');
    }
}
