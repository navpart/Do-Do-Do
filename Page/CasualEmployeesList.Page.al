page 50088 "Casual Employees List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Casual Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field("Employee name"; Rec."Employee name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Sex; Rec.Sex)
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Job Code"; Rec."Job Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Date Employed"; Rec."Date Employed")
                {
                }
                field("Leaving Date"; Rec."Leaving Date")
                {
                }
                field("Employee No Filter"; Rec."Employee No Filter")
                {
                }
                field("Job Code Filter"; Rec."Job Code Filter")
                {
                }
                field("Global Dimension 2 Filter"; Rec."Global Dimension 2 Filter")
                {
                }
                field("Date Employed Filter"; Rec."Date Employed Filter")
                {
                }
                field("Leaving Date Filter"; Rec."Leaving Date Filter")
                {
                }
            }
        }
    }

    actions
    {
    }
}

