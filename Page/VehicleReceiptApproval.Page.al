page 50411 "Vehicle Receipt Approval"
{
    PageType = Card;
    SourceTable = "VRI Table";
    ApplicationArea = All;
    

    layout
    {
        area(content)
        {
            group(General)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field("VRI Inspector Code"; Rec."VRI Inspector Code")
                {
                }
                field("VRI Inspector Name"; Rec."VRI Inspector Name")
                {
                }
                field("VRI Inspector Address"; Rec."VRI Inspector Address")
                {
                }
                field("VRI Inspector Phone No."; Rec."VRI Inspector Phone No.")
                {
                }
                field("VRI Supervisor No"; Rec."VRI Supervisor No")
                {
                }
                field("VRI Supervisor Name"; Rec."VRI Supervisor Name")
                {
                }
            }
            group("Vehicle Details")
            {
                group("Step1")
                {
                    Caption = 'Step 1';
                    field("Item No."; Rec."Item No.")
                    {
                    }
                    field("Item Serial No."; Rec."Item Serial No.")
                    {
                    }
                    field("Model No."; Rec."Model No.")
                    {
                    }
                    field("Model Name"; Rec."Model Name")
                    {
                    }
                    field("Engine No."; Rec."Engine No.")
                    {
                    }
                    field("Key No."; Rec."Key No.")
                    {
                    }
                    field("Exterior Colour"; Rec."Exterior Colour")
                    {
                    }
                    field("Exterior Colour Name"; Rec."Exterior Colour Name")
                    {
                    }
                }
                group("Step2")
                {
                    Caption = 'Step 2';
                    field(Arrived; Rec.Arrived)
                    {
                    }
                    field("VRI Date"; Rec."VRI Date")
                    {
                    }
                    field("VRI Location"; Rec."VRI Location")
                    {
                    }
                    field("Date Of Arrival"; Rec."Date Of Arrival")
                    {
                    }
                    field("Time of Arrival"; Rec."Time of Arrival")
                    {
                    }
                    field(Odometer; Rec.Odometer)
                    {
                    }
                    field("Missing Accessories"; Rec."Missing Accessories")
                    {
                    }
                    field("BnP Problems"; Rec."BnP Problems")
                    {
                    }
                    field("GR Problems"; Rec."GR Problems")
                    {
                    }
                    field("Problem Vehicle"; Rec."Problem Vehicle")
                    {
                    }
                    field("Pass to Sales/Marketing"; Rec."Pass to Sales/Marketing")
                    {
                    }
                    field("Send For Approval"; Rec."Send For Approval")
                    {
                    }
                }
            }
            group("Vehicle Receipt Inspection")
            {
                group("Step21")
                {
                    Caption = 'Step 1';
                    field("Problem Statement"; Rec."Problem Statement")
                    {
                    }
                    field("O/Log Comment"; Rec."O/Log Comment")
                    {
                        Caption = 'O/L Comment';
                    }
                    field("Op/Log Approval Comment2"; Rec."Op/Log Approval Comment2")
                    {
                        Caption = 'O/L Approval Comment';
                    }
                    field("VRI Next Action"; Rec."VRI Next Action")
                    {
                    }
                }
                group("Step22")
                {
                    Caption = 'Step 2';
                    field("Send VRI Request"; Rec."Send VRI Request")
                    {
                    }
                    field("VRI Approval Name"; Rec."VRI Approval Name")
                    {
                        Caption = 'VRI Request Sent By';
                    }
                    field("VRI Request Date&Time"; Rec."VRI Request Date&Time")
                    {
                        Caption = 'VRI Request Date/Time';
                    }
                }
                group("Step23")
                {
                    Caption = 'Step 3';
                    field("Comment to Workshop"; Rec."Comment to Workshop")
                    {
                        Caption = 'Comment to Workshop';
                    }
                    field("Send to Workshop Aprroval"; Rec."Send to Workshop Aprroval")
                    {
                        Caption = 'Send to Workshop Approval';
                    }
                    field("Send to Workshop By"; Rec."Send to Workshop By")
                    {
                    }
                    field("Send to Workshp Date&time"; Rec."Send to Workshp Date&time")
                    {
                        Caption = 'Send to Workshop Date/Time';
                    }
                }
                group("Step24")
                {
                    Caption = 'Step 4';
                    field("Job Estimate Value"; Rec."Job Estimate Value")
                    {
                    }
                    field("Claim Nos"; Rec."Claim Nos")
                    {
                    }
                    field("VRI Approved Ok"; Rec."VRI Approved Ok")
                    {
                    }
                    field("VRI Approved Ok By"; Rec."VRI Approved Ok By")
                    {
                        Caption = 'VRI Approved OK By';
                    }
                    field("VRI Approved OK Date&Time"; Rec."VRI Approved OK Date&Time")
                    {
                        Caption = 'VRI Approved OK Date/Time';
                    }
                    field("Send for Est. Verification"; Rec."Send for Est. Verification")
                    {
                    }
                }
                group("Step25")
                {
                    Caption = 'Step 5';
                    field(Fixed; Rec.Fixed)
                    {
                    }
                    field("Not Fixed"; Rec."Not Fixed")
                    {
                    }
                    field("Approved for Sales&Mkt"; Rec."Approved for Sales&Mkt")
                    {
                        Caption = 'Approved for Sales and Marketing';
                    }
                    field("Approve for Sales&mkt By"; Rec."Approve for Sales&mkt By")
                    {
                        Caption = 'Approved By';
                    }
                    field("Approved Date&Time"; Rec."Approved Date&Time")
                    {
                        Caption = 'Approval Date/Time';
                    }
                }
            }
            group("Operation and Logistics")
            {
                group("Step31")
                {
                    Caption = 'Step 1';
                    field("Problem Statement from VRI"; Rec."Problem Statement from VRI")
                    {
                    }
                    field("O/Log Comment2"; Rec."O/Log Comment2")
                    {
                        Caption = 'O/L Comment';
                    }
                    field("Op./Log Approval Comment"; Rec."Op./Log Approval Comment")
                    {
                        Caption = 'O/L Approval Comment';
                    }
                    field("Logistic Action"; Rec."Logistic Action")
                    {
                        Caption = 'Logistics Action';
                    }
                    field("Send To VRI"; Rec."Send To VRI")
                    {
                    }
                    field("Op./Log.  Approval"; Rec."Op./Log.  Approval")
                    {
                        Caption = 'O/L Approval';
                    }
                    field("Op./Log Approval Name"; Rec."Op./Log Approval Name")
                    {
                        Caption = 'O/L Approval Name';
                    }
                    field("Log. Approval Date&Time"; Rec."Log. Approval Date&Time")
                    {
                        Caption = 'O/L Approval Date/Time';
                    }
                }
                group("Step32")
                {
                    Caption = 'Step 2';
                    field("Claim No."; Rec."Claim No.")
                    {
                    }
                    field("Job Estimate ValueII"; Rec."Job Estimate ValueII")
                    {
                        Caption = 'Job Estimate Value';
                    }
                    field("Estimate Approved"; Rec."Estimate Approved")
                    {
                    }
                    field("Estimate Approve By"; Rec."Estimate Approve By")
                    {
                    }
                    field("Estimate Approve Date&Time"; Rec."Estimate Approve Date&Time")
                    {
                        Caption = 'Estimate Approved Date/Time';
                    }
                    field("Responsible Customer"; Rec."Responsible Customer")
                    {
                    }
                    field("Responsible Customer Name"; Rec."Responsible Customer Name")
                    {
                    }
                }
            }
            group(Workshop)
            {
                field("Comment to WorkshopII"; Rec."Comment to WorkshopII")
                {
                    Caption = 'Comment to Workshop';
                }
                field("Open COF"; Rec."Open COF")
                {
                }
                field("COF No."; Rec."COF No")
                {
                    Caption = 'COF No.';
                }
                field("COF Created By"; Rec."COF Created By")
                {
                }
                field("COF Creation Date"; Rec."COF Creation Date")
                {
                }
                field("Responsible Customer1"; Rec."Responsible Customer")
                {
                    Caption = 'Responsible Customer';
                }
                field("Responsible Customer Name1"; Rec."Responsible Customer Name")
                {
                    Caption = 'Responsible Customer Name';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Customer Order")
            {
                Caption = 'Customer Order';
                Image = ServiceItemWorksheet;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 50393;
                RunPageLink = "Customer Order Form No." = FIELD("COF No");
            }
        }
    }
}

