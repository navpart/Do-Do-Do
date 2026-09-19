table 70001 "Procurement Line"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Capex,Opex,Sundry Asset,Opex Payment,LPO';
            OptionMembers = Capex,Opex,"Sundry Asset","Opex Payment",LPO;
        }
        field(2; "Document No."; Code[10])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Vendor Name"; Text[50])
        {

            trigger OnLookup()
            begin
                IF PAGE.RUNMODAL(0, VendRec) = ACTION::LookupOK THEN BEGIN
                    "Vendor Name" := VendRec.Name;
                    "Vendor No." := VendRec."No.";
                    Address := VendRec.Address;
                END;

                CapexOpexReq.GET("Document Type", "Document No.");
                Description := CapexOpexReq."Asset Description";
            end;

            trigger OnValidate()
            begin
                CapexOpexReq.GET("Document Type", "Document No.");
                Description := CapexOpexReq."Asset Description";
            end;
        }
        field(5; Address; Text[50])
        {
        }
        field(6; Amount; Decimal)
        {
            CalcFormula = Sum("Procurement Line Detail".Amount WHERE("Document Type" = FIELD("Document Type"),
                                                                      "Document No." = FIELD("Document No."),
                                                                      "Capex Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(7; Remark; Text[50])
        {
        }
        field(8; Preferred; Boolean)
        {

            trigger OnValidate()
            begin
                CapexOpexLine.SETCURRENTKEY("Document Type", "Document No.", Preferred);
                CapexOpexLine.SETRANGE("Document Type", "Document Type");
                CapexOpexLine.SETRANGE("Document No.", "Document No.");
                CapexOpexLine.SETRANGE(Preferred, TRUE);
                IF CapexOpexLine.FINDFIRST THEN BEGIN
                    CapexOpexLine.Preferred := FALSE;
                    CapexOpexLine.MODIFY;
                END;

                UserSetup.GET(USERID);
                IF IncomingDoc.GET("Incoming Document Entry No.") THEN
                    IF Preferred = TRUE THEN BEGIN
                        IncomingDoc.Released := TRUE;
                        IncomingDoc."Released Date-Time" := CURRENTDATETIME;
                        IncomingDoc."Requisition No." := "Document No.";
                        IncomingDoc."Vendor Name" := "Vendor Name";
                        IncomingDoc."Vendor Address" := Address;
                        IncomingDoc.Description := Description;
                        IncomingDoc."Payment Terms" := "Payment Terms";
                        IncomingDoc."Vendor No." := "Vendor No.";
                        IncomingDoc."Requisition Line No." := "Line No.";
                        IF CapexOpexReq.GET("Document Type", "Document No.") THEN
                            IncomingDoc."Requisition Date" := CapexOpexReq.Date;
                        IncomingDoc.MODIFY;
                    END ELSE BEGIN
                        IncomingDoc.Released := FALSE;
                        IncomingDoc."Released Date-Time" := CURRENTDATETIME;
                        IncomingDoc."Requisition No." := '';
                        IncomingDoc."Vendor Name" := '';
                        IncomingDoc."Vendor Address" := '';
                        IncomingDoc.Description := '';
                        IncomingDoc."Payment Terms" := "Payment Terms";
                        IncomingDoc."Vendor No." := '';
                        IncomingDoc."Requisition Date" := 0D;
                        IncomingDoc."Requisition Line No." := 0;
                        IncomingDoc.MODIFY;
                    END;
            end;
        }
        field(9; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document" WHERE(Status = FILTER('New'));

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                /* IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description)); */

                IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description));
                IF "Incoming Document Entry No." = xRec."Incoming Document Entry No." THEN
                    EXIT;

                IF "Incoming Document Entry No." = 0 THEN
                    IncomingDocument.RemoveReferenceToWorkingDocument(xRec."Incoming Document Entry No.")
                ELSE
                    IncomingDocument.SetProcurementLine(Rec);





            end;
        }
        field(10; Description; Text[100])
        {
            NotBlank = false;
        }
        field(11; "LPO No."; Code[20])
        {
            CalcFormula = Lookup("Purchase Header"."No." WHERE("Incoming Document Entry No." = FIELD("Incoming Document Entry No.")));
            FieldClass = FlowField;
        }
        field(12; "Payment Terms"; Option)
        {
            OptionCaption = ' ,100% after delivery,100% before delivery,90% before delivery,80% before delivery,75% before delivery,70% before delivery,60% before delivery,50% before delivery,40% before delivery,30% before delivery,20% before delivery,10% before delivery ,95%,85%,65% before delivery';
            OptionMembers = " ","100% after delivery","100% before delivery","90% before delivery","80% before delivery","75% before delivery","70% before delivery","60% before delivery","50% before delivery","40% before delivery","30% before delivery","20% before delivery","10% before delivery ","95%","85%","65% before delivery";

            trigger OnValidate()
            begin
                TESTFIELD(Amount);
                CASE "Payment Terms" OF
                    1:
                        BEGIN
                            "Advance Payment" := 0;
                            Balance := Amount;
                        END;
                    //2: BEGIN
                    //   "Advance Payment" := Amount;
                    //   Balance := Amount - "Advance Payment";
                    //
                    2:
                        BEGIN
                            "Advance Payment" := 0;
                            Balance := Amount;
                        END;
                    3:
                        BEGIN
                            "Advance Payment" := Amount * 0.9;
                            Balance := Amount - "Advance Payment";
                        END;
                    4:
                        BEGIN
                            "Advance Payment" := Amount * 0.8;
                            Balance := Amount - "Advance Payment";
                        END;
                    5:
                        BEGIN
                            "Advance Payment" := Amount * 0.75;
                            Balance := Amount - "Advance Payment";
                        END;

                    6:
                        BEGIN
                            "Advance Payment" := Amount * 0.7;
                            Balance := Amount - "Advance Payment";
                        END;
                    7:
                        BEGIN
                            "Advance Payment" := Amount * 0.6;
                            Balance := Amount - "Advance Payment";
                        END;
                    8:
                        BEGIN
                            "Advance Payment" := Amount * 0.5;
                            Balance := Amount - "Advance Payment";
                        END;
                    9:
                        BEGIN
                            "Advance Payment" := Amount * 0.4;
                            Balance := Amount - "Advance Payment";
                        END;
                    10:
                        BEGIN
                            "Advance Payment" := Amount * 0.3;
                            Balance := Amount - "Advance Payment";
                        END;
                    11:
                        BEGIN
                            "Advance Payment" := Amount * 0.2;
                            Balance := Amount - "Advance Payment";
                        END;
                    12:
                        BEGIN
                            "Advance Payment" := Amount * 0.1;
                            Balance := Amount - "Advance Payment";
                        END;
                    //END;

                    13:
                        BEGIN
                            "Advance Payment" := Amount * 0.95;
                            Balance := Amount - "Advance Payment";
                        END;
                    //END;
                    14:
                        BEGIN
                            "Advance Payment" := Amount * 0.85;
                            Balance := Amount - "Advance Payment";
                        END;
                    //END;

                    15:
                        BEGIN
                            "Advance Payment" := Amount * 0.65;
                            Balance := Amount - "Advance Payment";
                        END;
                END;
            end;
        }
        field(13; "Vendor No."; Code[10])
        {
        }
        field(14; "Advance Payment"; Decimal)
        {
        }
        field(15; Balance; Decimal)
        {
        }

    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Document No.", Preferred)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('You can not delete this entry. Contact your System Administrator!') ;



    end;

    trigger OnModify()
    begin
        //CapexOpexReq.GET("Document Type","Document No.");
        //IF CapexOpexReq.Send= TRUE THEN
        //ERROR('You can not edit this document');
    end;

    var
        CapexOpexLine: Record "Procurement Line";
        CapexOpexReq: Record "Procurement Header";
        IncomingDoc: Record "Incoming Document";
        UserSetup: Record "User Setup";
        VendRec: Record Vendor;
        //Mail: Codeunit Mail;
        ToAddresses: Text;
        CcAddresses: Text;
        BccAddresses: Text;
        Subject: Text;
        Body: Text;
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        ProcurLineDetail: Record "Procurement Line Detail";


    procedure GetIncomingDocumentURL(): Text[1000]
    var
        IncomingDocument: Record "Incoming Document";
    begin
        IF "Incoming Document Entry No." = 0 THEN
            EXIT('');

        IncomingDocument.GET("Incoming Document Entry No.");
        EXIT(IncomingDocument.GetURL);
    end;
}

