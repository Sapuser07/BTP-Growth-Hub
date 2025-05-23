using {
    ODATAService.UserSet       as User
    //ODATAService.CategoriesSet as Categories
} from '../srv/WebService'; //Impport SRV folder file


using from './userset/annotations';


//Make define the list of fields in UI use the annotate anotation
annotate User with @(

    //================Advance Search View======================
    UI.SelectionFields       : [

        //Specify the list of fields
        ID,
        UserID,
        FirstName,
        LastName,
        Email,
        Phone,
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    ],

    //================Result list======================
    UI.LineItem              : [

        //Check with Anubhav
        //Not able to add field from reuse lib
        //Error in screen - Check UI applicaiton
        // {
        //     $Type: 'UI.DataField',
        //     value: ID,  //Provide the relative path, else it will raise an error message
        // },
        {
            $Type: 'UI.DataField',
            Value: UserID,
        },
        {
            $Type: 'UI.DataField',
            Value: FirstName,
        },
        {
            $Type: 'UI.DataField',
            Value: LastName,
        },
        {
            $Type: 'UI.DataField',
            Value: Email,
        },
        {
            $Type: 'UI.DataField',
            Value: Phone,
        },
        {
            $Type: 'UI.DataField',
            Value: Sex,
        },
        {
            $Type      : 'UI.DataField',
            Value      : OverallStatus, //Status - Instead of passing the field name, Pass the return parameter defined in WebService.cds
            Criticality: IconColor
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedAt,
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedBy,
        },
        {
            $Type: 'UI.DataField',
            Value: CatRel.CategoryID, //Fields from association
        },
        {
            $Type: 'UI.DataField',
            Value: CatRel.CategoryName,
        },
    ],

    //================Update Title======================
    UI.HeaderInfo            : {
        TypeName      : 'Expense Tracker',
        //Result view title
        TypeNamePlural: 'Expense Tracker',
        //Result view title in Plural
        Title         : {Value: CatRel.CategoryID, },
        Description   : {Value: CatRel.CategoryName}
    },


    //Create UI facet
    UI.Facets                : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Additional Info',
        Facets: [
            {
                //Default Block
                $Type : 'UI.ReferenceFacet',
                Label : 'More Info',
                Target: '@UI.Identification'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'More Info',
                Target: '@UI.FieldGroup#Categories'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'More Info',
                Target: '@UI.FieldGroup#Expense'
            },
        ],
    }, ],


    UI.Identification        : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
    ],

    UI.FieldGroup#Categories: {
        Label: 'Categories',
        Data : [{
            $Type: 'UI.DataField',
            Value: FirstName,
        }, ],
    },

    UI.FieldGroup#Expense   : {
        Label: 'Status',
        Data : [{
            $Type: 'UI.DataField',
            Value: FirstName,
        }, ],
    }


);
