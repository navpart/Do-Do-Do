page 50167 "Posted Fuel Voucher"
{
    PageType = Card;
    SourceTable = "Fuel Vouchers.";
    SourceTableView = WHERE(Posted = filter(true));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(Control1)
            {
                Editable = false;
                field("Voucher No."; Rec."Voucher No.")
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Item No."; Rec."Item No.")
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
                field("FA Description"; FA.Description)
                {
                    Caption = 'Asset Description';
                    Editable = false;
                }
                field("Fuel Code"; Rec."Fuel Code")
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
            }
        }
    }

    actions
    {
        area(processing)
        {
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
}

