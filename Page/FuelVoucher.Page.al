page 50165 "Fuel Voucher"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE(Issue = filter(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Voucher No."; Rec."Voucher No.")
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Voucher Description"; Rec.Description)
                {
                }
                field("Item Description"; Item.Description)
                {
                    Caption = 'Item Description';
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                }
                field("Asset Code"; Rec."Asset Code")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Description; FA.Description)
                {
                    Caption = 'Asset Description';
                    Editable = false;
                }
                field("Fuel Code"; Rec."Fuel Code")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("New Vehicle"; Rec."New Vehicle")
                {
                }
                field("Cost Amount in G/L"; Rec."Cost Amount in G/L")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Qty Requested"; Rec."Qty Requested")
                {
                }
                field("Qty Approved"; Rec."Qty Approved")
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
                field(Issue; Rec.Issue)
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
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        IF NOT CONFIRM(Text100, FALSE) THEN
                            ERROR('Action aborted!');

                        Rec.TESTFIELD("Item No.");
                        Rec.TESTFIELD("Asset Code");
                        Rec.TESTFIELD("Fuel Code");
                        Rec.TESTFIELD("Qty Issued");

                        Item.GET(Rec."Item No.");
                        FA.GET(Rec."Asset Code");
                        GenPostSetup.GET('', Item."Gen. Prod. Posting Group");
                        FADeprBk.SETRANGE(FADeprBk."FA No.", FA."No.");
                        FADeprBk.FINDFIRST;

                        //post item
                        ItemJnlLine."Journal Template Name" := 'ITEM';
                        //ItemJnlLine."Journal Batch Name" := 'FUEL';
                        ItemJnlLine."Line No." := 10000;
                        ItemJnlLine.VALIDATE("Item No.", Rec."Item No.");
                        ItemJnlLine."Posting Date" := TODAY;
                        ItemJnlLine.Description := Rec.Description;
                        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
                        ItemJnlLine."Document No." := Rec."Voucher No.";
                        ItemJnlLine."Location Code" := Rec.Location;
                        ItemJnlLine.VALIDATE(Quantity, Rec."Qty Issued");
                        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
                        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                        ItemJnlPost.RUN(ItemJnlLine);

                        //post maintenance
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        //GenJnlLine."Journal Batch Name" := 'FUEL';
                        GenJnlLine."Line No." := 10000;
                        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Fixed Asset";
                        GenJnlLine.VALIDATE("Account No.", Rec."Asset Code");
                        GenJnlLine."Posting Date" := TODAY;
                        GenJnlLine."FA Posting Date" := TODAY;
                        GenJnlLine."Document No." := Rec."Voucher No.";
                        GenJnlLine.Description := Rec.Description;
                        GenJnlLine.Amount := Item."Unit Cost" * Rec."Qty Issued";
                        GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::Maintenance;
                        GenJnlLine."Depreciation Book Code" := FADeprBk."Depreciation Book Code";
                        GenJnlLine."Maintenance Code" := Rec."Fuel Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                        GenJnlLine.VALIDATE("Bal. Account No.", GenPostSetup."Inventory Adjmt. Account");
                        //GenJnlLine."Gen. Posting Type" := 0;
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlPost.RUN(GenJnlLine);

                        //update voucher as posted
                        Rec.Posted := TRUE;
                        Rec.MODIFY;
                        CurrPage.UPDATE(FALSE);
                        MESSAGE(Text101);
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

    trigger OnAfterGetRecord()
    begin
        IF Item.GET(Rec."Item No.") THEN;
        IF FA.GET(Rec."Asset Code") THEN;
    end;

    var
        Item: Record 27;
        FA: Record 5600;
        FADeprBk: Record 5612;
        ItemJnlLine: Record 83;
        GenJnlLine: Record 81;
        GenPostSetup: Record 252;
        ItemJnlPost: Codeunit 22;
        Text100: Label 'Do you want to Post Voucher?';
        GenJnlPost: Codeunit 12;
        Text101: Label 'Voucher successfully posted';
        FuelVoucherR: Report 50255;
}

