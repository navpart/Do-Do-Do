page 50450 "Fuel Fixed Asset"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE("Fixed Asset" = Filter(true), Issue = filter(false));

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
                    Editable = true;
                }
                field(Location; Rec.Location)
                {
                }
                field("Asset Code"; Rec."Asset Code")
                {
                }
                field("Asset Name"; Rec."Asset Name")
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
                field("Registration No."; Rec."Registration No.")
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
                    Rec.TESTFIELD("Asset Code");
                    Rec.TESTFIELD(Location);
                    Rec.TESTFIELD("Shortcut Dimension 1 Code");
                    Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    Rec.TESTFIELD("Qty Issued");
                    Rec.TESTFIELD("Issued By");
                    Rec.TESTFIELD("Received By");
                    Rec.TESTFIELD("Receipt Date");
                    Rec.PostFixedAsset;
                    MESSAGE('Fuel for this Asset has been posted!');
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Fixed Asset" := TRUE;
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

