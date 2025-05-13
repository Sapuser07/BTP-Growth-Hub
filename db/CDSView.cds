namespace DB.CDSView;

using {
    DB.Master.MasterColl.Users      as users,
    DB.Master.MasterColl.Categories as Categories,
    DB.Master.ExpenseColl.Expense   as Expense
} from './Master';


context UserCollViews {

    define view ![UsersSelection] as
        select from users {
            key ID as ![ID],
                UserID,
                FirstName,
                LastName,
                Email,
                Phone,
                Sex,
                Status
        };

    define view ![CategoriesSelection] as
        select from Categories {
            ID,
            UserID,
            CategoryID,
            CategoryName
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
