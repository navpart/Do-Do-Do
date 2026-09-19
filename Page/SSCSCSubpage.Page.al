page 70069 "SSC/SC Subpage"
{
    PageType = ListPart;
    SourceTable = "SSC/SC";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("SSC/SC Code"; Rec."SSC/SC Code")
                {
                }
                field("SSC/SC Date From"; Rec."SSC/SC Date From")
                {
                }
                field("SSC/SC Date To"; Rec."SSC/SC Date To")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("C/I No"; Rec."C/I No")
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(VIS; Rec.VIS)
                {
                }
            }
        }
    }

    actions
    {
    }
}

