page 50406 "Document Apprv. List"
{
    PageType = Card;
    SourceTable = "Document Approval";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(group)
            {
                Editable = false;
                field(Date; Rec.Date)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Document)
            {
                Caption = 'Document';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Page 50405;
                //RunPageLink = Field1 = FIELD (No.);
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.GET(USERID);
        Rec.SETRANGE("Pending Person", USERID);
    end;

    var
        UserSetup: Record 91;
}

