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
        UserID    : Integer;
        FirstName : String(40);
        LastName  : String(40);
        Email     : Common.Email;
        Phone     : Common.PhoneNumber;
        //Association with Categories Table - Farward Navigation
        //As per Design, Users GUID will connect with Primary key (NODE_KEY) of Categories table
        CatRel    : Association to one Categories;
    }

    //Child Table
    entity Categories : managed {
        UserID       : Integer;
        CategoryName : String(80);
        //<Field Name> : <Assocation To one/many> <Parent Table> <on> <Current Tabl Field Name.Parent Table Association Name> <= $self>
        UsersRel     : Association to one Users
                           on UsersRel.CatRel = $self; //Backward Relationship to Employee
    }
}
