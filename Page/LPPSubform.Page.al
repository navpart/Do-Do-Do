page 70191 "LPP Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "LPP Line";

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
                field("Item No"; Rec."Item No")
                {
                }
                field("Item Name"; Rec."Item Name")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Quantity Available"; Rec."Quantity Available")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
               /*  field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
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
 */
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = All;
                    Visible = true;
                    ExtendedDatatype = URL;
                    trigger OnAssistEdit()
                    begin
                        if Rec."Document Link" <> '' then
                            HyperLink(Rec."Document Link");
                    end;
                }
                field(Description; Rec.Description)
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

    procedure CustGetIncomingDocumentURL(): Text[1000]
    var
        IncomingDocument: Record 130;
    begin
        IF Rec."Incoming Document Entry No." = 0 THEN
            EXIT('');

        IncomingDocument.GET(Rec."Incoming Document Entry No.");
        EXIT(IncomingDocument.GetURL);
    end;
}

