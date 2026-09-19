page 50452 "Posted Fuel"
{
    PageType = Card;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE(Issue = Filter(true));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("Voucher No."; Rec."Voucher No.")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Qty Issued"; Rec."Qty Issued")
                {
                }
                field("Issued By"; Rec."Issued By")
                {
                }
                field("Received By"; Rec."Received By")
                {
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                }
                field("Asset Code"; Rec."Asset Code")
                {
                }
                field("Asset Name"; Rec."Asset Name")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nction")
            {
                Caption = 'Fu&nction';
                separator(Control1)
                {
                }
                action(Navigate)
                {
                    Caption = 'Navigate';
                    Image = Navigate;

                    trigger OnAction()
                    begin
                        Rec.Navigate;
                    end;
                }
            }
        }
        area(processing)
        {
            action("P&rint")
            {
                Caption = 'P&rint';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FuelVoucher: Record 50053;
                begin
                    CLEAR(FuelVoucherR);
                    FuelVoucher.SETRANGE(FuelVoucher."Voucher No.", Rec."Voucher No.");
                    FuelVoucherR.SETTABLEVIEW(FuelVoucher);
                    FuelVoucherR.RUNMODAL;
                end;
            }
        }
    }

    var
        FuelVoucherR: Report 50255;
}

