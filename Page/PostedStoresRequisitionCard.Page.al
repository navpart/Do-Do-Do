page 50209 "Posted Stores Requisition Card"
{
    ApplicationArea = All;
    Editable = false;
    PageType = Card;
    SourceTable = "Stores Requisition Header.";
    SourceTableView = WHERE(Type = FILTER("Posted Issue"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("SIV No."; Rec."SIV No.")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Fixed Assets No."; Rec."Fixed Assets No.")
                {
                }
                field("FA Description"; Rec."FA Description")
                {
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                }
                field("User/ Drivers Name"; Rec."User/ Drivers Name")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("COF No"; Rec."COF No")
                {
                }
            }
            part(SalesReqLines; 50206)
            {
                SubPageLink = "Document No." = FIELD("No."),
                              "Document Type" = FIELD(Type);
            }
            group("Alloy Wheel")
            {
                Caption = 'Alloy Wheel';
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Waybill No."; Rec."Waybill No.")
                {
                    Editable = false;
                }
                field("Waybill Date"; Rec."Waybill Date")
                {
                    Editable = false;
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                }
                field(Description2; Rec.Description2)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print Alloy Rim")
            {
                Caption = 'Print Alloy Rim';
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    StoreReqHeader.SETRANGE(StoreReqHeader."No.", Rec."No.");
                    IF StoreReqHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50385, TRUE, TRUE, StoreReqHeader);
                end;
            }
        }
    }

    var
        StoreReqHeader: Record "Stores Requisition Header.";
}

