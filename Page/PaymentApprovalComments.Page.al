page 50291 "Payment Approval Comments"
{
    Caption = 'Approval Comments';
    DataCaptionFields = "Document Type", "Document No.";
    DelayedInsert = true;
    DeleteAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    MultipleNewLines = true;
    PageType = Card;
    SourceTable = "Payment Comment Line";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field(DocNo; DocNo)
            {
                CaptionClass = FORMAT(DocType);
                Editable = false;
            }
            repeater(Froup)
            {
                field(Comment; Rec.Comment)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Date and Time"; Rec."Date and Time")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Table ID" := NewTableId;
        Rec."Document Type" := NewDocumentType;
        Rec."Document No." := NewDocumentNo;
    end;

    var
        NewTableId: Integer;
        NewDocumentType: Option Initial,"1st Approval","2nd Approval","3rd Approval","Final Approval",Cashier;
        NewDocumentNo: Code[20];
        DocType: Option Initial,"1st Approval","2nd Approval","3rd Approval","Final Approval",Cashier;
        DocNo: Code[20];


    procedure SetUpLine(TableId: Integer; DocumentType: Option Initial,"1st Approval","2nd Approval","3rd Approval","Final Approval",Cashier; DocumentNo: Code[20])
    begin
        NewTableId := TableId;
        NewDocumentType := DocumentType;
        NewDocumentNo := DocumentNo;
    end;


    procedure Setfilters(TableId: Integer; DocumentType: Option Initial,"1st Approval","2nd Approval","3rd Approval","Final Approval",Cashier; DocumentNo: Code[20])
    begin
        IF TableId <> 0 THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETCURRENTKEY("Table ID", "Document Type", "Document No.");
            Rec.SETRANGE("Table ID", TableId);
            Rec.SETRANGE("Document Type", DocumentType);
            IF DocumentNo <> '' THEN
                Rec.SETRANGE("Document No.", DocumentNo);
            Rec.FILTERGROUP(0);
        END;

        DocType := DocumentType;
        DocNo := DocumentNo;
    end;
}

