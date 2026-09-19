page 50046 "MP Budget Entries"
{
    DataCaptionFields = "Employee Grp", "Budget Name";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "MP Budget Entry";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    Editable = false;
                }
                field("Employee Grp"; Rec."Employee Grp")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Employee Count"; Rec."Employee Count")
                {
                    DecimalPlaces = 0 : 0;
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

