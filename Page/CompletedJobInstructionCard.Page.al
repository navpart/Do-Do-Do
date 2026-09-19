page 70077 "Completed Job Instruction Card"
{
    DeleteAllowed = false;
    Editable = false;
    SourceTable = "Customer Order Table.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Job Instruction No."; Rec."Job Instruction No.")
                {
                    Caption = 'Date';
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
                field(Address; Rec.Address)
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Vehicle Registered Date"; Rec."Vehicle Registered Date")
                {
                }
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
                field(o; Rec."E-mail")
                {
                }
                field("Additional Job Confirmation"; Rec."Additional Job Confirmation")
                {
                }
                field("Service Order No."; Rec."Service Order No.")
                {
                }
                field("Estimated Completion Date"; Rec."Estimated Completion Date")
                {
                }
                field("Estimated Completion Time"; Rec."Estimated Completion Time")
                {
                }
                field("Key Assigned No."; Rec."Key Assigned No.")
                {
                }
                field("Stall No."; Rec."Stall No.")
                {
                }
                field("Job Start Date"; Rec."Job Start Date")
                {
                }
                field("Job Start Time"; Rec."Job Start Time")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("Car Wash"; Rec."Car Wash")
                {
                }
            }
            part(Lines; 50241)
            {
                Caption = 'Lines';
                SubPageLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
            }
            group("Job Completion")
            {
                Caption = 'Preparation for Delivery';
                field("Completion Changed D ate"; Rec."Completion Changed Date")
                {
                }
                field("Completion Changed T ime"; Rec."Completion Changed Time")
                {
                }
                field("CC D ate"; Rec."CC Date")
                {
                    Caption = 'Customer Contact Date';
                }
                field("CC T ime"; Rec."CC Time")
                {
                    Caption = 'Customer Contact Time';
                }
                field("Delivery Changed D ate"; Rec."Delivery Changed Date")
                {
                }
                field("Delivery Changed T ime"; Rec."Delivery Changed Time")
                {
                }
                field("CC Staff N ame"; Rec."CC Staff Name")
                {
                    Caption = ' Staff Name';
                }
                field("JC D ate"; Rec."JC Date")
                {
                    Caption = 'Job Completion Date';
                }
                field("JC T ime"; Rec."JC Time")
                {
                    Caption = 'Job Completion Time';
                }
                field("Actual Hours Cloc ked"; Rec."Actual Hours Clocked")
                {
                }
                field("Technician N ame"; Rec."Technician Name")
                {
                }
                field("Other Findings/Adv ice"; Rec."Other Findings/Advice")
                {
                }
                field(Memo; Rec.Memo)
                {
                }
                field("QC St aff"; Rec."QC Staff")
                {
                    Caption = 'Quality Control Staff Name';
                }
                field("Quality Control Staff C ode"; Rec."Quality Control Staff Code")
                {
                }
                field(Cleanliness; Rec.Cleanliness)
                {
                }
                field(Cleanliness2; Rec.Cleanliness2)
                {
                }
                field("Courtesy Items Remo val"; Rec."Courtesy Items Removal")
                {
                }
                field("Courtesy Items Remov al2"; Rec."Courtesy Items Removal2")
                {
                }
                field("Outer Minor P / Sea t P"; Rec."Outer Minor P / Seat P")
                {
                }
                field("Outer Minor P / Seat  P2"; Rec."Outer Minor P / Seat P2")
                {
                }
                field("Clock Adj / Radio Sett ing"; Rec."Clock Adj / Radio Setting")
                {
                }
                field("Clock Adj / Radio Setti ng2"; Rec."Clock Adj / Radio Setting2")
                {
                }
                field("Pre-d C Staff N ame"; Rec."Pre-d C Staff Name")
                {
                    Caption = 'Staff Name';
                }
                field("Pre-d C Confirmed  by"; Rec."Pre-d C Confirmed by")
                {
                    Caption = 'Confirmed By';
                }
                field("Job CN D ate"; Rec."Job CN Date")
                {
                    Caption = 'Job Completion Date';
                }
                field("Job CN T ime"; Rec."Job CN Time")
                {
                    Caption = 'Job Completion Time';
                }
                field("Job CN Staff N ame"; Rec."Job CN Staff Name")
                {
                    Caption = 'Job Notification Completed By';
                }
                group(Control1)
                {
                    field("Delivery Staff N ame"; Rec."Delivery Staff Name")
                    {
                        Caption = 'Staff Name';
                    }
                    field("Delivery Custo mer"; Rec."Delivery Customer")
                    {
                        Caption = 'Customer';
                    }
                    field("Appt Confir med"; Rec."Appt Confirmed")
                    {
                        Caption = 'Appt Confirmed';
                    }
                    field("For Part Or der"; Rec."For Part Order")
                    {
                        Caption = 'Part Order';
                    }
                    field("For Part Arri val"; Rec."For Part Arrival")
                    {
                        Caption = 'Part Arrival';
                    }
                    field("For Product ion"; Rec."For Production")
                    {
                        Caption = 'Production';
                    }
                    field("For Invo ice"; Rec."For Invoice")
                    {
                        Caption = 'Invoice';
                    }
                    field("Next Job T ype"; Rec."Next Job Type")
                    {
                        Caption = 'Next Job Type';
                    }
                    field("Next Service D ate"; Rec."Next Service Date")
                    {
                        Caption = 'Next Service Date';
                    }
                    field(Delivered; Rec.Delivered)
                    {
                        Caption = 'Delivered';
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print Estimate II")
            {
                Caption = 'Print Estimate II';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50403, TRUE, TRUE, JIRec);
                end;
            }
            action("Print COF")
            {
                Caption = 'Print COF';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF COFRec.FINDFIRST THEN
                        REPORT.RUNMODAL(50305, TRUE, TRUE, COFRec);
                end;
            }
            action("Print Job Instruction")
            {
                Caption = 'Print Job Instruction';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    JIRec.SETRANGE(JIRec."Customer Order Form No.", Rec."Customer Order Form No.");
                    IF JIRec.FIND('-') THEN
                        REPORT.RUNMODAL(50312, TRUE, TRUE, JIRec);
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
}

