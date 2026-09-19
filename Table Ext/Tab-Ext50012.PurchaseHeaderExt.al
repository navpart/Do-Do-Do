tableextension 50012 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(50000; "Landed Cost Factor"; Option)
        {
            Description = 'BPR1.00,LC';
            InitValue = Value;
            OptionMembers = Value,Quantity,Weight;
        }
        field(50001; Overhead; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount WHERE("External Document No." = FIELD("Consignment No."),
                                                        "G/L Account No." = FILTER(134000010 .. 134999999)));
            Description = 'BPR1.00,LC';
            Editable = false;

        }
        field(50002; "Total Amount Item"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                                "Document No." = FIELD("No."),
                                                                                Type = FILTER(Item),
                                                                                "Qty. to Receive" = FILTER(<> 0)));
            Description = 'BPR1.00,LC';
            Editable = false;

        }
        field(50003; "Consignment No."; Code[20])
        {
            Description = 'BPR1.00,LC';
        }
        field(50009; "Total Charges Amount"; Decimal)
        {
            /*
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE (Document Type=FIELD(Document Type),
                                                                                Document No.=FIELD(No.),
                                                                                Type=FILTER('Charge (Item)')));
            Description = 'BPR1.00,LC';
            Editable = false;
            FieldClass = FlowField;
           */
        }
        field(50010; "Vendor Freight"; Boolean)
        {
            Description = 'BPR1.00,LC';
        }
        field(50011; "Total Amount account"; Decimal)
        {
            Description = 'BPR1.00,LC';
            Editable = false;
        }
        field(50012; "Total Amount Item to Receive"; Decimal)
        {
            /*
             CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE (Document Type=FIELD(Document Type),
                                                                                 Document No.=FIELD(No.),
                                                                                 Qty. to Receive=FILTER(<>0)));
             Description = 'BPR1.00,LC';
             Editable = false;
             FieldClass = FlowField;
             */
        }
        field(50013; "WHT Amount"; Decimal)
        {
            Description = 'BPR1.00,LC';
            Editable = false;
        }
        field(50151; "Payment mode"; Option)
        {
            OptionMembers = " ",CASH,CHEQUE,"L/C";
        }
        field(50156; Job; Code[10])
        {
        }
        field(50157; "Address 3"; Text[30])
        {
        }
        field(50158; "P.O. Box"; Text[15])
        {
        }
        field(50159; "Deliv.Addr3"; Text[30])
        {
        }
        field(50160; "Del.P.O.Box"; Text[15])
        {
        }
        field(50161; "First User-ID"; Code[10])
        {
        }
        field(50162; "Last User-ID"; Code[10])
        {
        }
        field(50163; Modified; Date)
        {
        }
        field(50164; "TransitAcc.No."; Code[10])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()

            var
                GLAcc: Record "G/L Account";

            begin
                IF NOT CONFIRM('Does this purchaseorder contain\' +
                               'goods that will arrive to\' +
                               'the seaport or airport ?', FALSE) THEN BEGIN
                    "TransitAcc.No." := '';
                    EXIT;
                END;

                IF NOT GLAcc.GET("TransitAcc.No.") THEN
                    ERROR('Remember to create the consignmentno.\' +
                                'as a finance account before you type\' +
                                'the consignment no.!');


            end;
        }
        field(50165; "Status(DOS)"; Code[10])
        {
        }
        field(50166; "Estimate remaining Cost"; Decimal)
        {
        }
        field(50200; "Total Cost(LCY)"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;

        }
        field(50201; "Order Type"; Option)
        {
            OptionMembers = " ",Sea,Air,Land;

            trigger OnValidate()
            begin
                UpdatePurchLines(FIELDCAPTION("Order Type"), TRUE);
            end;
        }
        field(50202; "External Document No."; Code[25])
        {
        }
        field(50203; "Total Quantity"; Decimal)
        {

            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = FIELD("Document Type"),
                                                               "Document No." = FIELD("No."),
                                                               Type = CONST(Item)));
            FieldClass = FlowField;

        }
        field(50204; "Cubic Capacity"; Decimal)
        {

            /*
               CalcFormula = Sum("Purchase Line".Field30997716 WHERE (Document Type=FIELD(Document Type),
                                                                      Document No.=FIELD(No.)));
               FieldClass = FlowField;
               */
        }
        field(50205; "JPM Value"; Decimal)
        {
            /*
            CalcFormula = Sum("Purchase Line".Field30997716 WHERE(Document Type=FIELD(Document Type),
                                                                   Document No.=FIELD(No.)));
            FieldClass = FlowField;
        */

        }
        field(50206; "C.O.F. No"; Code[20])
        {
            //TableRelation = "Customer Order Table.";
        }
        field(50207; "Requsition No."; Code[10])
        {
        }
        field(50208; "Deliver To"; Text[30])
        {
        }
        field(50209; Validity; Code[10])
        {
        }
        field(50210; "Other Instructions"; Text[30])
        {
        }
        field(50211; "HOD Admin"; BLOB)
        {
        }
        field(50212; "HOD Audit"; BLOB)
        {
        }
        field(50213; "Requisition Date"; Date)
        {
        }
        field(50214; "Payment Term"; Option)
        {
            OptionCaption = ' ,100% after delivery,100% before delivery,90% before delivery,80% before delivery,70% before delivery,60% before delivery,50% before delivery,40% before delivery,30% before delivery,20% before delivery,10% before delivery';
            OptionMembers = " ","100% after delivery","100% before delivery","90% before delivery","80% before delivery","70% before delivery","60% before delivery","50% before delivery","40% before delivery","30% before delivery","20% before delivery","10% before delivery";

            /*
            CalcFormula = Lookup("Procurement Line"."Payment Terms" WHERE(Document No.=FIELD(Requsition No.)));
            FieldClass = FlowField;
            */
        }
        field(50215; "Reception Date"; Date)
        {
        }
        field(50216; "MY ID"; Code[20])
        {
        }
        field(50217; "UrlText"; Text[1000])
        {
        }


    }

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        UserSetup.GET(USERID);
        "Assigned User ID" := usersetup."User ID";

        UrlText := GetUrl(ClientType::Web, CompanyName, ObjectType::Page, 50, Rec);
    end;

    trigger OnDelete()
    Begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."System Admin" THEN
            ERROR('You can not delete this entry. Contact your System Administrator!');

    End;

    var
        usersetup: Record "User Setup";

    procedure BreaktoLines()
    var
        PurchLinerec: Record "Purchase Line";
        PurchLinerec3: Record "Purchase Line";
        lino: Integer;
        lineqty: Integer;
    begin
        PurchLinerec.SETRANGE(PurchLinerec."Document Type", "Document Type");
        PurchLinerec.SETRANGE(PurchLinerec."Document No.", "No.");
        PurchLinerec.SETFILTER(PurchLinerec.Quantity, '>1');
        IF PurchLinerec.FINDFIRST THEN
            REPEAT
                lino := PurchLinerec."Line No." + 10;
                ///IF PurchLinerec.Quantity > 1 THEN
                REPEAT
                    PurchLinerec3 := PurchLinerec;
                    PurchLinerec3."Line No." := lino;
                    PurchLinerec3.VALIDATE(PurchLinerec3.Quantity, 1);
                    PurchLinerec3.INSERT;
                    lineqty := lineqty + 1;
                    lino := lino + 10;
                UNTIL lineqty = PurchLinerec.Quantity;
                lino := 0;
                lineqty := 0;
            UNTIL PurchLinerec.NEXT = 0;
    end;


    procedure GenerateVRI()
    var
        VRIRec: Record 50058;
        ResevRec: Record 337;
    begin
        TESTFIELD("Vendor Shipment No.");
        ResevRec.SETRANGE("Source ID", "No.");
        IF ResevRec.FindFirst() THEN
            REPEAT
                VRIRec.INIT;
                VRIRec."VRI Code" := '';
                VRIRec."VRI Location" := ResevRec."Location Code";
                VRIRec."Exterior Colour" := ResevRec."Exterior Colour Code";
                VRIRec."Exterior Colour Name" := ResevRec."Exterior Colour Name";
                VRIRec.VALIDATE(VRIRec."Item No.", ResevRec."Item No.");
                VRIRec."Item Serial No." := ResevRec."Serial No.";
                VRIRec."Engine No." := ResevRec."Engine No.";
                VRIRec."Key No." := ResevRec."Key No.";
                // VRIRec."Exterior Colour" := ResevRec."Exterior Colour Code";
                VRIRec.Description := ResevRec.Description;
                VRIRec."Shortcut Dimension 1 Code" := ResevRec."Shortcut Dimension 1 Code";
                VRIRec."Shortcut Dimension 2 Code" := ResevRec."Shortcut Dimension 2 Code";
                VRIRec."Consignment No." := "Vendor Shipment No.";
                VRIRec.INSERT(TRUE);
                ResevRec."VRI Code" := VRIRec."VRI Code";
                ResevRec."Vendor Shipment No." := "Vendor Shipment No.";
                ResevRec.MODIFY;
            UNTIL ResevRec.NEXT = 0;
        MESSAGE('VRI Codes have been generated!');
    end;





}
