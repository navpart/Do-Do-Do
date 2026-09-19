page 80040 "Appointment Card"
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
                    Editable = false;
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
                    }
                }
            }
            group("Service Details")
            {
                group("3. Service Details")
                {
                    field("Job Type"; Rec."Job Type")
                    {
                    }
                    field("Job Detail"; Rec."Job Details")
                    {
                        Caption = 'Job Detail';
                        MultiLine = true;
                    }
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
                    field("Agreed Date"; Rec."Agreed Date")
                    {
                    }
                    field("Agreed Time"; Rec."Agreed Time")
                    {
                    }
                    field("Call Type"; Rec."Call Type")
                    {
                        ShowMandatory = true;
                        Style = Attention;
                        StyleExpr = TRUE;
                    }
                    field("Appointment Status"; Rec."Appointment Status")
                    {
                        ShowMandatory = true;
                    }
                    field("COF No."; Rec."COF No.")
                    {
                        Editable = false;
                    }
                    field(Comment; Rec.Comment)
                    {
                        MultiLine = true;
                    }
                }
                group("4. Customer's Requests")
                {
                    field(Appointment; Rec.Appointment)
                    {
                    }
                    field(Maintenance; Rec.Maintenance)
                    {
                    }
                    field("Walk-In"; Rec."Walk-In")
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
                    field("Customer Waiting"; Rec."Customer Waiting")
                    {
                    }
                    field("Repeat Repair"; Rec."Repeat Repair")
                    {
                    }
                }
                group("5. Offering")
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
                group("6. Service Adviser/Technician")
                {
                    field("Service Advisor Code"; Rec."Service Advisor Code")
                    {
                    }
                    field("Service Advisor's Name"; Rec."Service Advisor's Name")
                    {
                    }
                    field("Technician Code"; Rec."Technician Code")
                    {
                    }
                    field("Technician Name"; Rec."Technician Name")
                    {
                    }
                    field("Technician Hour"; Rec."Technician Hour")
                    {
                    }
                    field("Asst. Technician Code"; Rec."Asst. Technician Code")
                    {
                    }
                    field("Asst. Technician Name"; Rec."Asst. Technician Name")
                    {
                    }
                    field("Asst.Technician Hour"; Rec."Asst.Technician Hour")
                    {
                    }
                }
                group("7. Service Bay")
                {
                    field("Serving Store"; Rec."Serving Store")
                    {
                    }
                    field("Service Slot"; Rec."Service Slot")
                    {
                    }
                    field("Stall No."; Rec."Stall No.")
                    {
                    }
                    field("Key Assigned No."; Rec."Key Assigned No.")
                    {
                    }
                }
            }
            group("Misc.")
            {
                Caption = 'Misc.';
                field("Booking Date"; Rec."Booking Date")
                {
                }
                field("Booking Time"; Rec."Booking Time")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Check SSC"; Rec."Check SSC")
                {
                }
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
            action("Service History")
            {
                Caption = 'Service History';
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 80021;
                RunPageLink = "Vehicle Registration No." = FIELD("Service Item"),
                              Delivered = CONST(true);
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
                        MESSAGE(Text001);
                end;
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
            action("Customer Order")
            {
                Caption = 'Customer Order';
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50393;
                RunPageLink = "Customer Order Form No." = FIELD("COF No.");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.VALIDATE("Customer No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IF Rec."Appointment No." = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("Appointment Nos.");
            Rec."No. Series" := SalesSetup."Appointment Nos.";
            
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            NoSeriesMgt.GetNextNo(Rec."No. Series");
        END;

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
        ServCamp: Record 50046;
        VDSNew: Code[10];
        VISNew: Integer;
        CustOrderLine: Record 50122;
        COFRec: Record 50119;
        UserSetup: Record 91;
        Text001: Label 'SSC/SC details are not available.';
        SalesSetup: Record 311;
        NoSeriesMgt: Codeunit "No. Series";

    local procedure ViewEstimate()
    begin
    end;
}

