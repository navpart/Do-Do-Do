page 50055 "Leave Roster List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Leave Roster";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Leave Category"; Rec."Leave Category")
                {
                }
                field("Entry no"; Rec."Entry no")
                {
                }
                field(LeaveDate; Rec.LeaveDate)
                {
                }
                field(LeavePlanNo; Rec.LeavePlanNo)
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

