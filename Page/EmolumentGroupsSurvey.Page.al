page 50153 "Emolument Groups Survey"
{
    CardPageID = "Emolument Group Header";
    Editable = false;
    PageType = List;
    SourceTable = "Payroll-Emolument Header";
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
                field("Search Name"; Rec."Search Name")
                {
                }
                field(Grade; Rec.Grade)
                {
                }
                field(Step; Rec.Step)
                {
                }
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                }
                field("Employee Name"; Rec.GetEmpName(Rec."No."))
                {
                    Caption = 'Employee Name';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Group")
            {
                Caption = '&Group';
                action("&Card")
                {
                    Caption = '&Card';
                    Image = EditLines;
                    RunObject = Page 50152;
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }

    var
        EmpGrp: Record 50009;
}

