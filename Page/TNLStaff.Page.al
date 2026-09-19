page 50435 "TNL Staff"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Customer";
    SourceTableView = WHERE("No." = FILTER('8*|CT*|IT*|TS*'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    var
        UserSetup: Record "User Setup";
        CustRec: Record "Customer";
}

