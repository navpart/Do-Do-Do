page 50393 "Customer Order Form Card"
{
    Caption = 'Customer Order Form Card';
    PageType = Card;
    SourceTable = "Customer Order Table.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
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
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                }
                field("Confirmation Time"; Rec."Confirmation Time")
                {
                }
                field("Confirmation Staff Name"; Rec."Confirmation Staff Name")
                {
                }
            }
            group("Vehicle Details")
            {
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Model No"; Rec."Model No")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field("(Engine No)"; Rec."(Engine No)")
                {
                    Caption = 'Engine No.';
                }
                field("Odometer Reading At Appointmen"; Rec."Odometer Reading At Appointmen")
                {
                    Caption = 'Odotmeter Reading';
                }
            }
            group("Customer Details")
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Address2; Rec.Address2)
                {
                }
                field(Home; Rec.Home)
                {
                }
                field(Business; Rec.Business)
                {
                }
                field(Mobile; Rec.Mobile)
                {
                }
                field("Contact Home"; Rec."Contact Home")
                {
                }
                field("Contact Business"; Rec."Contact Business")
                {
                }
                field("Contact Mobile"; Rec."Contact Mobile")
                {
                }
                field("E-mail"; Rec."E-mail")
                {
                }
            }
            group("Service Details")
            {
                field("Service Location"; Rec."Service Location")
                {
                }
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                }
                field(Maintenance2; Rec.Maintenance2)
                {
                    Caption = 'Maintenance';
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field("Diag/Est"; Rec."Diag/Est")
                {
                    Caption = 'Diagnosis/Estimate';
                }
                field(Internal; Rec.Internal)
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("B & P"; Rec."B & P")
                {
                }
                field("Customer Waiting"; Rec."Customer Waiting")
                {
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                }
                field("Customer Complaint"; Rec."Customer Complaint")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Estimated Job Time"; Rec."Estimated Job Time")
                {
                }
                field(Estimation; Rec.Estimation)
                {
                }
                field("Cost Changed"; Rec."Cost Changed")
                {
                }
                field("Time Changed"; Rec."Time Changed")
                {
                }
                field("Appointment Offering 1 Date"; Rec."Appointment Offering 1 Date")
                {
                }
                field("Appointment Offering 1 Time"; Rec."Appointment Offering 1 Time")
                {
                }
                field("Appointment Offering 2 Date"; Rec."Appointment Offering 2 Date")
                {
                }
                field("Appointment Offering 2 Time"; Rec."Appointment Offering 2 Time")
                {
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                }
                field("Appointment Staff Name"; Rec."Appointment Staff Name")
                {
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
            }
            group("Service Items")
            {
            }
            part(CustOrderLine; "Customer Order Item")
            {
                SubPageLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
            }
            group("Process Confirmation")
            {
                field("Appt Confirmed"; Rec."Appt Confirmed")
                {
                    Caption = 'Appointment Confirmed';
                }
                field("For Part Order"; Rec."For Part Order")
                {
                }
                field("For Part Arrival"; Rec."For Part Arrival")
                {
                }
                field("For Production"; Rec."For Production")
                {
                }
                field("Service Order No."; Rec."Service Order No.")
                {
                }
                field("Request Batch Name"; Rec."Request Batch Name")
                {
                }
                field("Est. Req. Batch Name"; Rec."Est. Req. Batch Name")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Create Requisition")
            {
                Caption = 'Create Requisition';
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CreatePurchaseRequisition;
                end;
            }
            action("Order Parts")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    COFRec.GET(Rec."Customer Order Form No.");
                    IF NOT CONFIRM('Are you sure you want to Reserve these Parts for Service?') THEN
                        MESSAGE('Material Request Cancelled')
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
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 12;

                trigger OnAction()
                var
                    COF: Record 50071;
                begin
                end;
            }
            action("Create Sublet")
            {
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Delivered THEN
            CurrPage.EDITABLE := FALSE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Service Type" := Rec."Service Type"::"General Workshop";
    end;

    var
        COFRec: Record 50119;
        Text100: Label 'Do you want to create Purchase Order?';
        Text101: Label 'Action Aborted!';
        Text102: Label 'Do you want to create Store Requisition?';
        Text103: Label 'SIV already exists!';
        ServiceOrder: Record 5900;
        SericeItemLine: Record 5901;
        SeviceLine: Record 5902;
        PurchSetup: Record 312;
        USERSETUP: Record 91;
        JIRec: Record 50119;
        CustOrderLine: Record 50122;
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
        MESSAGE('Purchase requests has been successfully created!', ReqWrkShtName.Name);

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

