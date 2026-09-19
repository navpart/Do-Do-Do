page 80016 "Customer Order Card"
{
    ApplicationArea = All;
    Caption = 'Customer Order Form Card';
    PageType = Card;
    SourceTable = "Customer Order HeaderX";

    layout
    {
        area(content)
        {
            group(General)
            {
                group("1. Reception")
                {
                    field("No."; Rec."No.")
                    {

                    }
                    field("Reception Date"; Rec."Reception Date")
                    {
                        Caption = 'Date';
                    }
                    field("Reception Time"; Rec."Reception Time")
                    {
                        Caption = 'Time';
                    }
                    field("Reception Type"; Rec."Reception Type")
                    {
                        Caption = 'Type';
                    }
                    field("Courtesy Vehicle"; Rec."Courtesy Vehicle")
                    {
                    }
                }
                group("2. Delivery")
                {
                    field("Expected Delivery Date"; Rec."Expected Delivery Date")
                    {
                        Caption = 'Date';
                    }
                    field("Expected Delivery Time"; Rec."Expected Delivery Time")
                    {
                        Caption = 'Time';
                    }
                    field("Delivery Type"; Rec."Delivery Type")
                    {
                        Caption = 'Type';
                    }
                    field("User ID"; Rec."User ID")
                    {
                    }
                }
                group("3. Confirmation")
                {
                    field("Confirmation Date"; Rec."Confirmation Date")
                    {
                        Caption = 'Date';
                    }
                    field("Confirmation Time"; Rec."Confirmation Time")
                    {
                        Caption = 'Time';
                    }
                    field("N-3 Confirmation"; Rec."N-3 Confirmation")
                    {
                    }
                    field("N-3 Confirmation Date"; Rec."N-3 Confirmation Date")
                    {
                    }
                }
                group("4. Parts Ordered")
                {
                    field("Parts Ordered Date"; Rec."Parts Ordered Date")
                    {
                        Caption = 'Date';
                    }
                    field("Parts Ordered Time"; Rec."Parts Ordered Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("5. Parts Arrived")
                {
                    field("Parts Arrived Date"; Rec."Parts Arrived Date")
                    {
                        Caption = 'Date';
                    }
                    field("Parts Arrived Time"; Rec."Parts Arrived Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("6. Vehicle Details")
                {
                    field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                    {
                    }
                    field("Vehicle Registered Date"; Rec."Vehicle Registered Date")
                    {
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
                        Caption = 'Engine No.';
                    }
                    field(VDS; Rec.VDS)
                    {
                        Editable = false;
                    }
                    field(VIS; Rec.VIS)
                    {
                        Editable = false;
                    }
                    field(VMI; Rec.VMI)
                    {
                        Editable = false;
                    }
                    field("Odometer At Appointment"; Rec."Odometer At Appointment")
                    {
                    }
                    field("Total Time Taken"; Rec."Total Time Taken")
                    {
                        Editable = false;
                    }
                    field("Job Clock Time"; Rec."Job Clock Time")
                    {
                    }
                }
                group("7. Customer Name / Address / Telephone No.")
                {
                    Editable = true;
                    field("Customer No."; Rec."Customer No.")
                    {
                    }
                    field("Customer Name"; Rec."Customer Name")
                    {
                    }
                    field("No VAT"; Rec."No VAT")
                    {
                    }
                    field(Address; Rec.Address)
                    {
                        Editable = false;
                    }
                    field(Address2; Rec.Address2)
                    {
                        Editable = false;
                    }
                    field(Home; Rec.Home)
                    {
                        Editable = false;
                    }
                    field(Business; Rec.Business)
                    {
                        Editable = false;
                    }
                    field(Mobile; Rec.Mobile)
                    {
                        Editable = false;
                    }
                    field("E-mail"; Rec."E-mail")
                    {
                        Caption = 'Email';
                        Editable = false;
                    }
                }
                group("8. Contact Info.")
                {
                    field("Vehicle Driven By Type"; Rec."Vehicle Driven By Type")
                    {
                    }
                    field("Vehicle Driven By"; Rec."Vehicle Driven By")
                    {
                    }
                    field("Contact Telephone No."; Rec."Contact Telephone No.")
                    {
                        Caption = 'Telephone No. (Home/Business/Mobile)';
                    }
                    field("Available Time From"; Rec."Available Time From")
                    {
                    }
                    field("Available Time To"; Rec."Available Time To")
                    {
                    }
                }
                group("9. Customer's Request")
                {
                    field(Appointment; Rec.Appointment)
                    {
                    }
                    field(Maintenance; Rec.Maintenance)
                    {
                        Caption = 'Maintenance';
                    }
                    field("General Repair"; Rec."General Repair")
                    {
                        Caption = 'General Repair (Diagnosis)';
                    }
                    field("B & P"; Rec."B & P")
                    {
                        Caption = 'Body and Paint';
                    }
                    field(Internal; Rec.Internal)
                    {
                    }
                    field(Warranty; Rec.Warranty)
                    {
                    }
                    field("Customer Waiting"; Rec."Customer Waiting")
                    {
                    }
                    field("Repeat Repair"; Rec."Repeat Repair")
                    {
                    }
                    field("Repeat Repair Reason"; Rec."Repeat Repair Reason")
                    {
                        MultiLine = true;
                        Visible = RepeatRepairVisible;
                    }
                    field("Initial Job No."; Rec."Initial Job No.")
                    {
                    }
                    field("DADs Only"; Rec."DADs Only")
                    {
                        Caption = 'Skip PSFU';
                    }
                }
            }
            group("Service Details")
            {
                group("10. Job Details")
                {
                    field("Job Type2"; Rec."Job Type2")
                    {
                    }
                    field("Job Details"; Rec."Job Details")
                    {
                        MultiLine = true;
                    }
                    field("Operation Code"; Rec."Operation Code")
                    {
                    }
                    field("Operation Code Description"; Rec."Operation Code Description")
                    {
                    }
                    field("Service Location"; Rec."Service Location")
                    {
                    }
                    field("Job Classification"; Rec."Job Classification")
                    {
                    }
                }
                group("11. Time")
                {
                    field("Estimated Job Time"; Rec."Estimated Job Time")
                    {
                    }
                    field("Time Changed"; Rec."Time Changed")
                    {
                    }
                }
                group("12. Cost")
                {
                    field(Estimation; Rec.Estimation)
                    {
                    }
                    field("Cost Changed"; Rec."Cost Changed")
                    {
                    }
                }
                group("13. Appointment Offering 1")
                {
                    field("Appointment Offering 1 Date"; Rec."Appointment Offering 1 Date")
                    {
                        Caption = 'Date';
                    }
                    field("Appointment Offering 1 Time"; Rec."Appointment Offering 1 Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("14. Appointment Offering 2")
                {
                    field("Appointment Offering 2 Date"; Rec."Appointment Offering 2 Date")
                    {
                        Caption = 'Date';
                    }
                    field("Appointment Offering 2 Time"; Rec."Appointment Offering 2 Time")
                    {
                        Caption = 'Time';
                    }
                }
                group("15. Appointment")
                {
                    field("Appointment Date"; Rec."Appointment Date")
                    {
                        Caption = 'Date';
                    }
                    field("Appointment Time"; Rec."Appointment Time")
                    {
                        Caption = 'Time';
                    }
                    field("Appointment Staff Name"; Rec."Appointment Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                }
                group("16. Walk-around Check")
                {
                    field("Service Advisor"; Rec."Service Advisor")
                    {
                    }
                    field("Service Advisor's Name"; Rec."Service Advisor's Name")
                    {
                    }
                    field("Odometer At Reception"; Rec."Odometer At Reception")
                    {
                    }
                    field("Fuel Level"; Rec."Fuel Level")
                    {
                    }
                    field(Right; Rec.Right)
                    {
                    }
                    field(Left; Rec.Left)
                    {
                    }
                    field(Front; Rec.Front)
                    {
                    }
                    field(Rear; Rec.Rear)
                    {
                    }
                    field(Top; Rec.Top)
                    {
                    }
                    field(Memo; Rec.Memo)
                    {
                        MultiLine = true;
                    }
                    field("Payment Method"; Rec."Payment Method")
                    {
                    }
                    field("If Other Method"; Rec."If Other Method")
                    {
                    }
                    field("Walk Around Reception Date"; Rec."Walk Around Reception Date")
                    {
                    }
                    field("Walk Around Reception Time"; Rec."Walk Around Reception Time")
                    {
                    }
                    field("Reception Staff Name"; Rec."Reception Staff Name")
                    {
                    }
                    field(Teams; Rec.Teams)
                    {
                    }
                }
                group("17. Confirmation")
                {
                    field("Additional Job Confirmation"; Rec."Additional Job Confirmation")
                    {
                    }
                    field(Valuables; Rec.Valuables)
                    {
                    }
                    field("Present Estimate w/Explanation"; Rec."Present Estimate w/Explanation")
                    {
                    }
                    field("Car Wash"; Rec."Car Wash")
                    {
                    }
                    field("Replace Parts Keep"; Rec."Replace Parts Keep")
                    {
                    }
                }
                group("18. Courtesy Items")
                {
                    field("Seat Cover"; Rec."Seat Cover")
                    {
                    }
                    field("Floor Mat"; Rec."Floor Mat")
                    {
                    }
                }
            }
            group("Service Items")
            {
                Editable = ServiceItemEditable;
            }
            part("Parts and Labour"; "Customer Order Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Workflow)
            {
                field(Stage; Rec.Stage)
                {
                }
                field("COF Delivery D  ate"; Rec."Actual Delivery Date")
                {
                    Caption = 'COF Delivery Date';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Service History")
            {
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80021;
                RunPageLink = "Vehicle Registration No." = FIELD("Vehicle Registration No.");

                trigger OnAction()
                begin
                    //Rec.SETRANGE("Vehicle Registration No.", "Vehicle Registration No.");
                end;
            }
            action("New DQ")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80054;

                trigger OnAction()
                begin

                    SalesSetup.GET;
                    SalesSetup.TESTFIELD("Auto Sale Invoice No.");
                    DQ.INIT;
                    DQ."DQ No." := NoSeriesMgt.GetNextNo(SalesSetup."Auto Sale Invoice No.", 0D, TRUE);
                    DQ.INSERT(TRUE);
                    DQ.VALIDATE("Customer Order No.", Rec."No.");
                    DQ.MODIFY;
                    COMMIT;

                    DQ2.SETRANGE("Customer Order No.", Rec."No.");
                    IF DQ2.FINDLAST THEN
                        PAGE.RUNMODAL(80054, DQ2);
                end;
            }
            separator(Control1)
            {
            }
            action("All DQs")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80054;

                trigger OnAction()
                begin

                    DQ3.SETRANGE("Customer Order No.", Rec."No.");
                    IF DQ3.FINDFIRST THEN
                        PAGE.RUN(80054, DQ3);
                end;
            }
            action("SSC/SC")
            {
                Caption = 'SSC/SC';
                Image = Entries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ServCamp.SETRANGE(VDS, Rec.VDS);
                    ServCamp.SETRANGE(VMI, Rec.VMI);
                    //ServCamp.SETFILTER("Range From",'<=%1',VIS);
                    //ServCamp.SETFILTER("Range To",'>=%1',VIS);
                    //ServCamp.SETFILTER("SSC/SC Date From",'<=%1',TODAY);
                    //ServCamp.SETFILTER("SSC/SC Date To",'>=%1',TODAY);
                    //ServCamp.SETRANGE("SCSC Status",ServCamp."SCSC Status"::Active);
                    //ServCamp.SETRANGE(Applied,FALSE);
                    IF ServCamp.FINDFIRST THEN
                        PAGE.RUNMODAL(50354, ServCamp) ELSE
                        MESSAGE(Text003);
                end;
            }
            action("BP Worksheet")
            {
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF NOT BPWSHeader.GET(Rec."No.") THEN BEGIN
                        BPWSHeader.INIT;
                        BPWSHeader."No." := Rec."No.";
                        BPWSHeader.INSERT;
                    END;

                    BPWSHeader.GET(Rec."No.");
                    PAGE.RUN(70507, BPWSHeader);
                end;
            }
            action("Job Instruction")
            {
                Image = Job;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80046;
                RunPageLink = "No." = FIELD("No.");
            }
            action(Complaints)
            {
                Caption = 'Complaints';
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50371;
                RunPageLink = "COF No." = FIELD("No.");
            }
            action("Request Additional Parts")
            {
                Image = RegisterPick;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.CreateTransferOrder;
                end;
            }
            action(Estimate)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                Visible = false;

                trigger OnAction()
                begin
                    COFRec.SETRANGE("No.", Rec."No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUNMODAL(50309, TRUE, TRUE, COFRec);
                end;
            }
            action("Update Cost Changed")
            {
                Caption = 'Update Cost Changed';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.CostChanged;
                end;
            }
            action("Customer Order Form")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    COFRec.SETRANGE("No.", Rec."No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUN(50310, TRUE, TRUE, COFRec);
                end;
            }
            action("Transfer Order")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TransferHeader.SETRANGE("COF No.", Rec."No.");
                    IF TransferHeader.FINDFIRST THEN
                        PAGE.RUN(5742, TransferHeader)
                    ELSE
                        MESSAGE('There is no transfer order!');
                end;
            }
            action("Parts Order Parts")
            {
                RunObject = Page 80058;
            }
            action("Service Order")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ServiceOrder.SETRANGE("Customer Order No.", Rec."No.");
                    IF ServiceOrder.FINDFIRST THEN
                        PAGE.RUN(5900, ServiceOrder)
                    ELSE
                        MESSAGE('There is no invoice for this order!');
                end;
            }
            action("Requested Vs Received")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CustOrderLine.SETRANGE("Document No.", Rec."No.");
                    IF CustOrderLine.FINDFIRST THEN
                        REPORT.RUN(50159, TRUE, TRUE, CustOrderLine);
                end;
            }
            action("Purchase Requisition")
            {
                Image = ReviewWorksheet;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    IF NOT CONFIRM(Text001, FALSE) THEN
                        EXIT ELSE
                        CreatePurchaseRequisition;
                end;
            }
            action("Create Sublet")
            {
            }
            action("Create Service Order")
            {
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    // IF Posted THEN
                    //  ERROR('Service Order has been created');


                    IF (Rec."Job Classification" = Rec."Job Classification"::Internal) OR (Rec."Job Classification" = Rec."Job Classification"::"PDI/VRI") THEN
                        ERROR('Select Billabe in Job Classification before you can create a Service Invoice')
                    ELSE BEGIN
                        Rec.CreateServiceInvoice;
                        Rec.Posted := TRUE;
                    END;

                    //IF Stage = Stage::"Parts Ordered" THEN
                    //  ERROR('Stage must be Parts Arrived before service Order can be created');
                end;
            }
            action("&Email COF")
            {
                Caption = '&Email COF';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    COFRec := Rec;
                    CurrPage.SETSELECTIONFILTER(COFRec);
                    COFRec.EmailRecords(FALSE);
                end;
            }
            action("New Estimate Sheet")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 50315;

                trigger OnAction()
                begin
                    COFRec.SETRANGE("No.", Rec."No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUNMODAL(50315, TRUE, TRUE, COFRec);
                end;
            }
            action("Approved Estimate")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 50636;
            }
            action("Post Internal Job")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF Rec.Posted THEN
                        ERROR('This record has been posted');

                    IF (Rec."Job Classification" = Rec."Job Classification"::Internal) OR (Rec."Job Classification" = Rec."Job Classification"::"PDI/VRI") THEN
                        IF NOT CONFIRM('Are you sure you want to post Internal Job?', TRUE) THEN
                            CurrPage.CLOSE
                        ELSE BEGIN
                            Rec.PostIssue;
                            MESSAGE('Internal Job Posted successfully');
                            Rec.Posted := TRUE;
                            Rec."Posted By" := USERID;
                            Rec."Posted DateTime" := CURRENTDATETIME;
                        END;
                end;
            }
            action("Raise LPP")
            {
                Image = RegisterPick;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    IF Rec."LPP Created" THEN
                        ERROR('LPP has been raised');

                    Rec.CreateLPP;
                    MESSAGE('LPP Raised');
                end;
            }
            action("Request for Quote")
            {
                Caption = 'Request for Quote';
                Image = ResourcePlanning;
                Visible = false;

                trigger OnAction()
                begin
                    IF Rec."OpexX Created" THEN
                        ERROR('Request for Quote has alread been created, kindly view');

                    Rec.CreateOpexX;
                    MESSAGE('Request for Quote created');
                end;
            }
            action("View Request for Quote")
            {
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Request For Quote card";
                RunPageLink = "TCOF No." = FIELD("No.");
            }
            action("View LPP")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70193;
                RunPageLink = "TCOF No." = FIELD("No.");
            }
            action("Create Order")
            {

                trigger OnAction()
                begin
                    IF Rec.Posted THEN
                        ERROR('This record has been posted');


                    IF (Rec."Job Classification" = Rec."Job Classification"::Internal) OR (Rec."Job Classification" = Rec."Job Classification"::"PDI/VRI") THEN
                        ERROR('Select Billabe in Job Classification before you can create a Service Invoice');


                    Rec.GenerateService;


                    //Posted := TRUE;
                end;
            }
            action("Posted Voucher ")
            {
                //RunObject = Report 50630;

                trigger OnAction()
                begin
                    ItemLedgerEntry.SETRANGE("Document No.", Rec."No.");
                    IF ItemLedgerEntry.FindFirst() THEN
                        REPORT.RUNMODAL(50630, TRUE, TRUE, ItemLedgerEntry);
                end;
            }
            action("Stock Issue Voucher")
            {
                Image = Tools;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CustOrderLine.SETRANGE("Document No.", Rec."No.");
                    IF CustOrderLine.FINDFIRST THEN
                        REPORT.RUNMODAL(50631, TRUE, TRUE, CustOrderLine);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Delivered THEN
            CurrPage.EDITABLE := FALSE;

        IF Rec."Repeat Repair" THEN
            RepeatRepairVisible := TRUE
        ELSE
            RepeatRepairVisible := FALSE;

        IF Rec.Posted THEN
            ServiceItemEditable := FALSE;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        //ERROR('You cannot delete this record');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Job Type2" := Rec."Job Type2"::"General Repair";
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Repeat Repair" THEN
            RepeatRepairVisible := TRUE
        ELSE
            RepeatRepairVisible := FALSE;


        IF Rec.Delivered THEN
            CurrPage.EDITABLE := FALSE;


        IF Rec.Posted THEN
            ServiceItemEditable := FALSE;
    end;

    var
        COFRec: Record 70034;
        Text101: Label 'Action Aborted!';
        Text102: Label 'Do you want to create Store Requisition?';
        Text103: Label 'SIV already exists!';
        COFRec2: Record 70034;
        ServiceOrder: Record 5900;
        SericeItemLine: Record 5901;
        SeviceLine: Record 5902;
        PurchSetup: Record 312;
        USERSETUP: Record 91;
        JIRec: Record 70034;
        CustOrderLine: Record 70036;
        ServiceLine2: Record 5902;
        Text19029910: Label 'Telephone No.';
        Text19025725: Label 'km/mile';
        Text19080001: Label 'km/mile';
        Text19060037: Label 'Time';
        Text19067933: Label 'Appointment Offering-1';
        Text19053469: Label 'Appointment Offering-2';
        Text19027784: Label 'Changed';
        Text19055759: Label 'Name';
        Text19059303: Label 'Description';
        Text19001707: Label 'Job No.';
        Text19033836: Label 'Staff';
        Text19080002: Label 'Name';
        Text19080003: Label 'Name';
        Text19000744: Label 'Date';
        VRI2: Record 50058;
        Text001: Label 'Do you want to create a purchase requisition for unavailable parts?';
        DQ: Record 70035;
        DQ2: Record 70035;
        Text002: Label 'The questionnaire already exist!';
        DQ3: Record 70035;
        TransferHeader: Record 5740;
        SalesSetup: Record 311;
        NoSeriesMgt: Codeunit "No. Series";
        ServCamp: Record 50046;
        Text003: Label 'SSC/SC details are not available.';
        ClockedTime: Duration;
        Clocking: Record 70038;
        BPWSHeader: Record 70046;
        RepeatRepairVisible: Boolean;
        LocalPartPurchase: Record 70018;
        ServiceItemEditable: Boolean;
        ItemLedgerEntry: Record 32;

    procedure CreatePurchaseRequisition()
    var
        RequisitionLine: Record 246;
        RequisitionLine2: Record 246;
        ReqWrkShtName: Record 245;
        ReqWkshTemp: Record 244;
        NextLine: Integer;
        ReqBatchName: Code[20];
    begin
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
                RequisitionLine."Line No." := CustOrderLine."Line No.";
                RequisitionLine.Type := RequisitionLine.Type::Item;
                RequisitionLine."Location Code" := CustOrderLine."Location Code";
                RequisitionLine.VALIDATE(RequisitionLine."No.", CustOrderLine."No.");
                RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine."Quantity Received");
                RequisitionLine.Description := CustOrderLine.Description;
                RequisitionLine."Model Name" := Rec."Model Name";
                RequisitionLine.VALIDATE("COF No.", CustOrderLine."Document No.");
                RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                RequisitionLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        Rec."Request Batch Name" := ReqWrkShtName.Name;
        MESSAGE('Purchase requests has been successfully created!', ReqWrkShtName.Name);


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
}

