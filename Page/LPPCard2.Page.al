page 70205 "LPP Card2"
{
    PageType = Card;
    Caption = 'LPP Card';
    SourceTable = "Local Part Purchase Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Supplier")
            {
                Editable = SendEdit;
                field("Suppliers Code"; Rec."Suppliers Code")
                {
                }
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Supplier's Address"; Rec."Supplier's Address")
                {
                }
                field("Profoma Invoice No:"; Rec."Profoma Invoice No:")
                {
                }
                field("Total Purchase Value"; Rec."Total Purchase Value")
                {
                }
            }
            group(Requester)
            {
                field("LPP No."; Rec."LPP No.")
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Justification for purchase"; Rec."Justification for purchase")
                {
                    Editable = SendEdit;
                }
                field("Send To"; Rec."Send To")
                {
                    Editable = SendEdit;
                }
                field(Send; Rec.Send)
                {
                    Editable = SendEdit;
                }
                field("TCOF No."; Rec."TCOF No.")
                {
                    Editable = false;
                }
                field("RFQ No."; Rec."RFQ No.")
                {
                }
                field(Costing; Rec.Costing)
                {
                    Caption = 'Costing';
                    ToolTip = 'Check this box if costing is required for this LPP.';
                }
            }
            group("Job Details ")
            {
                Caption = 'Job Details';
                Visible = Rec.Costing = true;
                field("No."; Rec."No.")
                {
                }
                field("Customer Approved Amount"; Rec."Customer Approved Amount")
                {
                }
                field("Markup Amount"; Rec."Markup Amount")
                {
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                }
            }
            part("LPP Subform"; "LPP Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = FIELD("LPP No.");
            }

            group(Authorization)
            {
                Caption = 'Authorization';

                group("Head of Department Authorization")
                {
                    Caption = '1. Head of Department';
                    Editable = HeadEdit;

                    field("Head of Department"; Rec."Head of Department")
                    {
                        Caption = 'Action';
                    }
                    field("Name HOD"; Rec."Name HOD")
                    {
                        Caption = 'Name';
                        Editable = false;
                    }
                    field(TimeDate2; Rec.TimeDate2)
                    {
                        Caption = 'Time';
                        Editable = false;
                    }
                }

                group("Compliance Authorization")
                {
                    Caption = '2. Compliance Check';
                    Editable = CompliancEdit;

                    field("Compliance check"; Rec."Compliance check")
                    {
                        Caption = 'Action';
                    }
                    field("Confirmed By"; Rec."Confirmed By")
                    {
                        Caption = 'Name';
                        Editable = false;
                    }
                    field(TimeDate3; Rec.TimeDate3)
                    {
                        Caption = 'Time';
                        Editable = false;
                    }
                }

                group("Audit Authorization")
                {
                    Caption = '3. Head of Audit';
                    Editable = HODAuditEdit;
                    //Visible = AuditVisible;

                    field("Head of Audit"; Rec."Head of Audit")
                    {
                        Caption = 'Action';
                    }
                    field("Name Head of Audit"; Rec."Name Head of Audit")
                    {
                        Caption = 'Name';
                        Editable = false;
                    }
                    field(TimeDate4; Rec.TimeDate4)
                    {
                        Caption = 'Time';
                        Editable = false;
                    }
                }
            }

            group("Procurement Approval")
            {
                Caption = 'Procurement Approval';
                group("Procurement Approval HOD")
                {
                    Visible = HeadApprovalVisible;
                    Caption = 'Head of Parts';
                    Editable = HODEdit;

                    field("HOD's Part Procurement Appr."; Rec."HOD's Part Procurement Appr.")
                    {
                        Caption = 'Action';
                    }
                    field("HOD's Part  Appr. Name"; Rec."HOD's Part  Appr. Name")
                    {
                        Caption = 'Name';
                        Editable = false;
                    }
                    field(TimeDate5; Rec.TimeDate5)
                    {
                        Caption = 'Time';
                        Editable = false;
                    }
                }
                group("Procurement Approval GM")
                {
                    Visible = GMVisible;
                    Caption = 'General Manager';
                    Editable = GMEdit;

                    field("General Manager"; Rec."General Manager")
                    {
                        Caption = 'Action';
                    }
                    field("Name GM"; Rec."Name GM")
                    {
                        Caption = 'Name';
                        Editable = false;
                    }
                    field(TimeDate6; Rec.TimeDate6)
                    {
                        Caption = 'Time';
                        Editable = false;
                    }
                }

            }
            group("Procurement Approval MD")
            {
                Caption = 'Managing Director';
                Visible = MDVisible;
                group(Control08)
                {
                    Editable = MDEdit;
                    ShowCaption = false;
                    field("Managing Director"; rec."Managing Director")
                    {
                        Caption = 'Action';
                    }
                    field("Name MD"; Rec."Name MD")
                    {
                        Caption = 'Name';
                    }
                    field(TimeDate7; Rec.TimeDate7)
                    {
                        Caption = 'Time';
                    }
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Print Document LPP")
            {
                Caption = 'Print Document LPP';
                RunObject = Report 50551;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Order Type" = Rec."Order Type"::"Isolo Store" THEN
            AuditVisible := FALSE
        ELSE
            AuditVisible := TRUE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."LPP No." <> '' THEN BEGIN
            IF Rec."Total Purchase Value" < 100001 THEN
                HeadApprovalVisible := TRUE;
            Rec.MODIFY;

            IF (Rec."Total Purchase Value" > 100000) AND (Rec."Total Purchase Value" < 500000) THEN
                GMVisible := TRUE;
            Rec.MODIFY;


            IF (Rec."Total Purchase Value" >= 500000) THEN BEGIN
                MDVisible := TRUE;
                GMVisible := FALSE;
                Rec.MODIFY;
            END;
        END;

        IF Rec.Send = TRUE THEN
            SendEdit := FALSE ELSE
            SendEdit := TRUE;


        IF Rec."Head of Department" = Rec."Head of Department"::Approved THEN
            HeadEdit := FALSE ELSE
            HeadEdit := TRUE;


        IF Rec."Compliance check" = Rec."Compliance check"::Satisfactory THEN
            CompliancEdit := FALSE ELSE
            CompliancEdit := TRUE;

        IF Rec."Head of Audit" = Rec."Head of Audit"::Approved THEN
            HODAuditEdit := FALSE ELSE
            HODAuditEdit := TRUE;

        IF Rec."General Manager" = Rec."General Manager"::Approved THEN
            GMEdit := FALSE ELSE
            GMEdit := TRUE;


        IF Rec."Managing Director" = Rec."Managing Director"::Approved THEN
            MDEdit := FALSE ELSE
            MDEdit := TRUE;

        IF Rec."HOD's Part Procurement Appr." = Rec."HOD's Part Procurement Appr."::Approved THEN
            HODEdit := FALSE ELSE
            HODEdit := TRUE;


        IF Rec."Order Type" = Rec."Order Type"::"Isolo Store" THEN
            AuditVisible := FALSE
        ELSE
            AuditVisible := TRUE;
    end;

    var
        HODVisible: Boolean;
        GMVisible: Boolean;
        MDVisible: Boolean;
        VendAmt: Decimal;
        HeadApprovalVisible: Boolean;
        AuditVisible: Boolean;
        ComplianceVisible: Boolean;
        SendEdit: Boolean;
        HeadEdit: Boolean;
        CompliancEdit: Boolean;
        HODAuditEdit: Boolean;
        HODEdit: Boolean;
        GMEdit: Boolean;
        MDEdit: Boolean;
        LppLine: Record 70019;
        PaymentRec: Record 50103;
        PaymentRec2: Record 50103;
        LPP: Record 70018;
        "LPP LPO": Report 50611;
}

