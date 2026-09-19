page 70082 "General Repair/Estimate Card"
{
    ApplicationArea = All;
    SourceTable = "Customer Order Table.";

    layout
    {
        area(content)
        {
            group(ReceptionArea)
            {
                Caption = 'Reception';
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Reception Type"; Rec."Reception Type")
                {
                }
                field("Expected Delivery Date"; Rec."Expected Delivery Date")
                {
                }
                field("Expected Delivery Time"; Rec."Expected Delivery Time")
                {
                }
                field("Delivery Type"; Rec."Delivery Type")
                {
                }
                field("COF Origin"; Rec."COF Origin")
                {

                }
            }
            group("Customer Details")
            {
                Caption = 'Customer Details';
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(GSM; Rec.GSM)
                {
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                }
                field("E-mail"; Rec."E-mail")
                {
                }
                field(Address2; Rec.Address2)
                {
                }
                field("Model No"; Rec."Model No")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Contact Telephone No."; Rec."Contact Telephone No.")
                {
                }
                field("Contact Telephone No. Type"; Rec."Contact Telephone No. Type")
                {
                }
                field("Available Time From"; Rec."Available Time From")
                {
                }
                field("Available Time To"; Rec."Available Time To")
                {
                }
                field("Vehicle Driven By"; Rec."Vehicle Driven By")
                {
                }
                field("Vehicle Driven By Type"; Rec."Vehicle Driven By Type")
                {
                    Caption = 'Other';
                }
                field("If Other Type"; Rec."If Other Type")
                {
                }
                field("Odometer Reading At Appointmen"; Rec."Odometer Reading At Appointmen")
                {
                }
                field("Update Customer Record"; Rec."Update Customer Record")
                {
                }
            }
            group("Customer's Request")
            {
                Caption = 'Customer''s Request';
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                    Caption = 'Appointment';
                }
                field(Maintenance; Rec.Maintenance)
                {
                }
                field("General Repair"; Rec."General Repair")
                {
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
                field("Diag/Est"; Rec."Diag/Est")
                {
                }
                field("B & P"; Rec."B & P")
                {
                }
                field("Customer Complaint"; Rec."Customer Complaint")
                {
                }
            }
            group("JobDetails")
            {
                Caption = 'Job Details';
                field("Appointment Staff Name"; Rec."Appointment Staff Name")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
            }
            group("Customer Order Form")
            {
                Caption = 'Customer Order Form';
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                }
                field("Confirmation Time"; Rec."Confirmation Time")
                {
                }
                field("Confirmation Staff Name"; Rec."Confirmation Staff Name")
                {
                }
                field("Parts Ordered Date"; Rec."Parts Ordered Date")
                {
                }
                field("Parts Ordered Time"; Rec."Parts Ordered Time")
                {
                }
                field("Parts Ordered Staff Name"; Rec."Parts Ordered Staff Name")
                {
                }
                field("Parts Arrived Date"; Rec."Parts Arrived Date")
                {
                }
                field("Parts Arrived Time"; Rec."Parts Arrived Time")
                {
                }
                field("Parts Arrived Staff Name"; Rec."Parts Arrived Staff Name")
                {
                }
                field(Teams; Rec.Teams)
                {
                }
                field("Service Advisor"; Rec."Service Advisor")
                {
                }
                field("Service Advisor's Name"; Rec."Service Advisor's Name")
                {
                }
                field("Service Location"; Rec."Service Location")
                {
                }
                field("New Customer"; Rec."New Customer")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Estimate No."; Rec."Estimate No.")
                {
                }
                field("Vehicle Registered Date"; Rec."Vehicle Registered Date")
                {
                }
                field("FA No."; Rec."FA No.")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field(ETA1; Rec.ETA1)
                {
                }
                field("(Engine No)"; Rec."(Engine No)")
                {
                }
            }
            group("Current Service/Appointment")
            {
                Caption = 'Current Service/Appointment';
                field("Current Service Due Date"; Rec."Current Service Due Date")
                {
                }
                field("Current Service Kilometre"; Rec."Current Service Kilometre")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Job Type Description"; Rec."Job Type Description")
                {
                }
                field("Job No.1"; Rec."Job No.1")
                {
                }
                field("Job Description1"; Rec."Job Description1")
                {
                }
                field(Odometer1; Rec.Odometer1)
                {
                }
                field("Job No.2"; Rec."Job No.2")
                {
                }
                field("Job Description2"; Rec."Job Description2")
                {
                }
                field(Odometer2; Rec.Odometer2)
                {
                }
                field("Job No.3"; Rec."Job No.3")
                {
                }
                field("Job Description3"; Rec."Job Description3")
                {
                }
                field(Odometer3; Rec.Odometer3)
                {
                }
                field(Date1; Rec.Date1)
                {
                }
                field(Date2; Rec.Date2)
                {
                }
                field(Date3; Rec.Date3)
                {
                }
                field("SSC/SC Information"; Rec."SSC/SC Information")
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(VIS; Rec.VIS)
                {
                }
                field(VMI; Rec.VMI)
                {
                }
                field("TA Code"; Rec."TA Code")
                {
                }
                field("TA Name"; Rec."TA Name")
                {
                }
            }
            part("Customer Order Item"; 50241)
            {
                Caption = 'Customer Order Item';
                SubPageLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
            }
            part("SSC/SC Deta ils"; "SSC/SC Subpage")
            {
                Caption = 'SSC/SC Details';
            }
            group(Confirmation)
            {
                Caption = 'Confirmation';
                field("Additional Job Conf irmation"; Rec."Additional Job Confirmation")
                {
                }
                field(" Car Wash"; Rec."Car Wash")
                {
                }
                field(Valuables; Rec.Valuables)
                {
                }
                field("Present Estimate w/Exp lanation"; Rec."Present Estimate w/Explanation")
                {
                }
                field("Replace Pa rts K eep"; Rec."Replace Parts Keep")
                {
                }
            }
            group("Courtesy Items")
            {
                Caption = 'Courtesy Items';
                field("Se at Co ver"; Rec."Seat Cover")
                {
                }
                field("F loor  Mat"; Rec."Floor Mat")
                {
                }
            }
            group("Payment Method")
            {
                Caption = 'Payment Method';
                field(Cheque;
                Rec.Cheque)
                {
                }
                field(Cash; Rec.Cash)
                {
                }
                field("If Othe r Method"; Rec."If Other Method")
                {
                    Caption = 'Other';
                }
            }
            group(Reception)
            {
                Caption = 'Reception';
                field("Walk Around Recept ion Date"; Rec."Walk Around Reception Date")
                {
                }
                field("Walk Around Recept ion Time"; Rec."Walk Around Reception Time")
                {
                }
                field("Reception St aff Name"; Rec."Reception Staff Name")
                {
                }
                field(Memo; Rec.Memo)
                {
                }
                field("Additional Job  Details"; Rec."Additional Job Details")
                {
                }
            }
            group(Update)
            {
                Caption = 'Update';
                field("Order Line  Updated"; Rec."Order Line Updated")
                {
                }
                field("Appt C onfirmed"; Rec."Appt Confirmed")
                {
                    Caption = 'Appt Confirmation';
                }
                field("For Pa rt Order"; Rec."For Part Order")
                {
                    Caption = 'Part Ordered';
                }
                field("For Part  Arrival"; Rec."For Part Arrival")
                {
                    Caption = 'Part Arrival';
                }
                field("For Pr oduction"; Rec."For Production")
                {
                    Caption = 'For Production';
                }
                field(Estimation; Rec.Estimation)
                {
                }
                field("Service O rder No."; Rec."Service Order No.")
                {
                    Caption = 'Parts Order No';
                }
                field("Request Ba tch Name"; Rec."Request Batch Name")
                {
                }
                field("Parts  Arrived"; Rec."Parts Arrived")
                {
                }
                field("Est. Req. Ba tch Name"; Rec."Est. Req. Batch Name")
                {
                }
                field("VRI Estimate  Approved"; Rec."VRI Estimate Approved")
                {
                }
                field("Transf er to TA"; Rec."Transfer to TA")
                {
                }
                field("No VAT"; Rec."No VAT")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Order Parts")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    COFRec.GET(Rec."Customer Order Form No.");
                    IF NOT CONFIRM('Are you sure you want to reserve these parts for service?') THEN
                        MESSAGE('Material request is cancelled')
                    ELSE BEGIN
                        Rec.GenService;
                        COFRec."Service Order No." := ServiceOrder."No.";
                        MESSAGE('Material Request sent successfully');
                        MESSAGE('Service Order %1 successfully created!', ServiceOrder."No.");
                    END;
                end;
            }
            action("Print Job Instruction")
            {
                Caption = 'Print Job Instruction';

                trigger OnAction()
                begin

                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50312, TRUE, TRUE, JIRec);
                end;
            }
            action("Create Part Requisition")
            {
                Caption = 'Create Part Requisition';

                trigger OnAction()
                begin

                    CreatePurchaseRequisition;
                end;
            }
            action("Get Estimate Info")
            {
                Caption = 'Get Estimate Info';

                trigger OnAction()
                begin
                    CreatEstimateRequestion;
                end;
            }
            action("Parts Ordered")
            {
                Caption = 'Parts Ordered';

                trigger OnAction()
                begin

                    COFRec.GET(Rec."Customer Order Form No.");
                    IF NOT CONFIRM('Are you sure you want to Reserve these Parts for Service?') THEN
                        MESSAGE('Material Request Cancelled')
                    ELSE BEGIN
                        Rec.GenService;
                        COFRec."Service Order No." := ServiceOrder."No.";
                        CurrPage.UPDATE;
                        MESSAGE('Material Request Sent Successfully');
                        MESSAGE('Service Order %1 successfully created!', ServiceOrder."No.");
                    END;
                end;
            }
            action("Print Estimate II")
            {
                Caption = 'Print Estimate II';

                trigger OnAction()
                begin

                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FindFirst() THEN
                        REPORT.RUNMODAL(50403, TRUE, TRUE, JIRec);
                end;
            }
            action("Print Invoice")
            {
                Caption = 'Print Invoice';

                trigger OnAction()
                begin

                    IF VRIRec.GET(Rec."Vehicle Registration No.") THEN
                        IF VRIRec."Claim No." = '' THEN
                            IF Rec."Customer No." = '940000' THEN
                                ERROR('There is no claim number!');

                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50404, TRUE, TRUE, JIRec);
                end;
            }
            action("Add Parts to Part Order")
            {
                Caption = 'Add Parts to Part Order';

                trigger OnAction()
                begin

                    ServiceOrder.SETRANGE(ServiceOrder."No.", Rec."Customer Order Form No.");
                    IF ServiceOrder.FINDFIRST THEN BEGIN
                        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
                        CustOrderLine.SETRANGE(CustOrderLine."Additional Jobs", TRUE);
                        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                        IF CustOrderLine.FINDFIRST THEN BEGIN
                            REPEAT
                                ServiceLine.INIT;
                                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                                ServiceLine."Document No." := Rec."Customer Order Form No.";
                                ServiceLine."Line No." := CustOrderLine."Line No.";
                                ServiceLine.Type := ServiceLine.Type::Item;
                                ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                                ServiceLine."Variant Code" := CustOrderLine.Variant;
                                ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                                ServiceLine."PR Raised" := CustOrderLine."PR Raised";
                                ServiceLine.INSERT;
                            UNTIL CustOrderLine.NEXT = 0;
                            MESSAGE('Additional Materials Transferred');
                        END
                        ELSE
                            MESSAGE('All Parts are already on Parts Order!');
                    END;


                    CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
                    CustOrderLine.SETRANGE(CustOrderLine."Additional Jobs", TRUE);
                    CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                    IF CustOrderLine.FINDFIRST THEN
                        REPEAT
                            CustOrderLine."On Part Order" := TRUE;
                            CustOrderLine.MODIFY;
                        UNTIL CustOrderLine.NEXT = 0;
                end;
            }
            action("Create &Sublet LPO")
            {
                Caption = 'Create &Sublet LPO';

                trigger OnAction()
                begin

                    IF CONFIRM(Text104, FALSE) THEN BEGIN
                        CustOrderLine2.SETRANGE(CustOrderLine2."Customer Order Form No.", Rec."Customer Order Form No.");
                        CustOrderLine2.SETFILTER("Line Type", '%1|%2', CustOrderLine2."Line Type"::Sublet, CustOrderLine2."Line Type"::"G/L Account");
                        CustOrderLine2.SETFILTER(CustOrderLine2."Sublet Order No.", '%1', '');
                        IF CustOrderLine2.FINDFIRST THEN
                            REPEAT

                                CustOrderTable.GET(Rec."Customer Order Form No.");
                                PurchOrderHeader.SETRANGE(PurchOrderHeader."Document Type", PurchOrderHeader."Document Type"::Order);
                                PurchOrderHeader.SETRANGE(PurchOrderHeader."Buy-from Vendor No.", CustOrderLine2."Sublet to");
                                PurchOrderHeader.SETRANGE(PurchOrderHeader."C.O.F. No", CustOrderLine2."Customer Order Form No.");
                                IF NOT PurchOrderHeader.FINDSET THEN BEGIN
                                    NextLineNo := 0;

                                    //create header
                                    IF PurchSetup.GET() THEN
                                        PurchSetup.TESTFIELD("Sublet Order No.");
                                    CustOrderLine2.TESTFIELD(CustOrderLine2."Sublet to");
                                    PurchOrderHeader.INIT;
                                    PurchOrderHeader."Document Type" := PurchOrderHeader."Document Type"::Order;
                                    PurchOrderHeader."No." := '';
                                    PurchOrderHeader."Posting Date" := TODAY;
                                    PurchOrderHeader."C.O.F. No" := CustOrderLine2."Customer Order Form No.";
                                    //added 24/03/2012
                                    PurchOrderHeader."No. Series" := PurchSetup."Sublet Order No.";
                                    //added 24/03/2012
                                    PurchOrderHeader.INSERT(TRUE);
                                    PurchOrderHeader."Order Date" := TODAY;
                                    PurchOrderHeader.VALIDATE(PurchOrderHeader."Buy-from Vendor No.", CustOrderLine2."Sublet to");
                                    PurchOrderHeader.VALIDATE(PurchOrderHeader."Location Code", CustOrderLine2."Location Code");
                                    PurchOrderHeader.MODIFY;
                                END ELSE BEGIN
                                    PurchOrderLine.SETRANGE(PurchOrderLine."Document Type", PurchOrderLine."Document Type"::Order);
                                    PurchOrderLine.SETRANGE(PurchOrderLine."Document No.", PurchOrderHeader."No.");
                                    IF PurchOrderLine.FINDLAST THEN
                                        NextLineNo := PurchOrderLine."Line No.";
                                END;
                                //Create/insert line
                                PurchOrderLine.INIT;
                                PurchOrderLine.BlockDynamicTracking(TRUE);
                                PurchOrderLine."Document Type" := PurchOrderLine."Document Type"::Order;
                                PurchOrderLine."Buy-from Vendor No." := CustOrderLine2."Sublet to";
                                PurchOrderLine."Document No." := PurchOrderHeader."No.";
                                NextLineNo := NextLineNo + 10000;
                                PurchOrderLine."Line No." := NextLineNo;
                                PurchOrderLine.VALIDATE(Type, PurchOrderLine.Type::"G/L Account");
                                PurchOrderLine.VALIDATE("No.", CustOrderLine2."No.");
                                PurchOrderLine.VALIDATE("Location Code", CustOrderLine2."Location Code");
                                PurchOrderLine.VALIDATE(Quantity, CustOrderLine2.Quantity);
                                PurchOrderLine.VALIDATE(PurchOrderLine."Direct Unit Cost", CustOrderLine2."Unit Price");
                                PurchOrderLine."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                PurchOrderLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                PurchOrderLine.Description := CustOrderLine2.Description;
                                PurchOrderLine."Expected Receipt Date" := CustOrderLine2.EDA;
                                PurchOrderLine.ETA := CustOrderLine2.ETA;
                                PurchOrderLine."COF No." := CustOrderLine2."Customer Order Form No.";
                                PurchOrderLine."Vehicle Reg. No." := CustOrderTable."Vehicle Registration No.";
                                PurchOrderLine."Model No." := CustOrderTable."Model No";
                                PurchOrderLine."Reception Date" := CustOrderTable."Reception Date";
                                PurchOrderLine."Promised Receipt Date" := CustOrderTable."Expected Delivery Date";
                                PurchOrderLine.INSERT;
                                CustOrderLine2."Sublet Order No." := PurchOrderLine."Document No.";
                                CustOrderLine2."Sublet Line No." := PurchOrderLine."Line No.";
                                CustOrderLine2.MODIFY;
                            UNTIL CustOrderLine2.NEXT = 0;
                        CustOrderTable."Request Batch Name" := PurchOrderHeader."No.";
                        CustOrderTable.MODIFY;
                        CurrPage.UPDATE;
                        MESSAGE('Purchase Order %1 successfully created!', PurchOrderHeader."No.");
                    END ELSE
                        ERROR(Text101);
                end;
            }
            action("Print CustomerOrderForm")
            {
                Caption = 'Print CustomerOrderForm';

                trigger OnAction()
                begin

                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FIND('-') THEN
                        REPORT.RUNMODAL(50305, TRUE, TRUE, COFRec);
                end;
            }
            action("Cost Value")
            {
                Caption = 'Cost Value';

                trigger OnAction()
                begin

                    COFLine.SETRANGE(COFLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF ItemRec.GET(COFLine."No.") THEN
                                IF (ItemRec."Inventory Posting Group" = 'N_PARTCONS') OR
                                (ItemRec."Inventory Posting Group" = 'N_PARTS') THEN BEGIN
                                    //COFLine.VALIDATE(COFLine."No.");
                                    COFLine.VALIDATE("Unit Price", COFLine."Unit Cost");
                                    COFLine.MODIFY;
                                END;
                        UNTIL COFLine.NEXT = 0;
                    END;
                    MESSAGE('Price has been changed to cost value!');
                end;
            }
            action("Update Additional Labour")
            {
                Caption = 'Update Additional Labour';

                trigger OnAction()
                begin

                    ServiceOrder.SETRANGE(ServiceOrder."No.", Rec."Customer Order Form No.");
                    IF ServiceOrder.FIND('-') THEN BEGIN
                        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Labour);
                        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                        IF CustOrderLine.FIND('-') THEN BEGIN
                            REPEAT
                                ServiceLine.INIT;
                                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                                ServiceLine."Document No." := Rec."Customer Order Form No.";
                                ServiceLine."Line No." := CustOrderLine."Line No.";
                                ServiceLine."Service Item No." := Rec."Vehicle Registration No.";
                                ServiceLine."Model Description" := CustOrderLine."Model Description";
                                ServiceLine."Service Item Line No." := 10000;
                                ServiceLine.Type := ServiceLine.Type::Cost;
                                IF CustOrderLine."No." <> '' THEN
                                    ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                                ServiceLine."Variant Code" := CustOrderLine.Variant;
                                IF CustOrderLine.Quantity <> 0 THEN
                                    ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                                ServiceLine.Description := CustOrderLine.Description;
                                ServiceLine."Model Description" := CustOrderLine."Model Description";
                                ServiceLine.INSERT;
                            UNTIL CustOrderLine.NEXT = 0;
                            MESSAGE('Sundries and Labour Transferred');
                        END
                        ELSE
                            MESSAGE('Labours are already on Parts Order!');
                    END;


                    CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Labour);
                    CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                    IF CustOrderLine.FIND('-') THEN
                        REPEAT
                            CustOrderLine."On Part Order" := TRUE;
                            CustOrderLine.MODIFY;
                        UNTIL CustOrderLine.NEXT = 0;

                    ServiceOrder.SETRANGE(ServiceOrder."No.", Rec."Customer Order Form No.");
                    IF ServiceOrder.FIND('-') THEN BEGIN
                        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::"Sundry Spares");
                        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                        IF CustOrderLine.FIND('-') THEN BEGIN
                            REPEAT
                                ServiceLine.INIT;
                                ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                                ServiceLine."Document No." := Rec."Customer Order Form No.";
                                ServiceLine."Line No." := CustOrderLine."Line No.";
                                ServiceLine."Service Item No." := Rec."Vehicle Registration No.";
                                ServiceLine."Model Description" := CustOrderLine."Model Description";
                                ServiceLine."Service Item Line No." := 10000;
                                ServiceLine.Type := ServiceLine.Type::Cost;
                                IF CustOrderLine."No." <> '' THEN
                                    ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                                ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                                ServiceLine."Variant Code" := CustOrderLine.Variant;
                                IF CustOrderLine.Quantity <> 0 THEN
                                    ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                                ServiceLine.Description := CustOrderLine.Description;
                                ServiceLine."Model Description" := CustOrderLine."Model Description";
                                ServiceLine.INSERT;
                            UNTIL CustOrderLine.NEXT = 0;
                            MESSAGE('Sundries and Labour Transferred');
                        END
                        ELSE
                            MESSAGE('Labours are already on Parts Order!');
                    END;


                    CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::"Sundry Spares");
                    CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
                    IF CustOrderLine.FIND('-') THEN
                        REPEAT
                            CustOrderLine."On Part Order" := TRUE;
                            CustOrderLine.MODIFY;
                        UNTIL CustOrderLine.NEXT = 0;
                end;
            }
            action("Generate Estimate")
            {
                Caption = 'Generate Estimate';

                trigger OnAction()
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
                            ReqWrkShtName.MODIFY;
                        UNTIL ReqWrkShtName.NEXT = 0;

                    Rec.TESTFIELD("Request Batch Name", '');
                    ReqWrkShtName.SETRANGE(ReqWrkShtName."Worksheet Template Name", 'REQ.');
                    //ReqWrkShtName.SETRANGE(ReqWrkShtName."No. Of Lines", 0);
                    IF NOT ReqWrkShtName.FINDFIRST THEN
                        ERROR('You can not create a new Purchase Requisitions unless the Parts Post All Outstanding Requisitions!')
                    ELSE BEGIN
                        ReqWrkShtName."COF No." := Rec."Customer Order Form No.";
                        ReqWrkShtName."Customer No." := Rec."Customer No.";
                        ReqWrkShtName."Customer Name" := Rec."Customer Name";
                        ReqWrkShtName."Veh. Reg. No." := Rec."Vehicle Registration No.";
                        ReqWrkShtName."Request Type" := ReqWrkShtName."Request Type"::Parts;
                        ReqWrkShtName.MODIFY;
                    END;
                    CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
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
                            RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine.Quantity);
                            RequisitionLine.Description := CustOrderLine.Description;
                            RequisitionLine."Model Name" := Rec."Model Name";
                            RequisitionLine.VALIDATE("COF No.", CustOrderLine."Customer Order Form No.");
                            RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                            RequisitionLine.INSERT;
                        UNTIL CustOrderLine.NEXT = 0;
                    Rec."Request Batch Name" := ReqWrkShtName.Name;
                    CurrPage.UPDATE;
                    MESSAGE('Purchase Requests successfully created', ReqWrkShtName.Name);


                    CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
                    CustOrderLine.SETRANGE(CustOrderLine."Stock Status", CustOrderLine."Stock Status"::Insufficient);
                    CustOrderLine.SETRANGE(CustOrderLine."PR Raised", FALSE);
                    IF CustOrderLine.FINDSET THEN
                        REPEAT
                            CustOrderLine."PR Raised" := TRUE;
                            CustOrderLine.MODIFY;
                        UNTIL CustOrderLine.NEXT = 0;
                end;
            }
            action("Update Price")
            {
                Caption = 'Update Price';

                trigger OnAction()
                begin

                    COFLine.SETRANGE(COFLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF ItemRec.GET(COFLine."No.") THEN
                                IF (ItemRec."Inventory Posting Group" = 'N_PARTCONS') OR
                                (ItemRec."Inventory Posting Group" = 'N_PARTS') THEN BEGIN
                                    COFLine.VALIDATE(COFLine."No.");
                                    COFLine.VALIDATE("Unit Price", 1.6 * COFLine."Unit Cost");
                                    COFLine.MODIFY;
                                END;
                        UNTIL COFLine.NEXT = 0;
                    END;

                    COFLine.SETRANGE(COFLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF COFLine."No." = 'SUBLET' THEN BEGIN
                                COFLine.VALIDATE("Unit Price", 1.25 * COFLine."Unit Cost");
                                COFLine.MODIFY;
                            END;
                        UNTIL COFLine.NEXT = 0;
                    END;

                    MESSAGE('Price has been updated!');
                end;
            }
            action(" Add Markup")
            {
                Caption = ' Add Markup';

                trigger OnAction()
                begin

                    COFLine.SETRANGE(COFLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF ItemRec.GET(COFLine."No.") THEN
                                IF (ItemRec."Inventory Posting Group" = 'N_PARTCONS') OR
                                (ItemRec."Inventory Posting Group" = 'N_PARTS') THEN BEGIN
                                    COFLine.VALIDATE(COFLine."No.");
                                    COFLine.VALIDATE("Unit Price", 1.6 * COFLine."Unit Cost");
                                    COFLine.MODIFY;
                                END;
                        UNTIL COFLine.NEXT = 0;
                    END;

                    COFLine.SETRANGE(COFLine."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFLine.FINDFIRST THEN BEGIN
                        REPEAT
                            IF COFLine."No." = 'SUBLET' THEN BEGIN
                                COFLine.VALIDATE("Unit Price", 1.25 * COFLine."Unit Cost");
                                COFLine.MODIFY;
                            END;
                        UNTIL COFLine.NEXT = 0;
                    END;

                    MESSAGE('Price has been updated!');
                end;
            }
        }
    }

    var
        COFRec: Record 50119;
        ServiceOrder: Record 5900;
        SericeItemLine: Record 5901;
        ServiceLine: Record 5902;
        PurchSetup: Record 312;
        USERSETUP: Record 91;
        JIRec: Record 50119;
        CustOrderLine: Record 50122;
        CustOrderLine2: Record 50122;
        ServiceLine2: Record 5902;
        CustOrderTable: Record 50119;
        PurchOrderHeader: Record 38;
        PurchOrderLine: Record 39;
        NextLineNo: Integer;
        NoSeriesMgt: Record 308;
        VRI2: Record 50058;
        ItemRec: Record 27;
        COFRec2: Record 50119;
        VRIRec: Record 50058;
        COFLine: Record 50122;
        Text100: Label 'Do you want to create Purchase Order?';
        Text101: Label 'Action Aborted!';
        Text102: Label 'Do you want to create Store Requisition?';
        Text103: Label 'SIV already exists!';
        Text104: Label 'Do u want to create a Sublet LPO';

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
            ReqWrkShtName."COF No." := Rec."Customer Order Form No.";
            ReqWrkShtName."Customer No." := Rec."Customer No.";
            ReqWrkShtName."Customer Name" := Rec."Customer Name";
            ReqWrkShtName."Veh. Reg. No." := Rec."Vehicle Registration No.";
            ReqWrkShtName."Request Type" := ReqWrkShtName."Request Type"::Parts;
            ReqWrkShtName.MODIFY;
        END;
        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
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
                RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine.Quantity);
                RequisitionLine.Description := CustOrderLine.Description;
                RequisitionLine."Model Name" := Rec."Model Name";
                RequisitionLine.VALIDATE("COF No.", CustOrderLine."Customer Order Form No.");
                RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                RequisitionLine."Starting Date" := TODAY;
                RequisitionLine."Starting Time" := TIME;
                RequisitionLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        Rec."Request Batch Name" := ReqWrkShtName.Name;
        //CurrForm.UPDATE;
        MESSAGE('Purchase Requests successfully created', ReqWrkShtName.Name);


        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
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
            ReqWrkShtName."COF No." := Rec."Customer Order Form No.";
            ReqWrkShtName."Customer No." := Rec."Customer No.";
            ReqWrkShtName."Customer Name" := Rec."Customer Name";
            ReqWrkShtName."Veh. Reg. No." := Rec."Vehicle Registration No.";
            ReqWrkShtName.MODIFY;
        END;
        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
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
                RequisitionLine.VALIDATE(RequisitionLine.Quantity, CustOrderLine.Quantity);
                RequisitionLine.Description := CustOrderLine.Description;
                RequisitionLine."Model Name" := Rec."Model Name";
                RequisitionLine.VALIDATE("COF No.", CustOrderLine."Customer Order Form No.");
                RequisitionLine."PR Raised" := CustOrderLine."PR Raised";
                RequisitionLine.INSERT;
            UNTIL CustOrderLine.NEXT = 0;
        Rec."Est. Req. Batch Name" := ReqWrkShtName.Name;
        //CurrForm.UPDATE;
        MESSAGE('Purchase Requests successfully created', ReqWrkShtName.Name);


        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Item);
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
        ServiceOrder.SETRANGE(ServiceOrder."No.", Rec."Customer Order Form No.");
        IF ServiceOrder.FIND('-') THEN BEGIN
            CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
            CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Labour);
            CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
            IF CustOrderLine.FIND('-') THEN BEGIN
                REPEAT
                    ServiceLine.INIT;
                    ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                    ServiceLine."Document No." := Rec."Customer Order Form No.";
                    ServiceLine."Customer Class" := CustOrderLine."Customer Class";
                    ServiceLine."Line No." := CustOrderLine."Line No.";
                    ServiceLine."Service Item No." := Rec."Vehicle Registration No.";
                    ServiceLine.Type := ServiceLine.Type::Cost;
                    ServiceLine."Model Description" := CustOrderLine."Model Description";
                    IF CustOrderLine."No." <> '' THEN
                        ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                    ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                    ServiceLine."Variant Code" := CustOrderLine.Variant;
                    IF CustOrderLine.Quantity <> 0 THEN
                        ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                    ServiceLine.Description := CustOrderLine.Description;
                    ServiceLine.INSERT;
                UNTIL CustOrderLine.NEXT = 0;
                MESSAGE('Sundries and Labour Transferred');
            END
            ELSE
                MESSAGE('Labours are already on Parts Order!');
        END;

        ServiceOrder.SETRANGE(ServiceOrder."No.", Rec."Customer Order Form No.");
        IF ServiceOrder.FIND('-') THEN BEGIN
            CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
            CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::"Sundry Spares");
            CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
            IF CustOrderLine.FIND('-') THEN BEGIN
                REPEAT
                    ServiceLine.INIT;
                    ServiceLine."Document Type" := ServiceLine."Document Type"::Order;
                    ServiceLine."Document No." := Rec."Customer Order Form No.";
                    ServiceLine."Customer Class" := CustOrderLine."Customer Class";
                    ServiceLine."Line No." := CustOrderLine."Line No.";
                    ServiceLine."Service Item No." := Rec."Vehicle Registration No.";
                    ServiceLine.Type := ServiceLine.Type::Cost;
                    ServiceLine."Model Description" := CustOrderLine."Model Description";
                    IF CustOrderLine."No." <> '' THEN
                        ServiceLine.VALIDATE(ServiceLine."No.", CustOrderLine."No.");
                    ServiceLine.VALIDATE(ServiceLine."Location Code", CustOrderLine."Location Code");
                    ServiceLine."Variant Code" := CustOrderLine.Variant;
                    IF CustOrderLine.Quantity <> 0 THEN
                        ServiceLine.VALIDATE(ServiceLine.Quantity, CustOrderLine.Quantity);
                    ServiceLine.Description := CustOrderLine.Description;
                    ServiceLine.INSERT;
                UNTIL CustOrderLine.NEXT = 0;
                MESSAGE('Sundries and Labour Transferred');
            END
            ELSE
                MESSAGE('Labours are already on Parts Order!');
        END;

        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::Labour);
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FIND('-') THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;

        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", Rec."Customer Order Form No.");
        CustOrderLine.SETRANGE(CustOrderLine."Line Type", CustOrderLine."Line Type"::"Sundry Spares");
        CustOrderLine.SETRANGE(CustOrderLine."On Part Order", FALSE);
        IF CustOrderLine.FIND('-') THEN
            REPEAT
                CustOrderLine."On Part Order" := TRUE;
                CustOrderLine.MODIFY;
            UNTIL CustOrderLine.NEXT = 0;
    end;
}

