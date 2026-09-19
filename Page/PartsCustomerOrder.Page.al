page 80056 "Parts Customer Order"
{
    Caption = 'Customer Order Form Card';
    PageType = Card;
    SourceTable = "Customer Order HeaderX";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
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
                }
                group("7. Customer Name / Address / Telephone No.")
                {
                    Editable = true;
                    Visible = false;
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
                    Visible = false;
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
                    Visible = false;
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
                }
            }
            group("Service Details")
            {
                Visible = false;
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
            }
            part("Parts and Labour"; 80007)
            {
                SubPageLink = "Document No." = FIELD("No."),
                              Type = FILTER(Item);
            }
            group(Workflow)
            {
                field(Stage; Rec.Stage)
                {
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
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
            action("Raise LPP")
            {
                Image = RegisterPick;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF Rec."LPP Created" THEN
                        ERROR('LPP has been raised');

                    Rec.CreateLPP;
                    MESSAGE('LPP Raised');
                end;
            }
            action("View LPP")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70205;
                RunPageLink = "TCOF No." = FIELD("No.");
            }
            action("Request for Quote")
            {
                Caption = 'Request for Quote';

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
                RunObject = Page 70061;
                RunPageLink = "TCOF No." = FIELD("No.");
            }
            action("Create Transfer Order")
            {
                Image = TransferOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Service Location", '120ISO');
                    Rec.CreateTransferOrder;
                    MESSAGE('Transfer Order Created');
                end;
            }
            action("Create Lekki Transfer")
            {
                Image = TransferOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Service Location", '113LEK');
                    Rec.CreateTransferOrderLekki;
                    MESSAGE('Transfer Order Created');
                end;
            }
            action("Stock Issue Voucher ")
            {
                Image = Voucher;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CustOrderLineX: Record "Customer Order LineX";
                begin
                    CustOrderLineX.SETRANGE("Document No.", Rec."No.");
                    IF CustOrderLineX.FINDFIRST THEN
                        REPORT.RUNMODAL(50631, TRUE, TRUE, CustOrderLineX);

                end;
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
            action("Create Service Order")
            {
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    IF Rec.Posted THEN
                        ERROR('Service Order has been created');


                    IF (Rec."Job Classification" = Rec."Job Classification"::Internal) OR (Rec."Job Classification" = Rec."Job Classification"::"PDI/VRI") THEN
                        ERROR('Select Billabe in Job Classification before you can create a Service Invoice');

                    //IF Stage = Stage::"Parts Ordered" THEN
                    //  ERROR('Stage must be Parts Arrived before service Order can be created');

                    Rec.CreateServiceInvoice;

                    Rec.Posted := TRUE;
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
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        ERROR('You cannot delete this record');
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


        //IF Posted THEN
        //CurrPage.EDITABLE := FALSE;
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

