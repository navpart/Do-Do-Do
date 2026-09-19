page 50234 "Processed Stock Capitalisation"
{
    PageType = Card;
    SourceTable = "Stock Capitalisation";
    SourceTableView = WHERE(Processed = FILTER(True));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
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
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    Caption = 'Department Code';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Caption = 'Branch Code';
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field("Item Cost (LCY)"; Rec."Item Cost (LCY)")
                {
                }
                field("Asset No."; Rec."Asset No.")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                }
                field("Asset Aquisition Date"; Rec."Asset Aquisition Date")
                {
                }
                field(Processed; Rec.Processed)
                {
                }
                field("Process date"; Rec."Process date")
                {
                }
                field("Process Time"; Rec."Process Time")
                {
                }
                field("Process By"; Rec."Process By")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Stock Capitalisation Account"; Rec."Stock Capitalisation Account")
                {
                }
                field("Stock Capitalisation Approval"; Rec."Stock Capitalisation Approval")
                {
                }
                field("Capitalisation Approved By"; Rec."Capitalisation Approved By")
                {
                }
                field("Capitalisation Approved Time"; Rec."Capitalisation Approved Time")
                {
                }
                field("Capitalisation Approved Date"; Rec."Capitalisation Approved Date")
                {
                }
                field(Color; Rec.Color)
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // CustOnAfterGetCurrRecord;
    end;

    // local procedure CustOnAfterGetCurrRecord()
    /*  begin
         xRec := Rec;
         IF Rec.Processed THEN
             CurrPage.EDITABLE(FALSE) ELSE
             CurrPage.EDITABLE(TRUE);
     end; */
}

