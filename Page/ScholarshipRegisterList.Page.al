page 50080 "Scholarship Register List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Scholarship Register";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reg No"; Rec."Reg No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Institution Group"; Rec."Institution Group")
                {
                }
                field(Institution; Rec.Institution)
                {
                }
                field("Course Group"; Rec."Course Group")
                {
                }
                field("Course Code"; Rec."Course Code")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Date Authorized"; Rec."Date Authorized")
                {
                }
                field("Amount Authorized"; Rec."Amount Authorized")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Date Last Paid"; Rec."Date Last Paid")
                {
                }
            }
        }
    }

    actions
    {
    }
}

