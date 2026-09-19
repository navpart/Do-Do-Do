page 50012 "Table Lookup Survey."
{
    CardPageID = "Table Lookup Header.";
    Editable = false;
    PageType = List;
    SourceTable = "Payroll-Lookup Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableId; Rec.TableId)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Max. Extract Amount"; Rec."Max. Extract Amount")
                {
                }
                field("Min. Extract Amount"; Rec."Min. Extract Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

