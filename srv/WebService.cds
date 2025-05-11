//Service Definition
//------>Note: Service Definition and Service Implementation name must be same.
//Service will Start the Server and create a local host to run the application

using {DB.Master as Master} from '../db/Master';

//@ Path: To specify the full path of the service
service ODATAService @(path: 'ExpensesColl') {

    entity UserSet       as projection on Master.MasterColl.Users;
    entity CategoriesSet as projection on Master.MasterColl.Categories;
    function loadInitials() returns ExpensesSet;

    entity ExpensesSet   as projection on Master.ExpenseColl.Expense
     //Instance Bound Action
        actions {
            action penalty() returns ExpensesSet; //Create a action
        };
}
