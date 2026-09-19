page 70131 "Head of Dept. Appr."
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    PageType = List;
    Editable = false;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(Send = CONST(true),
                            "Head of Department" = FILTER('<> Approved'),
                            Reject = CONST(false),
                            "Document Type" = CONST(Opex));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Opex No.';
                }
                field(Date; Rec.Date)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                }
                field(Vendor; Rec.Vendor)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //UserSetup.GET(USERID);
        //SETFILTER("Department Code",UserSetup.Department);
    end;

    var
        UserSetup: Record 91;
}

