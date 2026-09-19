page 70080 "SSC/SC List"
{
    PageType = List;
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
                field("Line No."; Rec."Line No.")
                {
                }
                field("SSC/SC Date From"; Rec."SSC/SC Date From")
                {
                }
                field("SSC/SC Date To"; Rec."SSC/SC Date To")
                {
                }
                field("Issue Date"; Rec."Issue Date")
                {
                }
                field("SCSC Status"; Rec."SCSC Status")
                {
                }
                field("SSC/SC Description"; Rec."SSC/SC Description")
                {
                }
                field(Applied; Rec.Applied)
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
                field("Range From"; Rec."Range From")
                {
                }
                field("Range To"; Rec."Range To")
                {
                }
                field(VMI; Rec.VMI)
                {
                }
            }
        }
    }

    actions
    {
    }
}

