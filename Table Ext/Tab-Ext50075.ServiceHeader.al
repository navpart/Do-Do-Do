tableextension 50075 "Service Header" extends "Service Header"
{
    fields
    {
        field(50000; "Open Job Card"; Boolean)
        {
        }
        field(50001; "Estimate Reference"; Code[20])
        {
            //TableRelation = "Payroll-Posting Group Header."."Posting Group Code" WHERE (Description=FIELD(Customer No.));
        }
        field(50002; "Job Posting Group"; Code[20])
        {
            TableRelation = "Job Posting Group";
        }
        field(50003; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No." WHERE("FA Class Code" = FILTER('MOTOR_VEH|PLT_MCH'));

            trigger OnValidate()
            begin
                IF FArec.GET("FA No.") THEN BEGIN
                    "FA Reg. No." := FArec."Registration No.";
                    "Maintenance Code" := 'REPAIRS';
                END
                ELSE BEGIN
                    "FA Reg. No." := '';
                    "Maintenance Code" := '';
                END;
            end;
        }
        field(50004; "Spare Usage(Price)"; Decimal)
        {
        }
        field(50005; Mileage; Code[20])
        {
        }
        field(50006; "Appointment No."; Code[20])
        {
            //TableRelation = SSC/SC."SSC/SC Code";
        }
        field(50007; "Reception No."; Code[20])
        {
            //TableRelation = DTC."DT Code";
        }
        field(50008; "Appointment Date"; Date)
        {
        }
        field(50009; "User ID"; Code[25])
        {
        }
        field(50010; "Vehicle Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE("Customer No." = FIELD("Customer No."));

            trigger OnValidate()
            begin
                /*IF ServHeader.GET(ServItemRec."No.") THEN
                 BEGIN
                  ServHeader.Model := ServItemRec.Model;
                  ServHeader.Chassis := ServItemRec."Chasis No.";
                 END;*/

            end;
        }
        field(50011; Model; Code[20])
        {
        }
        field(50012; Chassis; Code[20])
        {
        }
        field(50013; "Engine No."; Code[20])
        {
        }
        field(50014; "Odometer Reading Reception"; Decimal)
        {
        }
        field(50015; "Workshop Store Rq. No"; Code[20])
        {
        }
        field(50016; "Job Details"; Text[250])
        {
        }
        field(50017; Make; Text[30])
        {
        }
        field(50018; "Service Advisor"; Code[20])
        {
        }
        field(50019; "Service Advisor's Name"; Text[50])
        {
        }
        field(50020; "External Document No"; Code[20])
        {
        }
        field(50021; "Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(50025; "Model Year"; Integer)
        {
        }
        field(50030; "Job Type"; Option)
        {
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,B&P,B&P Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate","B&P","B&P Estimate",Painting;
        }
        field(50152; Department; Code[20])
        {
        }
        field(50153; Released; Boolean)
        {
        }
        field(50154; Confirmed; Boolean)
        {

            trigger OnValidate()
            begin
                /*  COFRec.SETRANGE(COFRec."Customer Order Form No.","No.");
                 IF COFRec.FINDFIRST THEN BEGIN
                   COFRec."Parts Arrived" := "No.";
                   COFRec.MODIFY;
                 END; */
            end;
        }
        field(50155; "Reception Date"; Date)
        {
        }
        field(50156; "Reception Time"; Time)
        {
        }
        field(50157; "Delivery Date"; Date)
        {
        }
        field(50158; "Delivery Time"; Time)
        {
        }
        field(50159; "Customer's Requests"; Option)
        {
            OptionCaption = 'Appointment,Walk-In,Others';
            OptionMembers = Appointment,"Walk-In",Others;
        }
        field(50160; "FA Reg. No."; Code[10])
        {
        }
        field(50161; "Maintenance Code"; Code[10])
        {
            TableRelation = Maintenance;
        }
        field(50162; Posted; Boolean)
        {
        }
        field(50163; Confirmation; Boolean)
        {
        }
        field(50164; "Labour(Hrs)"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document Type" = CONST(Order),
                                                                  "Document No." = FIELD("No."),
                                                                  Type = CONST(Resource)));
            FieldClass = FlowField;
        }
        field(50165; Parts; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document Type" = CONST(Order),
                                                                  "Document No." = FIELD("No."),
                                                                  Type = CONST(Item)));
            FieldClass = FlowField;
        }
        field(50166; "Labour Cost"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document Type" = CONST(Order),
                                                                  "Document No." = FIELD("No."),
                                                                  Type = CONST(Cost)));
            FieldClass = FlowField;
        }
        field(50200; PM; Boolean)
        {
        }
        field(50201; GR; Boolean)
        {
        }
        field(50202; Others; Boolean)
        {
        }
        field(50203; Warranty; Boolean)
        {
        }
        field(50204; Internal; Boolean)
        {
        }
        field(50205; "D/Estimate"; Boolean)
        {
        }
        field(50206; "B&P"; Boolean)
        {
        }
        field(50207; "B&P Estimate"; Boolean)
        {
        }
        field(50208; Painting; Boolean)
        {
        }
        field(50255; "Additional Job Details"; Text[70])
        {
        }
        field(50256; "Customer Order No."; Code[20])
        {
            Editable = false;
        }
        field(50257; "Registration No."; Code[20])
        {
            Editable = false;
        }
       /*  field(50258; Amount; Decimal)
        {
            CalcFormula = Sum("Service Line"."Amount Including VAT" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        } */
        field(50259; Submitted; Boolean)
        {
        }
        field(50260; "Submitted Date"; DateTime)
        {
        }
        field(50261; "Total Line Amount"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50262; "Total Line Amount Incl. (VAT)"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Amount Including VAT" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50263; "Total VAT Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;

            trigger OnValidate()
            begin
                CALCFIELDS("Total Line Amount");
                CALCFIELDS("Total Line Amount Incl. (VAT)");

                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50264; "Allow Posting"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Allow Posting" THEN
                    "Allowed By" := USERID;
            end;
        }
        field(50265; "Allowed By"; Text[50])
        {
        }
        field(50266; "Total Discount Amount"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Discount Amount" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50267; "Total Labour Cost"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                  Type = FILTER(Cost),
                                                                  Description = FILTER('<>DAMAGE ACCESSMENT DIAGNOSIS|ESTIMATION CHARGES')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50268; "Total Item Cost"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                  Type = FILTER(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50269; "Total DADS Cost"; Decimal)
        {
            CalcFormula = Sum("Service Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                  Type = FILTER(Cost),
                                                                  Description = FILTER('DAMAGE ACCESSMENT DIAGNOSIS|ESTIMATION CHARGES')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50270; "Salesperson Name"; Text[50])
        {
        }
        
    }
    var

        FArec: Record "Fixed Asset";

    /*   procedure PostToMaintLedgEntry()
  var
      ItemJnlTemplate: Record "82";
      ItemJnlBatch: Record "233";
      ItemJnlLine: Record "83";
      ItemJnlLine2: Record "83";
      JnlSelected: Boolean;
      ServLine: Record "5902";
      ServLine2: Record "5902";
      LineNo: Integer;
      GenPostSetup: Record "252";
      ItemLedgEntry: Record "32";
      ItemLedgEntry2: Record "32";
      MaintenanceLedgEntry: Record "5625";
      ServiceHeader: Record "5900";
      Confirmation: Boolean;
      RecCount: Decimal;
      SerLineCount: Decimal;
      SerLineCount2: Decimal;
      postMaint: Codeunit "5600";
      ServLineRec: Record "5902";
  begin
      ItemJnlLine.RESET;

      IF NOT CONFIRM('Are you sure you want to post?') THEN
        EXIT
        ELSE BEGIN
            Confirmation := TRUE;
      //To delete existing item jnl lines
      ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Template Name",'ITEM');
      ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Batch Name",'MAINT');
      IF ItemJnlLine2.FINDSET THEN
        ItemJnlLine2.DELETEALL;

      LineNo := 10000;
      ServLine.SETCURRENTKEY("Document Type","Document No.","Line No.");
      ServLine.SETRANGE(ServLine."Document Type","Document Type");
      ServLine.SETRANGE(ServLine."Document No.","No.");
      ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
      ServLine.SETFILTER(ServLine."Qty. to Ship",'>%1',0);
      ServLine.SETRANGE(ServLine.Posted,FALSE);
      IF ServLine.FINDSET THEN
        REPEAT
          ItemJnlLine."Journal Template Name" := 'ITEM';
          ItemJnlLine."Journal Batch Name" := 'MAINT';
          ItemJnlLine."Line No." := ServLine."Line No.";
          ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
          ItemJnlLine.VALIDATE(ItemJnlLine."Item No.",ServLine."No.");
          ItemJnlLine.VALIDATE("Unit of Measure Code",ServLine."Unit of Measure Code");
          ItemJnlLine.VALIDATE("Posting Date","Posting Date");
          ItemJnlLine."Document No." := ServLine."Document No.";
          ItemJnlLine."Requisition No." := ServLine."Document No.";
          ItemJnlLine.Description := ServLine.Description;
          ItemJnlLine."External Document No." := ServLine."Document No.";
          ItemJnlLine."Fixed Assets No." := "FA No.";
          ItemJnlLine.VALIDATE(ItemJnlLine."Location Code",ServLine."Location Code");
          ItemJnlLine.VALIDATE(ItemJnlLine."Variant Code",ServLine."Variant Code");
          ItemJnlLine."Unit of Measure Code" := ServLine."Unit of Measure";
          ItemJnlLine.VALIDATE(ItemJnlLine.Quantity,ServLine."Qty. to Ship");
          ItemJnlLine.VALIDATE(ItemJnlLine."Unit Cost",ServLine."Unit Cost");
          ItemJnlLine."Gen. Bus. Posting Group" := 'MAINTCE';
          ItemJnlLine."Gen. Prod. Posting Group" := ServLine."Gen. Prod. Posting Group";
          ItemJnlLine."Maintenance Code" := "Maintenance Code";
          ItemJnlLine."Shortcut Dimension 1 Code" := ServLine."Shortcut Dimension 1 Code";
          ItemJnlLine."Shortcut Dimension 2 Code" := ServLine."Shortcut Dimension 2 Code";
          ItemJnlLine."From Service" := TRUE;
          ItemJnlLine."From Service Line No." := ServLine."Line No.";
          ItemJnlLine.INSERT(TRUE);
          LineNo := LineNo + 10000;
        UNTIL ServLine.NEXT = 0;
        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJnlLine);
        Confirmation := TRUE;
        ServLine.MODIFY;
      END;


      IF Confirmation = FALSE THEN
        EXIT
        ELSE BEGIN
          //To delete item jnl lines after posting
          ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Template Name",'ITEM');
          ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Batch Name",'MAINT');
          IF ItemJnlLine2.FINDFIRST THEN
          ItemJnlLine2.DELETEALL;

          //To create Maintenance Ledger Entry
          ItemLedgEntry.SETCURRENTKEY("Document No.","Document Type","Document Line No.");
          ItemLedgEntry.SETRANGE("Document No.","No.");
          ItemLedgEntry.SETRANGE("Posting Date","Posting Date");
          ItemLedgEntry.SETRANGE("From Service",TRUE);
            IF ItemLedgEntry.FINDSET THEN REPEAT
              ServLineRec.SETRANGE(ServLineRec."Document No.",ItemLedgEntry."Document No.");
              ServLineRec.SETRANGE(ServLineRec."Line No.",ItemLedgEntry."From Service Line No.");
              ServLineRec.FINDFIRST;
              IF NOT ServLineRec.Posted THEN BEGIN
                ItemLedgEntry.CALCFIELDS(ItemLedgEntry."Cost Amount (Actual)");
                MaintenanceLedgEntry.SETRANGE("Entry No.");
                IF MaintenanceLedgEntry.FINDLAST THEN
                  LineNo := MaintenanceLedgEntry."Entry No.";

                MaintenanceLedgEntry."Entry No." := LineNo + 1;
                MaintenanceLedgEntry."Document No." := ItemLedgEntry."Document No.";
                MaintenanceLedgEntry."User ID" := USERID;
                MaintenanceLedgEntry."Depreciation Book Code" := 'DEF_DEPR';
                MaintenanceLedgEntry."FA No." := "FA No.";
                MaintenanceLedgEntry."FA Posting Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."FA Class Code" := 'MOTOR_VEH';
                MaintenanceLedgEntry."Maintenance Code" := "Maintenance Code";
                MaintenanceLedgEntry."Posting Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."Document Date" := ItemLedgEntry."Posting Date";
                MaintenanceLedgEntry."Document No." := ItemLedgEntry."Document No.";
                MaintenanceLedgEntry.Description := ItemLedgEntry.Description;
                MaintenanceLedgEntry.Quantity := ABS(ItemLedgEntry.Quantity);
                MaintenanceLedgEntry.VALIDATE("Global Dimension 1 Code",ItemLedgEntry."Global Dimension 1 Code");
                MaintenanceLedgEntry.VALIDATE("Global Dimension 2 Code",ItemLedgEntry."Global Dimension 2 Code");
                MaintenanceLedgEntry."Journal Batch Name" := 'MAINT.';
                MaintenanceLedgEntry."Debit Amount" := ABS(ItemLedgEntry."Cost Amount (Actual)");
                MaintenanceLedgEntry.Amount := ABS(ItemLedgEntry."Cost Amount (Actual)");
                MaintenanceLedgEntry."Bal. Account No." := GenPostSetup."Inventory Adjmt. Account";
                MaintenanceLedgEntry."Gen. Posting Type" := 0;
                MaintenanceLedgEntry."Gen. Bus. Posting Group" := '';
                MaintenanceLedgEntry."Gen. Prod. Posting Group" := '';
                MaintenanceLedgEntry."VAT Bus. Posting Group" := '';
                //MaintenanceLedgEntry.INSERT;
               postMaint.InsertFromService(MaintenanceLedgEntry);
              END;
            UNTIL ItemLedgEntry.NEXT = 0;
          END;

          ItemLedgEntry.SETCURRENTKEY("Document No.","Document Type");
          ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.","No.");
          RecCount := ItemLedgEntry.COUNT;
          IF ItemLedgEntry.FINDSET THEN BEGIN
            REPEAT
              ItemLedgEntry."From Service" := TRUE;
              ServLine.Posted := TRUE;
              ServLine.MODIFYALL(Posted,TRUE);
            UNTIL ItemLedgEntry.NEXT = 0;
          END
          ELSE BEGIN
            REPEAT
              ItemLedgEntry."From Service" := FALSE;
              ServLine.Posted := FALSE;
              ServLine.MODIFYALL(Posted,FALSE);
            UNTIL ItemLedgEntry.NEXT = 0;
          END;


          ItemLedgEntry.SETCURRENTKEY("Document No.","Document Type");
          ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.","No.");
          RecCount := ItemLedgEntry.COUNT;

          //By Segunio (The System should only close the Order if all items are posted or are ready for posting)
          ServLine2.SETCURRENTKEY("Document Type","Document No.",Type,"No.");
          ServLine2.SETRANGE(ServLine2."Document Type","Document Type");
          ServLine2.SETRANGE(ServLine2."Document No.","No.");
          ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
          ServLine2.SETFILTER(ServLine2."No.",'<>%1','');
          ServLine2.SETFILTER(ServLine2."Line No.",'<>%1',0);
          SerLineCount2 := ServLine2.COUNT;

          //By Segunio (The System should only close the Order if all items are posted or are ready for posting)
          ServLine.SETCURRENTKEY("Document Type","Document No.",Type,"No.","Qty. to Ship",Posted);
          ServLine.SETRANGE(ServLine."Document Type","Document Type");
          ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
          ServLine.SETRANGE(ServLine."Document No.","No.");
          ServLine.SETFILTER(ServLine."No.",'<>%1','');
          ServLine.SETFILTER(ServLine."Qty. to Ship",'>%1',0);
          ServLine.SETRANGE(ServLine.Posted,TRUE);
          SerLineCount := ServLine.COUNT;
          IF ServLine.FINDSET THEN BEGIN
            IF (SerLineCount = SerLineCount2) AND (SerLineCount = RecCount)THEN BEGIN
              Posted := TRUE;
              MODIFY(TRUE);
            END
            ELSE BEGIN
              Posted := FALSE;
              MODIFY(TRUE);
            END;
          END;
  end;

  [Scope('Internal')]
  procedure PostToGLAccounts()
  var
      ItemJnlTemplate: Record "82";
      ItemJnlBatch: Record "233";
      ItemJnlLine: Record "83";
      ItemJnlLine2: Record "83";
      JnlSelected: Boolean;
      ServLine: Record "5902";
      ServLine2: Record "5902";
      LineNo: Integer;
      GenPostSetup: Record "252";
      ItemLedgEntry: Record "32";
      ItemLedgEntry2: Record "32";
      MaintenanceLedgEntry: Record "5625";
      ServiceHeader: Record "5900";
      Confirmation: Boolean;
      RecCount: Decimal;
      SerLineCount: Decimal;
      SerLineCount2: Decimal;
      postMaint: Codeunit "5600";
      ServLineRec: Record "5902";
  begin
      ItemJnlLine.RESET;
      IF NOT CONFIRM('Are you sure you want to post?') THEN
        EXIT
        ELSE BEGIN
            Confirmation := TRUE;
      //To delete existing item jnl lines
      ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Template Name",'ITEM');
      ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Batch Name",'OTHERS');
      IF ItemJnlLine2.FINDSET THEN
        ItemJnlLine2.DELETEALL;

      LineNo := 10000;
      ServLine.SETCURRENTKEY("Document Type","Document No.","Line No.");
      ServLine.SETRANGE(ServLine."Document Type","Document Type");
      ServLine.SETRANGE(ServLine."Document No.","No.");
      ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
      ServLine.SETFILTER(ServLine."Qty. to Ship",'>%1',0);
      ServLine.SETRANGE(ServLine.Posted,FALSE);
      IF ServLine.FINDFIRST THEN BEGIN
        REPEAT
          ItemJnlLine."Journal Template Name" := 'ITEM';
          ItemJnlLine."Journal Batch Name" := 'OTHERS';
          ItemJnlLine."Line No." := ServLine."Line No.";
          ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
          ItemJnlLine.VALIDATE(ItemJnlLine."Item No.",ServLine."No.");
          ItemJnlLine.VALIDATE("Unit of Measure Code",ServLine."Unit of Measure Code");
          ItemJnlLine.VALIDATE("Posting Date","Posting Date");
          ItemJnlLine."Document No." := ServLine."Document No.";
          ItemJnlLine."Requisition No." := ServLine."Document No.";
          ItemJnlLine.Description := ServLine.Description;
          ItemJnlLine."External Document No." := ServLine."Claim No.";
          ItemJnlLine.VALIDATE("Location Code",ServLine."Location Code");
          ItemJnlLine.VALIDATE("Variant Code",ServLine."Variant Code");
          ItemJnlLine.VALIDATE(Quantity,ServLine."Qty. to Ship");
          ItemJnlLine.VALIDATE("Unit Cost",ServLine."Unit Cost");
          ItemJnlLine."Gen. Bus. Posting Group" := 'VRI-TNL';
          ItemJnlLine."Gen. Prod. Posting Group" := ServLine."Gen. Prod. Posting Group";
          ItemJnlLine."Maintenance Code" := "Maintenance Code";
          ItemJnlLine."Shortcut Dimension 1 Code" := ServLine."Shortcut Dimension 1 Code";
          ItemJnlLine."Shortcut Dimension 2 Code" := ServLine."Shortcut Dimension 2 Code";
          ItemJnlLine."From Service" := TRUE;
          ItemJnlLine."From Service Line No." := ServLine."Line No.";
          ItemJnlLine.INSERT(TRUE);
          LineNo := LineNo + 10000;
        UNTIL ServLine.NEXT = 0;
        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",ItemJnlLine);
        Confirmation := TRUE;
        ServLine.MODIFY;
      END;
      END;


      IF Confirmation = FALSE THEN
        EXIT
        ELSE BEGIN
          //To delete item jnl lines after posting
          ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Template Name",'ITEM');
          ItemJnlLine2.SETRANGE(ItemJnlLine2."Journal Batch Name",'OTHERS');
          IF ItemJnlLine2.FINDFIRST THEN
          ItemJnlLine2.DELETEALL;
        END;

          ItemLedgEntry.SETCURRENTKEY("Document No.","Document Type");
          ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.","No.");
          RecCount := ItemLedgEntry.COUNT;
          IF ItemLedgEntry.FINDSET THEN BEGIN
            REPEAT
              ItemLedgEntry."From Service" := TRUE;
              ServLine.Posted := TRUE;
              ServLine.MODIFYALL(Posted,TRUE);
            UNTIL ItemLedgEntry.NEXT = 0;
          END
          ELSE BEGIN
            REPEAT
              ItemLedgEntry."From Service" := FALSE;
              ServLine.Posted := FALSE;
              ServLine.MODIFYALL(Posted,FALSE);
            UNTIL ItemLedgEntry.NEXT = 0;
          END;

          ItemLedgEntry.SETCURRENTKEY("Document No.","Document Type");
          ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.","No.");
          RecCount := ItemLedgEntry.COUNT;

          //By Segunio (The System should only close the Order if all items are posted or are ready for posting)
          ServLine2.SETCURRENTKEY("Document Type","Document No.",Type,"No.");
          ServLine2.SETRANGE(ServLine2."Document Type","Document Type");
          ServLine2.SETRANGE(ServLine2."Document No.","No.");
          ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
          ServLine2.SETFILTER(ServLine2."No.",'<>%1','');
          ServLine2.SETFILTER(ServLine2."Line No.",'<>%1',0);
          SerLineCount2 := ServLine2.COUNT;

          //By Segunio (The System should only close the Order if all items are posted or are ready for posting)
          ServLine.SETCURRENTKEY("Document Type","Document No.",Type,"No.","Qty. to Ship",Posted);
          ServLine.SETRANGE(ServLine."Document Type","Document Type");
          ServLine.SETRANGE(ServLine.Type,ServLine.Type::Item);
          ServLine.SETRANGE(ServLine."Document No.","No.");
          ServLine.SETFILTER(ServLine."No.",'<>%1','');
          ServLine.SETFILTER(ServLine."Qty. to Ship",'>%1',0);
          ServLine.SETRANGE(ServLine.Posted,TRUE);
          SerLineCount := ServLine.COUNT;
          IF ServLine.FINDSET THEN BEGIN
            IF (SerLineCount = SerLineCount2) AND (SerLineCount = RecCount)THEN BEGIN
              Posted := TRUE;
              MODIFY(TRUE);
            END
            ELSE BEGIN
              Posted := FALSE;
              MODIFY(TRUE);
            END;
          END;
  end; */


    procedure CheckControls()
    var

        COFRec: Record "Customer Order Table.";
        ServiceLine: Record "Service Line";
    Begin
        TESTFIELD("Posting Date", TODAY);
        TESTFIELD("Salesperson Code");
        TESTFIELD("Location Code");

        ServiceLine.SetCurrentKey("Document Type", "Document No.", Type);
        ServiceLine.SetRange("Document Type", "Document Type");
        ServiceLine.SetRange("Document No.", "No.");
        ServiceLine.SetRange("Job Type", ServiceLine."Job Type"::" ");
        IF ServiceLine.FindFirst THEN
            ERROR('You need to update the customer request type on the service lines.');

    End;
}
