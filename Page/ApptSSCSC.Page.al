page 50354 "Appt SSC/SC"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Appointment SSC/SC";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("SSC/SC Code"; Rec."SSC/SC Code")
                {
                }
                field("SSC/SC Description"; Rec."SSC/SC Description")
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
                field(Applied; Rec.Applied)
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Range From"; Rec."Range From")
                {
                }
                field("Range To"; Rec."Range To")
                {
                }
                field("C/I No"; Rec."C/I No")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        ServItem: Record 5940;
        CusRec: Record 18;
}

