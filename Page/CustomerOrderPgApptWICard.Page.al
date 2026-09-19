page 70086 "Customer Order Pg Appt/WI Card"
{
    SourceTable = "Customer Order Table.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Expected Reception")
            {
                Caption = 'Expected Reception';
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
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
            }
            group("Expected Delivery")
            {
                Caption = 'Expected Delivery';
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
                    Caption = 'Delivery Type';
                }
            }
            group("Customer Details")
            {
                Caption = 'Customer Details';
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Update Customer Record"; Rec."Update Customer Record")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Telephone No."; Rec."Telephone No.")
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
                field("(Engine No)"; Rec."(Engine No)")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
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
                field(Maintenance2; Rec.Maintenance2)
                {
                }
                field(Maintenance; Rec.Maintenance)
                {
                    Caption = 'Km/mile';
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field("Diag/Est"; Rec."Diag/Est")
                {
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
                field("Customer Complaint"; Rec."Customer Complaint")
                {
                }
                field("Key Assigned No."; Rec."Key Assigned No.")
                {
                }
                field("Stall No."; Rec."Stall No.")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
            }
            group("Job Details1")
            {
                Caption = 'Job Details';
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Estimated Job Time"; Rec."Estimated Job Time")
                {
                }
                field("Cost Changed"; Rec."Cost Changed")
                {
                }
                field("Time Changed"; Rec."Time Changed")
                {
                }
                field("Total Appointment Time"; Rec."Total Appointment Time")
                {
                }
                field("Total Rem Appt Time"; Rec."Total Rem Appt Time")
                {
                }
                field("Total Rem W/I Time"; Rec."Total Rem W/I Time")
                {
                }
            }
            group("Customer Order Form")
            {
                Caption = 'Customer Order Form';
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Customer Order Form Date"; Rec."Customer Order Form Date")
                {
                }
                field("Job Opened"; Rec."Job Opened")
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
                field("Estimate No."; Rec."Estimate No.")
                {
                }
                field("Vehicle Registered Date"; Rec."Vehicle Registered Date")
                {
                }
                field("FA No."; Rec."FA No.")
                {
                }
            }
            group("Service Detail")
            {
                Caption = 'Service Detail';
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
                field("Job No.2"; Rec."Job No.2")
                {
                }
                field("Job No.3"; Rec."Job No.3")
                {
                }
                field(Odometer1; Rec.Odometer1)
                {
                }
                field(Odometer2; Rec.Odometer2)
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
            }
            group("Appointment Booking")
            {
                Caption = 'Appointment Booking';
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                }
                field("Appointment Staff Name"; Rec."Appointment Staff Name")
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
                field("Next Job Type"; Rec."Next Job Type")
                {
                }
                field("Next Service Date"; Rec."Next Service Date")
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
                SubPageLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
            }
            group(Confirmation)
            {
                Caption = 'Confirmation';
                field("Additional Job Confirmation"; Rec."Additional Job Confirmation")
                {
                }
                field("Car Wash"; Rec."Car Wash")
                {
                }
                field(Valuables; Rec.Valuables)
                {
                }
                field("Present Estimate w/Explanation"; Rec."Present Estimate w/Explanation")
                {
                }
                field("Replace Parts Keep"; Rec."Replace Parts Keep")
                {
                }
            }
            part("SSC/SC Details"; 70069)
            {
                Caption = 'SSC/SC Details';
            }
            group("Courtesy Items")
            {
                Caption = 'Courtesy Items';
                field("Seat Cover"; Rec."Seat Cover")
                {
                }
                field("Floor Mat"; Rec."Floor Mat")
                {
                }
            }
            group("Payment Method")
            {
                Caption = 'Payment Method';
                field(Cheque; Rec.Cheque)
                {
                }
                field(Cash; Rec.Cash)
                {
                }
                field("If Other Method"; Rec."If Other Method")
                {
                    Caption = 'Other';
                }
            }
            group(Reception)
            {
                Caption = 'Reception';
                field("Walk Around Reception Date"; Rec."Walk Around Reception Date")
                {
                }
                field("Walk Around Reception Time"; Rec."Walk Around Reception Time")
                {
                }
                field("Reception Staff Name"; Rec."Reception Staff Name")
                {
                }
                field(Memo; Rec.Memo)
                {
                }
                field("Additional Job Details"; Rec."Additional Job Details")
                {
                }
                field("Odometer Reading At Reception"; Rec."Odometer Reading At Reception")
                {
                }
            }
            group(Update)
            {
                Caption = 'Update';
                field("Order Line Updated"; Rec."Order Line Updated")
                {
                }
                field("Appt Confirmed"; Rec."Appt Confirmed")
                {
                    Caption = 'Appt Confirmation';
                }
                field("For Part Order"; Rec."For Part Order")
                {
                    Caption = 'Part Ordered';
                }
                field("For Part Arrival"; Rec."For Part Arrival")
                {
                    Caption = 'Part Arrival';
                }
                field("For Production"; Rec."For Production")
                {
                    Caption = 'For Production';
                }
                field(Estimation; Rec.Estimation)
                {
                }
                field("Service Order No."; Rec."Service Order No.")
                {
                    Caption = 'Parts Order No';
                }
                field("Request Batch Name"; Rec."Request Batch Name")
                {
                }
                field("Parts Arrived"; Rec."Parts Arrived")
                {
                }
                field("Est. Req. Batch Name"; Rec."Est. Req. Batch Name")
                {
                }
                field("VRI Estimate Approved"; Rec."VRI Estimate Approved")
                {
                }
                field("Transfer to TA"; Rec."Transfer to TA")
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
                Caption = 'Print Job Instruction';
                Image = Print;

                trigger OnAction()
                begin
                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FIND('-') THEN
                        REPORT.RUNMODAL(50312, TRUE, TRUE, COFRec);
                end;
            }
            action("Print Job Instruction Labour")
            {
                Caption = 'Print Job Instruction Labour';
                Image = Print;

                trigger OnAction()
                begin
                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FIND('-') THEN
                        REPORT.RUNMODAL(50313, TRUE, TRUE, COFRec);
                end;
            }
            action("Print COF")
            {
                Caption = 'Print COF';
                Image = Print;

                trigger OnAction()
                begin
                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FIND('-') THEN
                        REPORT.RUNMODAL(50305, TRUE, TRUE, COFRec);
                end;
            }
            action("Print Estimate II")
            {
                Caption = 'Print Estimate II';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    //JIRec.SETRANGE(JIRec."No.","Customer Order Form No.");
                    //IF JIRec.FIND('-') THEN
                    //REPORT.RUNMODAL(50403,TRUE,TRUE,JIRec);


                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50403, TRUE, TRUE, JIRec);
                end;
            }
            action("Print Estimate 2")
            {
                Caption = 'Print Estimate 2';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50375, TRUE, TRUE, JIRec);
                end;
            }
        }
    }

    var
        COFRec: Record 50119;
        ServiceOrder: Record 5900;
        SericeItemLine: Record 5901;
        SeviceLine: Record 5902;
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
        Text100: Label 'Do you want to create Purchase Order?';
        Text101: Label 'Action Aborted!';
        Text102: Label 'Do you want to create Store Requisition?';
        Text103: Label 'SIV already exists!';
        Text104: Label 'Do you want to create Sublet LPO?';
}

