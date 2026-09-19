page 50227 "Stock Capitalisation"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Stock Capitalisation";
    SourceTableView = WHERE("Stock Capitalisation Approval" = FILTER(false),
                            Processed = FILTER(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Caption = 'Transaction Date';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    Caption = 'Global Dimension 1';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Caption = 'Global Dimension 2';
                }
                field("Item No."; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    Caption = 'Item Description';
                }
                field(Location; Rec.Location)
                {
                    Caption = 'Location';
                }
                field("Entry No"; Rec."Entry No")
                {
                    Caption = 'Entry No';
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                    Caption = 'Chasis No.';
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Caption = 'Engine No.';
                }
                field(Color; Rec.Color)
                {
                    Caption = 'Color';
                }
                field("Key No."; Rec."Key No.")
                {
                    Caption = 'Key No.';
                }
                field("Item Cost (LCY)"; Rec."Item Cost (LCY)")
                {
                }
                field("Asset No."; Rec."Asset No.")
                {
                    Caption = 'Asset No.';
                }
                field("Asset Description"; Rec."Asset Description")
                {
                    Caption = 'Asset Description';
                }
                field("Asset Aquisition Date"; Rec."Asset Aquisition Date")
                {
                    Caption = 'Asset Aquisition Date';
                }
                field("Stock Capitalisation Account"; Rec."Stock Capitalisation Account")
                {
                    Caption = 'Stock Capitalisation Account';
                }
                field("Stock Capitalisation Approval"; Rec."Stock Capitalisation Approval")
                {
                    Caption = 'Stock Capitalisation Approval';
                }
                field("Capitalisation Approved By"; Rec."Capitalisation Approved By")
                {
                    Caption = 'Capitalisation Approved By';
                }
                field("Capitalisation Approved Time"; Rec."Capitalisation Approved Time")
                {
                    Caption = 'Capitalisation Approved Time';
                }
                field("Capitalisation Approved Date"; Rec."Capitalisation Approved Date")
                {
                    Caption = 'Capitalisation Approved Date';
                }
                field(Processed; Rec.Processed)
                {
                    Caption = 'Processed';
                }
                field("Process date"; Rec."Process date")
                {
                    Caption = 'Process date';
                }
                field("Process Time"; Rec."Process Time")
                {
                    Caption = 'Process Time';
                }
                field("Process By"; Rec."Process By")
                {
                    Caption = 'Process By';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Stock Capitalization")
            {
                Caption = 'Stock Capitalization';
                RunObject = Report 50550;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CustOnAfterGetCurrRecord;
    end;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec.Processed THEN
            CurrPage.EDITABLE(FALSE) ELSE
            CurrPage.EDITABLE(TRUE);
    end;
}

