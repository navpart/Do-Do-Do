page 80046 "Job Instruction Card"
{
    SourceTable = "Customer Order HeaderX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job Type2"; Rec."Job Type2")
                {
                    Caption = 'Job Type';
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Job Instruction Date"; Rec."Job Instruction Date")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    Editable = false;
                }
                field(Brand; Rec.Brand)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Car Wash"; Rec."Car Wash")
                {
                }
                field("Replace Parts Keep"; Rec."Replace Parts Keep")
                {
                }
                field("Key Assigned No."; Rec."Key Assigned No.")
                {
                }
                field("Stall No."; Rec."Stall No.")
                {
                }
                field("Reception Staff Name"; Rec."Reception Staff Name")
                {
                    Editable = false;
                }
            }
            group("Date and Time Change")
            {
                field("Estimated Completion Date"; Rec."Estimated Completion Date")
                {
                }
                field("Estimated Completion Time"; Rec."Estimated Completion Time")
                {
                }
                field("Delivery Changed Date"; Rec."Delivery Changed Date")
                {
                }
                field("Delivery Changed Time"; Rec."Delivery Changed Time")
                {
                }
                field("Completion Changed Date"; Rec."Completion Changed Date")
                {
                }
                field("Completion Changed Time"; Rec."Completion Changed Time")
                {
                }
            }
            part(Lines; "Job Instruction Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = Field("No.");
            }
            group("Preparation for Delivery")
            {
                group("Other Findings")
                {
                    field("Other Findings/Advice"; Rec."Other Findings/Advice")
                    {
                        MultiLine = true;
                    }
                }
                group(Memos)
                {
                    field(Memo; Rec.Memo)
                    {
                        MultiLine = true;
                    }
                }
                group("Pre-delivery Confirmation")
                {
                    group("1.")
                    {
                        field(Cleanliness; Rec.Cleanliness)
                        {
                        }
                        field("Courtesy Items Removal"; Rec."Courtesy Items Removal")
                        {
                        }
                        field("Outer Minor P / Seat P"; Rec."Outer Minor P / Seat P")
                        {
                        }
                        field("Clock Adj / Radio Setting"; Rec."Clock Adj / Radio Setting")
                        {
                        }
                        field("Pre-d C Staff Name"; Rec."Pre-d C Staff Name")
                        {
                            Caption = 'Staff Name';
                        }
                    }
                    group("2.")
                    {
                        field(Cleanliness2; Rec.Cleanliness2)
                        {
                            Caption = 'Cleanliness';
                        }
                        field("Courtesy Items Removal2"; Rec."Courtesy Items Removal2")
                        {
                            Caption = 'Courtesy Items Removal';
                        }
                        field("Outer Minor P / Seat P2"; Rec."Outer Minor P / Seat P2")
                        {
                            Caption = 'Outer Minor P / Seat P';
                        }
                        field("Clock Adj / Radio Setting2"; Rec."Clock Adj / Radio Setting2")
                        {
                            Caption = 'Clock Adj / Radio Setting';
                        }
                        field("Pre-d C Confirmed by"; Rec."Pre-d C Confirmed by")
                        {
                            Caption = 'Confirmed By';
                        }
                    }
                }
                group("Job Completion Notification")
                {
                    field(Technician; Rec.Technician)
                    {
                    }
                    field("Technician Name"; Rec."Technician Name")
                    {
                    }
                    field("QC Staff Code"; Rec."QC Staff Code")
                    {
                    }
                    field("QC Staff Name"; Rec."QC Staff Name")
                    {
                    }
                    field("QC Result"; Rec."QC Result")
                    {
                    }
                    field("QC Comment"; Rec."QC Comment")
                    {
                        MultiLine = true;
                    }
                    field("Actual Hours Clocked"; Rec."Actual Hours Clocked")
                    {
                    }
                    field("Job CN Staff Name"; Rec."Job CN Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                    field("Job CN Date"; Rec."Job CN Date")
                    {
                        Caption = 'Date';
                    }
                    field("Job CN Time"; Rec."Job CN Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("Job Results Explanation")
                {
                    field("Payment for Estimate"; Rec."Payment for Estimate")
                    {
                    }
                    field("Job Details Explanation"; Rec."Job Details Explanation")
                    {
                    }
                    field("Fee Explanation"; Rec."Fee Explanation")
                    {
                    }
                    field("Results Confirmation w / Cust."; Rec."Results Confirmation w / Cust.")
                    {
                    }
                    field("Walk-around Check"; Rec."Walk-around Check")
                    {
                    }
                    field(Fixed; Rec.Fixed)
                    {
                    }
                    field("Level-up"; Rec."Level-up")
                    {
                    }
                    field("No Fixed"; Rec."No Fixed")
                    {
                    }
                    field("P.S.F.U. (Plan)"; Rec."P.S.F.U. (Plan)")
                    {
                    }
                    field("JRE Staff Code"; Rec."JRE Staff Code")
                    {
                        Caption = 'Staff Code';
                    }
                    field("JRE Staff Name"; Rec."JRE Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                }
                group("Customer Contact")
                {
                    field("CC Date"; Rec."CC Date")
                    {
                        Caption = 'Date';
                    }
                    field("CC Time"; Rec."CC Time")
                    {
                        Caption = 'Time';
                    }
                    field("CC Staff Name"; Rec."CC Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                }
                group(PSFU)
                {
                    field("P.S.F.U. (Plan) Date"; Rec."P.S.F.U. (Plan) Date")
                    {
                    }
                    field("P.S.F.U. (Plan) Time"; Rec."P.S.F.U. (Plan) Time")
                    {
                    }
                    field("P.S.F.U Other"; Rec."P.S.F.U Other")
                    {
                    }
                    field("P.S.F.U. (Actual) Date"; Rec."P.S.F.U. (Actual) Date")
                    {
                    }
                    field("P.S.F.U. (Actual) Time"; Rec."P.S.F.U. (Actual) Time")
                    {
                    }
                    field("P.S.F.U. Staff Name"; Rec."P.S.F.U. Staff Name")
                    {
                    }
                    field("P.S.F.U. Confirmed by"; Rec."P.S.F.U. Confirmed by")
                    {
                    }
                }
                group("PSFU Contact")
                {
                    field("Contact Telephone"; Rec."Contact Telephone")
                    {
                        Caption = 'Telephone';
                    }
                    field("CT Home"; Rec."CT Home")
                    {
                        Caption = 'Home';
                    }
                    field("CT Mobile"; Rec."CT Mobile")
                    {
                        Caption = 'Mobile';
                    }
                    field("CT Business"; Rec."CT Business")
                    {
                        Caption = 'Business';
                    }
                    field("JI E-mail"; Rec."JI E-mail")
                    {
                        Caption = 'Email';
                    }
                    field("JI EMail2"; Rec."JI EMail2")
                    {
                        Caption = 'Email';
                    }
                    field("JI Other"; Rec."JI Other")
                    {
                        Caption = 'Other';
                    }
                    field("JI Other II"; Rec."JI Other II")
                    {
                        Caption = 'Other';
                    }
                }
                group(Delivery)
                {
                    field("Delivery Customer"; Rec."Delivery Customer")
                    {
                    }
                    field("Delivery Staff Name"; Rec."Delivery Staff Name")
                    {
                    }
                    field("Next Operation Code"; Rec."Next Operation Code")
                    {
                    }
                    field(Delivered; Rec.Delivered)
                    {
                        Caption = 'Delivered';

                        trigger OnValidate()
                        begin
                            CurrPage.CLOSE;
                        end;
                    }
                    field("Date Delivered"; Rec."Date Delivered")
                    {
                        Caption = 'Date';
                    }
                    field("Time Delivered"; Rec."Time Delivered")
                    {
                        Caption = 'Time';
                    }
                }
            }
            group(Workflow)
            {
                field(Stage; Rec.Stage)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Job Clocking")
            {
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Clocking Sheet";
                RunPageLink = "Job No." = FIELD("No.");
            }
            action("Update Actual Clocked Hours")
            {
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ClockedHours := 0;
                    Clocking.SETCURRENTKEY("Job No.");
                    Clocking.SETRANGE("Job No.", Rec."No.");
                    IF Clocking.FINDFIRST THEN BEGIN
                        REPEAT
                            ClockedHours := ClockedHours + Clocking."Clocked Time";
                        UNTIL Clocking.NEXT = 0;
                    END;

                    Rec."Actual Hours Clocked" := ROUND(ClockedHours / 3600000);
                    Rec.MODIFY;
                end;
            }
            action("Print Job Instruction")
            {
                Caption = 'Print Job Instruction';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    COFRec.SETRANGE("No.", Rec."No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUN(50308, TRUE, TRUE, COFRec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Delivered = TRUE THEN
            CurrPage.EDITABLE := FALSE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec.Delivered = TRUE THEN
            CurrPage.EDITABLE := FALSE;
    end;

    var
        COFRec: Record 70034;
        ServiceOrder: Record 5900;
        SericeItemLine: Record 5901;
        ServiceLine: Record 5902;
        PurchSetup: Record 312;
        USERSETUP: Record 91;
        JIRec: Record 70034;
        CustOrderLine: Record 70036;
        CustOrderLine2: Record 70036;
        ServiceLine2: Record 5902;
        CustOrderTable: Record 70034;
        PurchOrderHeader: Record 38;
        PurchOrderLine: Record 39;
        NextLineNo: Integer;
        NoSeriesMgt: Record 308;
        VRI2: Record 50058;
        ItemRec: Record 27;
        COFRec2: Record 70034;
        VRIRec: Record 50058;
        COFLine: Record 70036;
        Clocking: Record 70038;
        ClockedHours: Duration;


    procedure CreatePurchaseRequisition()
    var
        RequisitionLine: Record 246;
        RequisitionLine2: Record 246;
        ReqWrkShtName: Record 245;
        ReqWkshTemp: Record 244;
        NextLine: Integer;
        ReqBatchName: Code[20];
    begin
        //CREATED BY SEGUNIO
        //FOR TRANSFER OF UNAVAILABLE PARTS TO THE PURCHASE REQUISITION SHEET

        IF Rec."COF Origin" = Rec."COF Origin"::VRI THEN BEGIN
            IF VRI2.GET(Rec."Vehicle Registration No.") THEN
                VRI2.TESTFIELD("Send to Workshop Aprroval", TRUE);
        END;

        ReqWrkShtName.SETRANGE(ReqWrkShtName."Worksheet Template Name", 'REQ.');
        //ReqWrkShtName.SETRANGE(ReqWrkShtName."No. Of Lines", 0);
        IF ReqWrkShtName.FINDSET THEN
            REPEAT
                ReqWrkShtName."COF No." := '';
                ReqWrkShtName."Veh. Reg. No." := '';
                ReqWrkShtName."Customer No." := '';
                ReqWrkShtName."Customer Name" := '';
                ReqWrkShtName.MODIFY;
            UNTIL ReqWrkShtName.NEXT = 0;

        Rec.TESTFIELD("Request Batch Name", '');
        ReqWrkShtName.SETRANGE(ReqWrkShtName."Worksheet Template Name", 'REQ.');
        //ReqWrkShtName.SETRANGE(ReqWrkShtName."No. Of Lines", 0);
        IF NOT ReqWrkShtName.FINDFIRST THEN
            ERROR('You can not create a new Purchase Requisitions unless the Parts Post All Outstanding Requisitions!')
        ELSE BEGIN
            ReqWrkShtName."COF No." := Rec."No.";
            ReqWrkShtName."Customer No." := Rec."Customer No.";
            ReqWrkShtName."Customer Name" := Rec."Customer Name";
            ReqWrkShtName."Veh. Reg. No." := Rec."Vehicle Registration No.";
            ReqWrkShtName."Request Type" := ReqWrkShtName."Request Type"::Parts;
            ReqWrkShtName.MODIFY;
        END;
        CustOrderLine.SETRANGE(CustOrderLine."Document No.", Rec."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Item);
        CustOrderLine.SETRANGE(CustOrderLine."Stock Status", CustOrderLine."Stock Status"::Insufficient);
        CustOrderLine.SETRANGE(CustOrderLine."PR Raised", FALSE);
        IF CustOrderLine.FINDFIRST THEN
            REPEAT
                RequisitionLine.INIT;
                RequisitionLine."Worksheet Template Name" := ReqWrkShtName."Worksheet Template Name";
                RequisitionLine."Journal Batch Name" := ReqWrkShtName.Name;
                RequisitionLine."Customer Class" := CustOrderLine."Customer Class";
                RequisitionLine."Line No." := CustOrderLine."Line No.";
                RequisitionLine.Type := RequisitionLine.Type::Item;
                RequisitionLine."Location Code" := CustOrderLine."Location Code";
                RequisitionLine.VALIDATE(RequisitionLine."No.", CustOrderLine."No.");
                RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine."Quantity Received");
                RequisitionLine.Description := CustOrderLine.Description;
                RequisitionLine."Model Name" := Rec."Model Name";
                RequisitionLine.VALIDATE("COF No.", CustOrderLine."Document No.");
                RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                RequisitionLine."Starting Date" := TODAY;
                RequisitionLine."Starting Time" := TIME;
                RequisitionLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        Rec."Request Batch Name" := ReqWrkShtName.Name;
        //CurrForm.UPDATE;
        MESSAGE('Purchase Requests successfully created', ReqWrkShtName.Name);


        CustOrderLine.SETRANGE(CustOrderLine."Document No.", Rec."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Item);
        CustOrderLine.SETRANGE(CustOrderLine."Stock Status", CustOrderLine."Stock Status"::Insufficient);
        CustOrderLine.SETRANGE(CustOrderLine."PR Raised", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                CustOrderLine."PR Raised" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;


    procedure CreatEstimateRequestion()
    var
        RequisitionLine: Record 246;
        RequisitionLine2: Record 246;
        ReqWrkShtName: Record 245;
        ReqWkshTemp: Record 244;
        NextLine: Integer;
        ReqBatchName: Code[20];
    begin
        //CREATED BY SEGUNIO
        //FOR TRANSFER OF UNAVAILABLE PARTS TO THE PURCHASE REQUISITION SHEET

        ReqWrkShtName.SETRANGE(ReqWrkShtName."Worksheet Template Name", 'REQ.');
        //ReqWrkShtName.SETRANGE(ReqWrkShtName."No. Of Lines", 0);
        IF ReqWrkShtName.FINDSET THEN
            REPEAT
                ReqWrkShtName."COF No." := '';
                ReqWrkShtName."Veh. Reg. No." := '';
                ReqWrkShtName."Customer No." := '';
                ReqWrkShtName."Customer Name" := '';
                ReqWrkShtName."Request Type" := ReqWrkShtName."Request Type"::Estimate;
                ReqWrkShtName.MODIFY;
            UNTIL ReqWrkShtName.NEXT = 0;

        Rec.TESTFIELD("Est. Req. Batch Name", '');
        ReqWrkShtName.SETRANGE(ReqWrkShtName."Worksheet Template Name", 'REQ.');
        //ReqWrkShtName.SETRANGE(ReqWrkShtName."No. Of Lines", 0);
        IF NOT ReqWrkShtName.FINDFIRST THEN
            ERROR('You can not create a new Purchase Requisitions unless the Parts Post All Outstanding Requisitions!')
        ELSE BEGIN
            ReqWrkShtName."COF No." := Rec."No.";
            ReqWrkShtName."Customer No." := Rec."Customer No.";
            ReqWrkShtName."Customer Name" := Rec."Customer Name";
            ReqWrkShtName."Veh. Reg. No." := Rec."Vehicle Registration No.";
            ReqWrkShtName.MODIFY;
        END;
        CustOrderLine.SETRANGE(CustOrderLine."Document No.", REc."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Item);
        //CustOrderLine.SETRANGE(CustOrderLine."Stock Status",CustOrderLine."Stock Status"::Insufficient);
        CustOrderLine.SETRANGE(CustOrderLine."PR Raised", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                RequisitionLine.INIT;
                RequisitionLine."Worksheet Template Name" := ReqWrkShtName."Worksheet Template Name";
                RequisitionLine."Journal Batch Name" := ReqWrkShtName.Name;
                RequisitionLine."Customer Class" := CustOrderLine."Customer Class";
                RequisitionLine."Line No." := CustOrderLine."Line No.";
                RequisitionLine.Type := RequisitionLine.Type::Item;
                RequisitionLine."Location Code" := CustOrderLine."Location Code";
                RequisitionLine.VALIDATE(RequisitionLine."No.", CustOrderLine."No.");
                RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine."Quantity Received");
                RequisitionLine.Description := CustOrderLine.Description;
                RequisitionLine."Model Name" := REc."Model Name";
                RequisitionLine.VALIDATE("COF No.", CustOrderLine."Document No.");
                RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                RequisitionLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        Rec."Est. Req. Batch Name" := ReqWrkShtName.Name;
        //CurrForm.UPDATE;
        MESSAGE('Purchase Requests successfully created', ReqWrkShtName.Name);


        CustOrderLine.SETRANGE(CustOrderLine."Document No.", REc."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Item);
        CustOrderLine.SETRANGE(CustOrderLine."Stock Status", CustOrderLine."Stock Status"::Insufficient);
        CustOrderLine.SETRANGE(CustOrderLine."PR Raised", FALSE);
        IF CustOrderLine.FINDSET THEN
            REPEAT
                CustOrderLine."PR Raised" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;


    procedure AddOperations()
    var
        ServiceLine: Record 5902;
        ServItemLine: Record 5901;
        ServiceRec: Record 5900;
    begin

        CustOrderLine.SETRANGE(CustOrderLine."Document No.", Rec."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Resource);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FIND('-') THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;

        CustOrderLine.SETRANGE(CustOrderLine."Document No.", Rec."No.");
        CustOrderLine.SETRANGE(CustOrderLine.Type, CustOrderLine.Type::Cost);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FIND('-') THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;
}

