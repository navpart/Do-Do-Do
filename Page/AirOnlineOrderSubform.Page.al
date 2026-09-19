page 71208 "Air Online Order Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Air Online Order Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Item No"; Rec."Item No")
                {
                }
                field("Item Name"; Rec."Item Name")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Amount (FCY)"; Rec."Amount (FCY)")
                {
                }
                field("Deposit Amount (LCY)"; Rec."Deposit Amount (LCY)")
                {
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec."Incoming Document Entry No." > 0 THEN
                            HYPERLINK(Rec.GetIncomingDocumentURL);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IncomingDocument.SETRANGE("Entry No.", Rec."Incoming Document Entry No.");
                        IF PAGE.RUNMODAL(0, IncomingDocument) = ACTION::LookupOK THEN
                            Rec."Incoming Document Entry No." := IncomingDocument."Entry No.";
                    end;
                }
                field(Preferred; Rec.Preferred)
                {
                }
                field(Authorisation; Rec.Authorisation)
                {
                }
                field("PIC of order approval"; Rec."PIC of order approval")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        IncomingDocument: Record 130;
}

