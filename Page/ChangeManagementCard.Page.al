page 50611 "Change Management Card"
{
    PageType = Card;
    SourceTable = "Change Management";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Visible = true;
                }
                field("Requester Code"; Rec."Requester Code")
                {
                }
                field("Requesters Name"; Rec."Requesters Name")
                {
                }
                field("Requesters Location"; Rec."Requesters Location")
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Request Category"; Rec."Request Category")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Previous Mthd Used"; Rec."Previous Mthd Used")
                {
                }
                field(Justififcation; Rec.Justififcation)
                {
                }
                field("Request Objective"; Rec."Request Objective")
                {
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IncomingDocument.SETRANGE("Entry No.", Rec."Incoming Document Entry No.");
                        IF PAGE.RUNMODAL(0, IncomingDocument) = ACTION::LookupOK THEN
                            Rec."Incoming Document Entry No." := IncomingDocument."Entry No.";
                    end;
                }
                field("Benefit to TNL"; Rec."Benefit to TNL")
                {
                }
                field("Send To"; Rec."Send To")
                {
                }
                field(Send; Rec.Send)
                {
                }
                field(SendTime; Rec.SendTime)
                {
                }
            }
            group("Requester HOD's Approval")
            {
                Caption = 'Requester HOD''s Approval';
                field(Status; Rec.Status)
                {
                }
                field("Requetsers Hod Name"; Rec."Requetsers Hod Name")
                {
                }
                field("Date Hod"; Rec."Date Hod")
                {
                }
            }
            group("AUDIT AND SYSTEMS' CHANGE APPROVAL")
            {
                Caption = 'AUDIT AND SYSTEMS'' CHANGE APPROVAL';
                field(Status1; Rec.Status1)
                {
                }
                field("HOD Audit Name"; Rec."HOD Audit Name")
                {
                }
                field(Date1; Rec.Date1)
                {
                }
            }
            group("MD's CHANGE APPROVAL OR REJECTION")
            {
                Caption = 'MD''s CHANGE APPROVAL OR REJECTION';
                field("MDs Status"; Rec."MDs Status")
                {
                }
                field("MDS Date"; Rec."MDS Date")
                {
                }
            }
            part("Change Management Subform"; 50612)
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group("CHANGE IMPLEMENTATION")
            {
                Caption = 'CHANGE IMPLEMENTATION';
                field("Method of Implementation"; Rec."Method of Implementation")
                {
                }
                field(Cost; Rec.Cost)
                {
                }
                field("Responsible TNL Staff"; Rec."Responsible TNL Staff")
                {
                }
                field("Implemented By"; Rec."Implemented By")
                {
                }
                field("Tested By"; Rec."Tested By")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("No of Days"; Rec."No of Days")
                {
                }
                field("Completion Date"; Rec."Completion Date")
                {
                }
                field("Go live Date"; Rec."Go live Date")
                {
                }
            }
            group("Requester Test & Sig-off")
            {
                Caption = 'Requester Test & Sig-off';
                field("Reqster Assessment"; Rec."Reqster Assessment")
                {
                    Caption = 'Requester Assessment';
                }
                field("Reqster Test Date"; Rec."Reqster Test Date")
                {
                    Caption = 'Requester Test Date';
                }
                field("Assessment  By"; Rec."Assessment  By")
                {
                }
                field("Requester Sign-off Con."; Rec."Requester Sign-off Con.")
                {
                    Caption = 'Sign-off Confirmation';
                }
                field("Requester Sign Date"; Rec."Requester Sign Date")
                {
                }
                field("Sign-Off Name"; Rec."Sign-Off Name")
                {
                }
            }
            group("POST IMPLEMENTATION REVIEW")
            {
                Caption = 'POST IMPLEMENTATION REVIEW';
                field("Reviewed Confirmation"; Rec."Reviewed Confirmation")
                {
                }
                field("Reviewed By"; Rec."Reviewed By")
                {
                }
                field("Post Date"; Rec."Post Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        IncomingDocument: Record 130;
}

