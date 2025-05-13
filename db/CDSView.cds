namespace DB.CDSView;

using {
    DB.Master.MasterColl.Users      as users,
    DB.Master.MasterColl.Categories as Categories,
    DB.Master.ExpenseColl.Expense   as Expense
} from './Master';


context UserCollViews {

    define view ![UsersSelection] as
        select from users
        //Mixin Concept -> To enable the Expand feature in ODATA, In BTP Mixin is used.
        mixin {
            UserLazyLoad : Association[ * ] to CategoriesSelection
                               on UserLazyLoad.UserID = $projection.UserID;
        }
        into {
            key ID as ![ID],
                UserID,
                FirstName,
                LastName,
                Email,
                Phone,
                Sex,
                Status,
                UserLazyLoad as ![To_UserHeader]
        };


    define view ![CategoriesSelection] as
        select from Categories
        mixin {
            //View on view
            LazyLoad : Association[ * ] to UsersSelection
                           on LazyLoad.UserID = $projection.UserID;
        }
        into {
            ID,
            UserID,
            CategoryID,
            CategoryName,
            LazyLoad as ![To_CategoryHeader]
        };

}


context ExpensedCollView {

    define view ![ExpensedSelection] as
        select from Expense {
            key ID as ![ID],
                UserID,
                CategoryID,
                Description,
                Amount,
                Date
        };

}
