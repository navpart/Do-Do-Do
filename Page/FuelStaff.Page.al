page 50451 "Fuel Staff"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE(Staff = Filter(true),
                            Issue = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Voucher No."; Rec."Voucher No.")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                    Caption = 'Fuel Type';
                }
                field(Description; Rec.Description)
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Post")
            {
                Caption = '&Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Transaction Date");
                    Rec.TESTFIELD(Location);
                    Rec.TESTFIELD("Account No.");
                    Rec.TESTFIELD("Shortcut Dimension 1 Code");
                    Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    Rec.TESTFIELD("Qty Issued");
                    Rec.TESTFIELD("Issued By");
                    Rec.TESTFIELD("Received By");
                    Rec.TESTFIELD("Receipt Date");
                    Rec.PostCustomer;
                    MESSAGE('Fuel has been posted!');
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Staff := TRUE;
    end;

    var
        Item: Record 27;
        FA: Record 5600;
        FADeprBk: Record 5612;
        ItemJnlLine: Record 83;
        GenJnlLine: Record 81;
        GenPostSetup: Record 252;
        ItemJnlPost: Codeunit 22;
        GenJnlPost: Codeunit 12;
        FuelVoucherR: Report 50255;
        AssetDescptn: Code[70];
}

