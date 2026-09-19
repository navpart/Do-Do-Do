page 70066 "Service Appointment Mgt. Card"
{
    PageType = Card;
    SourceTable = "Service Appointment Scheduled";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Vehicle Details")
            {
                field("Service Item"; Rec."Service Item")
                {
                }
                field("Service Code"; Rec."Service Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Department';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch';
                }
                field("Service Due Projected Date"; Rec."Service Due Projected Date")
                {
                }
                field("Service Expected Duration"; Rec."Service Expected Duration")
                {
                }
                field("Next Call Date."; Rec."Next Call Date.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(VMI; Rec.VMI)
                {
                }
                field(VIS; Rec.VIS)
                {
                }
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Contact E-Mail"; Rec."Contact E-Mail")
                {
                }
                field("Send Appointment Reminder"; Rec."Send Appointment Reminder")
                {
                }
                field("Walk-In"; Rec."Walk-In")
                {
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
                field("Contact Person"; Rec."Contact Person")
                {
                }
                field("Phone No 1."; Rec."Phone No 1.")
                {
                }
                field("Phone No. 2."; Rec."Phone No. 2.")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Send Appointment Message"; Rec."Send Appointment Message")
                {
                }
            }
            group("Service History")
            {
                Caption = 'Service History';
                grid(Control1)
                {
                    GridLayout = Rows;
                    group(Control2)
                    {
                        field(Date1; Rec.Date1)
                        {
                            Caption = 'Date';
                        }
                        field("Job No.1"; Rec."Job No.1")
                        {
                            Caption = 'Job No.';
                        }
                        field(Odometer1; Rec.Odometer1)
                        {
                            Caption = 'Odometer Reading';
                        }
                        field("Job Description1"; Rec."Job Description1")
                        {
                            Caption = 'Description';
                        }
                    }
                    group(Control3)
                    {
                        field(Date2; Rec.Date2)
                        {
                            ShowCaption = false;
                        }
                        field("Job No.2"; Rec."Job No.2")
                        {
                            ShowCaption = false;
                        }
                        field(Odometer2; Rec.Odometer2)
                        {
                            ShowCaption = false;
                        }
                        field("Job Description2"; Rec."Job Description2")
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control4)
                    {
                        field(Date3; Rec.Date3)
                        {
                            ShowCaption = false;
                        }
                        field("Job No.3"; Rec."Job No.3")
                        {
                            ShowCaption = false;
                        }
                        field(Odometer3; Rec.Odometer3)
                        {
                            ShowCaption = false;
                        }
                        field("Job Description3"; Rec."Job Description3")
                        {
                            ShowCaption = false;
                        }
                    }
                }
            }
            group("M. Reminder Calls")
            {
                Caption = 'Reminder Calls';
                grid(Control5)
                {
                    GridLayout = Rows;
                    group(Control6)
                    {
                        field("First Call Date"; Rec."First Call Date")
                        {
                        }
                        field("First Call No."; Rec."First Call No.")
                        {
                        }
                        field("First Call Contact"; Rec."First Call Contact")
                        {
                        }
                        field("First Call Response"; Rec."First Call Response")
                        {
                        }
                    }
                    group(Control7)
                    {
                        field("Repeat Call Date"; Rec."Repeat Call Date")
                        {
                        }
                        field("Repeat Call No."; Rec."Repeat Call No.")
                        {
                        }
                        field("Repeat Call Contact"; Rec."Repeat Call Contact")
                        {
                        }
                        field("Repeat Call Response"; Rec."Repeat Call Response")
                        {
                        }
                    }
                    group(Control8)
                    {
                        field("Last Call Date"; Rec."Last Call Date")
                        {
                        }
                        field("Last Call No."; Rec."Last Call No.")
                        {
                        }
                        field("Last Call Response"; Rec."Last Call Response")
                        {
                        }
                        field("Last Call Contact"; Rec."Last Call Contact")
                        {
                        }
                    }
                }
                field("Expected Reception Date"; Rec."Expected Reception Date")
                {
                }
                field("Expected Reception Time"; Rec."Expected Reception Time")
                {
                }
                field("Response Action"; Rec."Response Action")
                {
                }
                field("Call Type"; Rec."Call Type")
                {
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
            }
            group("Other Details")
            {
                field("Customer Order Form Date"; Rec."Customer Order Form Date")
                {
                }
                field("Customer's Preferred Date"; Rec."Customer's Preferred Date")
                {
                }
                field("Customer's Preferred Time"; Rec."Customer's Preferred Time")
                {
                }
                field("Man Hour Per Day"; Rec."Man Hour Per Day")
                {
                }
                field("Service Slot"; Rec."Service Slot")
                {
                }
                field("Serving Store"; Rec."Serving Store")
                {
                }
                field("Service Type"; Rec."Service Type")
                {
                }
                field("Remaining Hours"; Rec."Remaining Hours")
                {
                }
                field("Total Appointment Time"; Rec."Total Appointment Time")
                {
                }
                field("Total Rem Appt Time"; Rec."Total Rem Appt Time")
                {
                }
                field("Total Walk in Time"; Rec."Total Walk in Time")
                {
                }
                field("Total Rem W/I Time"; Rec."Total Rem W/I Time")
                {
                }
                field("Vehicle Driven by"; Rec."Vehicle Driven by")
                {
                }
                field("For Appt Confirmation"; Rec."For Appt Confirmation")
                {
                }
                field("Starting Hour"; Rec."Starting Hour")
                {
                }
                field("Ending Hour"; Rec."Ending Hour")
                {
                }
                field("Appointment Allocated Hr"; Rec."Appointment Allocated Hr")
                {
                }
                field("Walk-In Allocated Hr"; Rec."Walk-In Allocated Hr")
                {
                }
                field("Total Hour Available 4 day"; Rec."Total Hour Available 4 day")
                {
                }
                field(Remaining; Rec.Remaining)
                {
                }
                field("Technician Code"; Rec."Technician Code")
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Generate COF")
            {
                Caption = 'Generate COF';
                Image = GetEntries;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Expected Reception Date");
                    Rec.TESTFIELD("Expected Reception Time");
                    /*
                    SerAppSch.GET(CustOrderLine."Customer Order Form No.");  //Dada: To prevent the error msg.
                    CustOrderLine.SETFILTER("Customer Order Form No.",'%1','');
                    IF CustOrderLine.FINDFIRST THEN REPEAT
                    CustOrderLine.DELETE;
                    UNTIL
                    CustOrderLine.NEXT =0;
                    */
                    IF Rec."Appointment Status" = 1 THEN
                        Rec.GenCOF
                    ELSE
                        ERROR('Please confirm this appointment before generating customer order form');
                    MESSAGE('Indicate if you need to confirm this appointment later!');

                end;
            }
            action("Print COF")
            {
                Caption = 'Print COF';
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUNMODAL(50305, TRUE, TRUE, COFRec);
                end;
            }
        }
    }

    var
        COFRec: Record 50119;
}

