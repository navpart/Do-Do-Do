page 70142 "LPO List"
{
    ApplicationArea = All;
    CardPageID = "LPO Card";
    PageType = List;
    Editable = false;
    SourceTable = LPO;
    SourceTableView = where("Purch.Requisition No" = filter('TPR*'));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("LPO No."; Rec."LPO No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Vat amount"; Rec."Vat amount")
                {
                }
                field(Vatable; Rec.Vatable)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Purch.Requisition No"; Rec."Purch.Requisition No")
                {
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Purch.Requisition Date"; Rec."Purch.Requisition Date")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Capex-Opex No."; Rec."Capex-Opex No.")
                {
                }
                field("Voucher Raised"; Rec."Voucher Raised")
                {
                }
            }
        }
    }

    actions
    {
    }
}

