page 70172 "Complaint Card"
{
    PageType = Card;
    SourceTable = "CRM Register";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("User name"; Rec."User name")
                {
                }
                field("Type of Call"; Rec."Type of Call")
                {

                    trigger OnValidate()
                    begin
                        IF Rec.Enquiry = TRUE THEN
                            VisbleEnquiry := TRUE ELSE
                            VisbleEnquiry := FALSE;

                        IF Rec.Complaint = TRUE THEN
                            VisibleComplaint := TRUE ELSE
                            VisibleComplaint := FALSE;
                    end;
                }
            }
            group("Dealer's Details")
            {
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Dealer's Location"; Rec."Dealer's Location")
                {
                }
            }
            group("Customer Details")
            {
                field("Mode of Contact"; Rec."Mode of Contact")
                {
                }
                field(Title; Rec.Title)
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                }
                field("Customer Email"; Rec."Customer Email")
                {
                }
                field("Company Name"; Rec."Company Name")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(City; Rec.City)
                {
                }
            }
            group("Vehicle Details")
            {
                field(Vin; Rec.Vin)
                {
                }
                field("Registration No"; Rec."Registration No")
                {
                }
                field("Mode Type"; Rec."Mode Type")
                {
                }
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Date of delivery"; Rec."Date of delivery")
                {
                }
                field("Date of Purchase"; Rec."Date of Purchase")
                {
                }
                field(Milage; Rec.Milage)
                {
                }
            }
            group(Complaint)
            {
                field("Date Matter Occured"; Rec."Date Matter Occured")
                {
                    Caption = 'Date of  Complaint';
                }
                field("Type of complaint"; Rec."Type of complaint")
                {
                }
                field("Classification of Complaint"; Rec."Classification of Complaint")
                {
                }
                field("Complaint Details"; Rec."Complaint Details")
                {
                }
                field("Action Taken Compliant"; Rec."Action Taken Compliant")
                {
                    Caption = 'Action Taken';
                }
                field(Priority; Rec.Priority)
                {
                }
            }
            group(Control1)
            {
                Caption = 'Escalate';
                Visible = VisibleEscalate;
                field("User ID Escalate"; Rec."User ID Escalate")
                {
                }
                field("Escalate Send"; Rec."Escalate Send")
                {

                    trigger OnValidate()
                    begin

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;


                        UserSetup.GET(Rec."User ID Escalate");
                        ToAddresses := UserSetup."E-Mail";
                        Addressee := UserSetup.Initials;
                        CcAddresses := '';
                        BccAddresses := '';
                        // Subject := STRSUBSTNO(Text007,,"No.");
                        Body := Text025 + Addressee + ',' +
                        // CRLF + CRLF + STRSUBSTNO(Text026,"Document Type","No.") +
                        CRLF + CRLF + CRLF + Text027 + CRLF + CRLF;
                        IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN;
                        //Mail.NewMessage(ToAddresses, CcAddresses, BccAddresses, Subject, Body, '', TRUE);
                    end;
                }
                field("User Name Escalate"; Rec."User Name Escalate")
                {
                }
            }
            group("Resolution ")
            {
                Editable = VisibleComplaint;
                Visible = VisibleComplaint;
                field("User ID Resolution"; Rec."User ID Resolution")
                {
                }
                field("User Name Resolution"; Rec."User Name Resolution")
                {
                }
                field("Date of Resolution"; Rec."Date of Resolution")
                {
                }
                field("Resolution Details"; Rec."Resolution Details")
                {
                }
                field(Remark; Rec.Remark)
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Escalate)
            {
                Caption = 'Escalate';
                Image = CheckRulesSyntax;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec."Escalate Visible" := TRUE;

                    IF Rec."Escalate Visible" = TRUE THEN
                        VisibleEscalate := TRUE ELSE
                        VisibleEscalate := FALSE;

                    //MESSAGE('');
                end;
            }
            action(Resolution)
            {
                Caption = 'Resolution';
                Image = CheckRulesSyntax;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec."Resolution Visible" := TRUE;
                    IF Rec."Resolution Visible" = TRUE THEN
                        VisibleResolution := TRUE ELSE
                        VisibleResolution := FALSE;

                    //MESSAGE('');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF Rec.Enquiry = TRUE THEN
            VisbleEnquiry := TRUE ELSE
            VisbleEnquiry := FALSE;

        IF Rec.Complaint = TRUE THEN
            VisibleComplaint := TRUE ELSE
            VisibleComplaint := FALSE;


        IF Rec."Escalate Visible" = TRUE THEN
            VisibleEscalate := TRUE ELSE
            VisibleEscalate := FALSE;

        IF Rec."Resolution Visible" = TRUE THEN
            VisibleResolution := TRUE ELSE
            VisibleResolution := FALSE;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        PurchSetup: Record 312;
        UserSetup: Record 91;
        ToAddresses: Text;
        CcAddresses: Text[200];
        BccAddresses: Text[100];
        Subject: Text[70];
        Body: Text[500];
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        VisibleEscalate: Boolean;
        VisibleResolution: Boolean;
        VisbleEnquiry: Boolean;
        VisibleComplaint: Boolean;
        CusRelationEntry: Record 70011;
        Mail: Codeunit 397;
        Addressee: Text;
        Text007: Text;
        Text025: Text;
        CRLF: Text[2];
        //SMTPMail: Codeunit 400;
        Text026: Text;
        Text027: Text;
}

