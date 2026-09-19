page 70143 "LPO Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "LPO";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("LPO No.";Rec."LPO No.")
                {
                }
                field("Vendor Name";Rec."Vendor Name")
                {
                }
                field(Address;Rec. Address)
                {
                }
                field(Amount;Rec. Amount)
                {
                }
                field("Vat amount";Rec."Vat amount")
                {
                }
                field(Vatable;Rec. Vatable)
                {

                    trigger OnValidate()
                    begin
                        IF Rec.Vatable = TRUE THEN
                            Rec."Vat amount" := Rec.Amount * 0.075;
                    end;
                }
                field(Description;Rec. Description)
                {
                }
                field("Purch.Requisition No";Rec."Purch.Requisition No")
                {
                }
                field("Payment Terms";Rec."Payment Terms")
                {
                }
                field("Purch.Requisition Date";Rec."Purch.Requisition Date")
                {
                }
                field("No. Series";Rec."No. Series")
                {
                }
                field(Quantity;Rec. Quantity)
                {
                }
                field("Payment term detail";Rec."Payment term detail")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print LPO")
            {
                Caption = 'Print LPO';
                Image = PostPrint;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    LPO.SETRANGE("LPO No.", Rec."LPO No.");
                    IF LPO.FINDFIRST THEN
                        REPORT.RUNMODAL(50446, TRUE, TRUE, LPO);
                end;
            }
        }
    }

    var
        LPO: Record 70010;
}

