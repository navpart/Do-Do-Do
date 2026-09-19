page 50206 "Stores Req. Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Stores Req. Line.";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Item No."; Rec."Item No.")
                {

                    trigger OnValidate()
                    begin

                    end;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {

                    trigger OnValidate()
                    begin

                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Cage/Location"; Rec."Cage/Location")
                {
                    Visible = false;
                }
                field("Shelf/Bin No."; Rec."Shelf/Bin No.")
                {
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = true;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = true;
                }
                field("Fixed Asset No."; Rec."Fixed Asset No.")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        ERROR('It is not possible to change the department code!');
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Branch Code';
                }
                field(Remark; Rec.Remark)
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

    end;

    trigger OnInit()
    begin
        QtyInStockRed2Visible := TRUE;
        QtyInStockRedVisible := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

    end;

    var
        ItemRec: Record 27;
        FaRec: Record 5600;
        ItemJnlManagement: Codeunit 240;
        ItemDescription: Text[50];
        QtyInStock: Decimal;
        QtyOnPurchOrder: Decimal;
        QtyOnRequest: Decimal;
        Usage30Days: Decimal;
        Usage180Days: Decimal;
        Usage360Days: Decimal;
        item: Record 50101;
        GLDateFilter: Text[30];
        AssetName: Text[50];
        AssetRegNo: Code[30];
        QtyInStockRedVisible: Boolean;
        QtyInStockRed2Visible: Boolean;
        Text19024110: Label 'Qty in Stock';

}

