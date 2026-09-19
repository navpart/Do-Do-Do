page 80038 "Maintenance Reminder Card"
{
    PageType = Card;
    SourceTable = "Service AppointmentsX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                group("1. Vehicle Details")
                {
                    field("Appointment No."; Rec."Appointment No.")
                    {
                    }
                    field("COF No."; Rec."COF No.")
                    {
                    }
                    field("Service Item"; Rec."Service Item")
                    {
                    }
                    field("Engine No."; Rec."Engine No.")
                    {
                    }
                    field(VIN; Rec.VIN)
                    {
                    }
                    field("Model Code"; Rec."Model Code")
                    {
                    }
                    field("Model Year"; Rec."Model Year")
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
                    field("Fixed Asset No."; Rec."Fixed Asset No.")
                    {
                    }
                    field("Fixed Asset Description"; Rec."Fixed Asset Description")
                    {
                    }
                }
                group("2. Customer Details")
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
                    field("Contact Person"; Rec."Contact Person")
                    {
                    }
                    field(Mobile; Rec.Mobile)
                    {
                    }
                    field(Email; Rec.Email)
                    {
                    }
                    field("Phone No. 1"; Rec."Phone No. 1")
                    {
                        Caption = 'Phone No.';
                    }
                }
            }
            group("Service Details")
            {
                group("3. Service Details")
                {
                    field("Operation Code"; Rec."Operation Code")
                    {
                    }
                    field(Description; Rec.Description)
                    {
                    }
                    field("Expected Service Duration"; Rec."Expected Service Duration")
                    {
                    }
                    field(Estimate; Rec.Estimate)
                    {
                    }
                    field(VAT; Rec.VAT)
                    {
                    }
                    field("Estimate Incl. VAT"; Rec."Estimate Incl. VAT")
                    {
                    }
                    field("Odometer At Appointment"; Rec."Odometer At Appointment")
                    {
                    }
                    field("Service Due Date"; Rec."Service Due Date")
                    {
                    }
                    field("Next Call Date"; Rec."Next Call Date")
                    {
                    }
                    field("Agreed Date"; Rec."Agreed Date")
                    {
                    }
                    field("Agreed Time"; Rec."Agreed Time")
                    {
                    }
                    field("Call Type"; Rec."Call Type")
                    {
                    }
                    field("Appointment Status"; Rec."Appointment Status")
                    {
                    }
                    field(Comment; Rec.Comment)
                    {
                    }
                }
                group("4. Customer's Requests")
                {
                    field(Appointment; Rec.Appointment)
                    {
                    }
                    field("Walk-In"; Rec."Walk-In")
                    {
                    }
                    field(Maintenance; Rec.Maintenance)
                    {
                    }
                    field("General Repair"; Rec."General Repair")
                    {
                        Caption = 'General Repair (Diagnosis)';
                    }
                    field("Body and Paint"; Rec."Body and Paint")
                    {
                    }
                    field(Internal; Rec.Internal)
                    {
                    }
                    field(Warranty; Rec.Warranty)
                    {
                    }
                }
                group("5. Job Details")
                {
                    field("Job Detail"; Rec."Job Details")
                    {
                        Caption = 'Job Detail';
                        MultiLine = true;
                    }
                    field(Teams; Rec.Teams)
                    {
                    }
                    field("Stall No."; Rec."Stall No.")
                    {
                    }
                    field("Key Assigned No."; Rec."Key Assigned No.")
                    {
                    }
                    field("Service Advisor Code"; Rec."Service Advisor Code")
                    {
                    }
                    field("Service Advisor's Name"; Rec."Service Advisor's Name")
                    {
                    }
                }
                group("6. Offering")
                {
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
                    field("Customer's Preferred Date"; Rec."Customer's Preferred Date")
                    {
                    }
                    field("Customer's Preferred Time"; Rec."Customer's Preferred Time")
                    {
                    }
                    field("Delivery Date"; Rec."Delivery Date")
                    {
                    }
                    field("Delivery Time"; Rec."Delivery Time")
                    {
                    }
                }
            }
            group("Other Details")
            {
                field("Booking Date"; Rec."Booking Date")
                {
                }
                field("Booking Time"; Rec."Booking Time")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
            }
            group(Workflow)
            {
                field("Days Before Due Date"; Rec."Days Before Due Date")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("<Page 80007>")
            {
                Caption = 'Service History';
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Customer Order Form Card";
                RunPageLink = "Vehicle Registration No." = FIELD("Service Item");
            }
            action("Reminder Calls")
            {
                Caption = 'Reminder Calls';
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //RunObject = Page 50555;
                //RunPageLink = Field1 = FIELD("Appointment No.");
            }
            action("SSC/SC")
            {
                Caption = 'SSC/SC';
                Image = Entries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50354;
                RunPageLink = VMI = FIELD("Service Item");
            }
            action(EstimateAction)
            {
                Caption = 'Estimate';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ViewEstimate;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.VALIDATE("Customer No.");

        Rec.CALCFIELDS("Total Hour Available 4 day");
        ServiceSetRec.GET;
        Rec."Total Appointment Time" := Rec."Total Hour Available 4 day" * (ServiceSetRec."Appointment %" / 100);
        Rec."Total Walk in Time" := (Rec."Total Hour Available 4 day" - Rec."Total Appointment Time" - ServiceSetRec."Carry Over");
        Rec."Total Rem W/I Time" := Rec."Total Walk in Time" - Rec."Asst.Technician Hour";
        Rec."Total Rem Appt Time" := Rec."Total Appointment Time" - Rec."Technician Hour";

        IF Rec."Customer's Requests" = Rec."Customer's Requests"::Appointment THEN
            Rec."Remaining Hours" := Rec."Man Hour Per Day" - (Rec."Technician Hour" + Rec."Asst.Technician Hour")
        ELSE
            Rec."Remaining Hours" := Rec."Man Hour Per Day" - (Rec."Technician Hour" + Rec."Asst.Technician Hour");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.VALIDATE("Next Call Date", TODAY);
        Rec."User ID" := USERID;
        //UserSetup.GET(USERID);
        Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Filter";
        Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Filter";
        Rec."Serving Store" := UserSetup."Location Code";
    end;

    var
        SerAppSch: Record 50114;
        ServiceSetRec: Record 5911;
        "SSC/SC": Record 50081;
        VDSNew: Code[10];
        VISNew: Integer;
        CustOrderLine: Record 50122;
        COFRec: Record 50119;
        UserSetup: Record 91;


    procedure ViewEstimate()
    begin
    end;
}

