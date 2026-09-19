page 70192 "LPP Card"
{
    PageType = Card;
    SourceTable = "Local Part Purchase Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Supplier")
            {
                Editable = SendEdit;
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
                field("Order Type"; Rec."Order Type")
                {
                }
                field("TCOF No."; Rec."TCOF No.")
                {
                    Editable = false;
                }
            }
            group(Requester)
            {
                field("LPP No."; Rec."LPP No.")
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
            }
            part("LPP Subform"; "LPP Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = FIELD("LPP No.");
            }
            group(Authorization)
            {
                grid(Control01)
                {
                    group(Control02)
                    {
                        ShowCaption = false;
                        Editable = HeadEdit;
                        field("Head of Department"; Rec."Head of Department")
                        {
                            Caption = 'Head of Department';
                        }
                        field("Name HOD"; Rec."Name HOD")
                        {
                            Caption = 'Name';
                        }
                        field(TimeDate2; Rec.TimeDate2)
                        {
                            Caption = 'Time';
                        }
                    }
                    group(Control03)
                    {
                        ShowCaption = false;
                        Editable = CompliancEdit;
                        field("Compliance check"; Rec."Compliance check")
                        {
                            Caption = 'Compliance Check';
                        }
                        field("Confirmed By"; Rec."Confirmed By")
                        {
                            Caption = 'Name';
                        }
                        field(TimeDate3; Rec.TimeDate3)
                        {
                            Caption = 'Time';
                        }
                    }
                    group(Control04)
                    {
                        ShowCaption = false;
                        Editable = HODAuditEdit;
                        //Visible = AuditVisible;
                        field("Head of Audit"; Rec."Head of Audit")
                        {
                            Caption = 'Head of Audit';
                        }
                        field("Name Head of Audit"; Rec."Name Head of Audit")
                        {
                            Caption = 'Name';
                        }
                        field(TimeDate4; Rec.TimeDate4)
                        {
                            Caption = 'Time';
                        }
                    }

                }
            }
            group("Procurement  Approval HOD")
            {
                Visible = HeadApprovalVisible;
                group(Control06)
                {
                    ShowCaption = false;
                    Editable = HODEdit;
                    field("HOD's Part Procurement Appr."; Rec."HOD's Part Procurement Appr.")
                    {
                    }
                    field("HOD's Part  Appr. Name"; Rec."HOD's Part  Appr. Name")
                    {
                    }
                    field(TimeDate5; Rec.TimeDate5)
                    {
                    }
                }
            }
            group("Procurement Approval GM")
            {
                Visible = GMVisible;
                group(Control07)
                {
                    ShowCaption = false;
                    Editable = GMEdit;
                    field("General Manager"; Rec."General Manager")
                    {
                    }
                    field("Name GM"; Rec."Name GM")
                    {
                    }
                    field(TimeDate6; Rec.TimeDate6)
                    {
                    }
                }
            }
            group("Procurement Approval MD")
            {
                Visible = MDVisible;
                group(Control08)
                {
                    ShowCaption = false;
                    Editable = MDEdit;
                    field("Managing Director"; Rec."Managing Director")
                    {
                    }
                    field("Name MD"; Rec."Name MD")
                    {
                    }
                    field(TimeDate7; Rec.TimeDate7)
                    {
                    }
                }
                group(Control09)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Print LPP")
            {
                Caption = 'Print LPP';
                Image = Bin;
                RunObject = Report 50075;
            }
            action("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = CreateFinanceChargememo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Genarate LPO", TRUE);

                    IF NOT CONFIRM(Text001, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::"e-Pay";
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."LPP No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text002);

                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2);
                        Rec."Voucher Raised" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
            action("Cheque Requisition")
            {
                Caption = 'Cheque Requisition';
                Image = CreateFinanceChargememo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    Rec.TESTFIELD("Genarate LPO", TRUE);


                    IF NOT CONFIRM(Text003, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70010, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::Requisition;
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."LPP No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text004);
                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70010, PaymentRec2);
                        Rec."Voucher Raised" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
            action("Journal Voucher")
            {
                Caption = 'Journal Voucher';
                Image = CreateFinanceChargememo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Genarate LPO", TRUE);

                    IF NOT CONFIRM(Text005, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::Journal;
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."LPP No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text006);
                        PaymentRec2.SETRANGE("Procurement No.", Rec."LPP No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70011, PaymentRec2);
                        Rec."Voucher Raised" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
            action("Generate LPO")
            {
                Caption = 'Generate LPO';
                Image = "Report";

                trigger OnAction()
                begin

                    //LPP.SETRANGE(LPP."LPP No.","LPP No.");
                    //IF LPP.FINDFIRST THEN BEGIN
                    //  "LPP LPO".SETTABLEVIEW(LPP);
                    //  "LPP LPO".RUN;
                    //END;
                    Rec.GenaratePayment := TRUE;
                end;
            }
            action("Print  LPO")
            {
                Caption = 'Print  LPO';
                Image = Print;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Genarate LPO", TRUE);

                    LPP.SETRANGE(LPP."LPP No.", Rec."LPP No.");
                    IF LPP.FINDFIRST THEN BEGIN
                        "LPP LPO".SETTABLEVIEW(LPP);
                        "LPP LPO".RUN;
                    END;
                    //GenaratePayment:= TRUE;
                end;
            }
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

            IF (Rec."Total Purchase Value" > 100000) AND (Rec."Total Purchase Value" < 500000) THEN BEGIN
                GMVisible := TRUE;
                MDVisible := FALSE;
                Rec.MODIFY;
            END;

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
        Text001: Label 'Are you sure you want to create an e-payment voucher?';
        Text002: Label 'A payment voucher has been raised!';
        Text003: Label 'Are you sure you want to create an cheque requisition?';
        Text004: Label 'A cheque requisition  has been raised!';
        Text005: Label 'Are you sure you want to generate a journal voucher?';
        Text006: Label 'A journal  voucher  has been raised!';
        LPP: Record 70018;
        "LPP LPO": Report 50611;
}

