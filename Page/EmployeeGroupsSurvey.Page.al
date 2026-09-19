page 50017 "Employee Groups Survey."
{
    CardPageID = "Employee Group Header.";
    Editable = false;
    PageType = List;
    SourceTable = "Payroll-Employee Group Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Rec.Code)
                {
                }
                field("Search Name";Rec. "Search Name")
                {
                }
                field(Grade;Rec. Grade)
                {
                }
                field(Step;Rec. Step)
                {
                }
                field("Posting Group Code";Rec. "Posting Group Code")
                {
                }
                field("Employee Name";Rec.GetEmpName(Rec.Code))
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
                    RunObject = Page 50015;
                    RunPageLink = Code = FIELD (Code);
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }

    var
        EmpGrp: Record 50009;
}

