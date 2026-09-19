tableextension 50077 "Service Line Ext" extends "Service Line"
{
    fields
    {
        field(50000; "WSR No."; Code[20])
        {
        }
        field(50001; "Duration in Hrs"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(50002; "Dealer Hourly Rate"; Decimal)
        {
        }
        field(50003; "Flat Rate"; Decimal)
        {
        }
        field(50004; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                IF ((Type = Type::Resource) OR (Type = Type::Cost)) THEN BEGIN
                    IF "Start Date" <> 0D THEN
                        "Start Time" := TIME;
                END;
            end;
        }
        field(50005; "End Date"; Date)
        {

            trigger OnValidate()
            begin
                /*   IF ((Type = Type::Resource) OR (Type = Type::Cost)) THEN BEGIN
                    IF "End Date" <> 0D THEN BEGIN
                      ServMgtSetup.GET;
                      ServMgtSetup.TESTFIELD("Break Begin Time");
                      ServMgtSetup.TESTFIELD("Break End Time");
                      "End Time" := TIME;
                      IF (("Start Time" < ServMgtSetup."Break Begin Time") AND ("End Time" > ServMgtSetup."Break End Time")) THEN BEGIN
                        "Duration in Hrs":=(("End Time" - ServMgtSetup."Break End Time") + (ServMgtSetup."Break Begin Time" -"Start Time"))/(3600000);
                      END
                      ELSE
                        "Duration in Hrs" := (("End Time" - "Start Time")/(3600000));
                    END;
                  END; */
            end;
        }
        field(50006; "Start Time"; Time)
        {
        }
        field(50007; "End Time"; Time)
        {

            trigger OnValidate()
            begin
                /*  IF ((Type = Type::Resource) OR (Type = Type::Cost)) THEN BEGIN
                   IF "End Date" <> 0D THEN BEGIN
                     ServMgtSetup.GET;
                     ServMgtSetup.TESTFIELD("Break Begin Time");
                     ServMgtSetup.TESTFIELD("Break End Time");
                     IF (("Start Time" < ServMgtSetup."Break Begin Time") AND ("End Time" > ServMgtSetup."Break End Time")) THEN BEGIN
                       DurationInHrs:=(("End Time" - ServMgtSetup."Break End Time") + (ServMgtSetup."Break Begin Time" -"Start Time"))/(3600000);
                       "Duration in Hrs" := ROUND(DurationInHrs,0.01);
                     END
                     ELSE BEGIN
                       DurationInHrs := (("End Time" - "Start Time")/(3600000));
                       "Duration in Hrs" := ROUND(DurationInHrs,0.01);
                     END;
                   END;
                 END; */
            end;
        }
        field(50008; "Confirmed (Service)"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Confirmed (Service)" THEN BEGIN
                    "Confirmed by (S)" := USERID;
                    "SC Date" := TODAY;
                    "SC Time" := TIME;
                END
                ELSE BEGIN
                    "Confirmed by (S)" := '';
                    "SC Date" := 0D;
                    "SC Time" := 0T;
                END;
            end;
        }
        field(50009; "Confirmed by (S)"; Text[30])
        {
        }
        field(50010; "Bin/Shelf No."; Code[20])
        {
        }
        field(50011; "Confirmed (Parts)"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Confirmed (Parts)" THEN BEGIN
                    "Confirmed by (P)" := USERID;
                    "PC Date" := TODAY;
                    "PC Time" := TIME;
                END
                ELSE BEGIN
                    "Confirmed by (P)" := '';
                    "PC Date" := 0D;
                    "PC Time" := 0T;
                END;
            end;
        }
        field(50012; "Confirmed by (P)"; Text[30])
        {
        }
        field(50013; "PC Date"; Date)
        {
        }
        field(50014; "PC Time"; Time)
        {
        }
        field(50015; "SC Date"; Date)
        {
        }
        field(50016; "SC Time"; Time)
        {
        }
        field(50017; "Shelf No."; Code[20])
        {
        }
        field(50018; "PR Raised"; Boolean)
        {
        }
        field(50152; Department; Code[20])
        {
        }
        field(50153; Remarks; Text[50])
        {
        }
        field(50154; "Model Description"; Text[30])
        {
        }
        field(50155; "Duration in Days"; Decimal)
        {
        }
        field(50156; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(50157; Posted; Boolean)
        {
        }
        field(50158; "Line Count"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Value" WHERE("Document Type" = FIELD("Document Type"),
                                                                 "Document No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50159; "Line Value"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            InitValue = 1;
        }
        field(50160; "Quantity Posted"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            TableRelation = "Item Ledger Entry".Quantity WHERE("Document No." = FIELD("Document No."),
                                                                "Item No." = FIELD("No."),
                                                                "Document Line No." = FIELD("Line No."));

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
            end;
        }
        field(50161; "Res. Hours Total"; Decimal)
        {
            CalcFormula = Sum("Service Line".Quantity WHERE("Document Type" = CONST(Order),
                                                             "Document No." = FIELD("Document No."),
                                                             Type = CONST(Resource)));
            FieldClass = FlowField;
        }
        field(50162; "Cost Total"; Decimal)
        {
            CalcFormula = Sum("Service Line".Amount WHERE("Document Type" = CONST(Order),
                                                           "Document No." = FIELD("Document No."),
                                                           Type = CONST(Cost)));
            FieldClass = FlowField;
        }
        field(50180; "Customer Class"; Option)
        {
            OptionCaption = ' ,Customer Paid,Internal,Warranty';
            OptionMembers = " ","Customer Paid",Internal,Warranty;
        }
        field(50181; "For Sublet"; Boolean)
        {
        }
        field(50182; "Sublet Code"; Code[20])
        {
            //TableRelation = "Purch. Inv. Line"."Document No." WHERE (COF No.=FIELD(Document No.));

            trigger OnValidate()
            begin
                TESTFIELD("For Sublet");
                IF PurchInvLine.GET("Sublet Code", "Sublet Line No.") THEN BEGIN
                    VALIDATE(Type, Type::Cost);
                    VALIDATE("No.", 'SUBLET');
                    VALIDATE(Quantity, PurchInvLine.Quantity);
                    VALIDATE("Unit Price", PurchInvLine."Direct Unit Cost");
                    MESSAGE('Note that the amount in the unit price field is the direct unit cost on the sublet');
                END;
            end;
        }
        field(50183; "Sublet Line No."; Integer)
        {
            //TableRelation = "Purch. Inv. Line"."Line No." WHERE (COF No.=FIELD(Document No.));
        }
        field(50300; "Additional Job"; Boolean)
        {
        }
        field(50301; "Claim No."; Code[20])
        {
        }
        field(50302; "Customer Order No."; Code[20])
        {
        }
        field(50306; "Job Type"; Option)
        {
            Caption = 'Customer Request Type';
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,B&P,B&P Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate","B&P","B&P Estimate",Painting;
        }
    }

    Var
        ServMgtSetup: Record "Service Mgt. Setup";
        ServiceLine: Record "Service Line";
        ServHeader: Record "Service Header";
        ServItem: Record "Service Item";
        ServItemLine: Record "Service Item Line";
        UserSetup: Record "User Setup";
        DurationInHrs: Decimal;
        PurchInvLine: Record "Purch. Inv. Line";

    procedure ServLineCheckControls()
    var

        ServiceLine: Record "Service Line";
    Begin
        TESTFIELD("Posting Date", TODAY);
        TESTFIELD("Location Code");

        ServiceLine.SetCurrentKey("Document Type", "Document No.", Type);
        ServiceLine.SetRange("Document Type", "Document Type");
        ServiceLine.SetRange("Document No.", "Document No.");
        ServiceLine.SetRange("Job Type", "Job Type"::" ");
        IF ServiceLine.FindFirst THEN
            ERROR('You need to update the customer request type on the service lines.');

    End;

}
