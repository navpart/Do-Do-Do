page 70147 "Approved Opex card4"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Procurement Header";

    layout
    {
        area(content)
        {
            group("Opex Details")
            {
                Editable = EditSend;
                field("No."; Rec."No.")
                {
                    Caption = 'Opex No.';
                }
                field("Opex Type"; Rec."Opex Type")
                {
                }
                field(Date; Rec.Date)
                {
                    Editable = false;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                    Editable = false;
                }
                field("Payment No."; Rec."Payment No.")
                {
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                    Caption = 'Proposed Expense Amount';

                    trigger OnValidate()
                    begin
                        IF Rec."Opex Type" IN [Rec."Opex Type"::SLA, Rec."Opex Type"::SE, Rec."Opex Type"::"Recurrent Service"] THEN
                            MESSAGE(Text001);

                        IF Rec."Opex Type" IN [Rec."Opex Type"::"New Service", Rec."Opex Type"::Consumable] THEN
                            IF Rec."Proposed Purchase Amount" >= 50000 THEN
                                MESSAGE(Text002);
                    end;
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                    Caption = 'Justification';
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Mode of Payment"; Rec."Mode of Payment")
                {
                }
                field("Send To"; Rec."Send To")
                {
                }
                field(Send; Rec.Send)
                {
                    Editable = EditSend;
                }
            }
            part("Vendor Details"; 70127)
            {
                Caption = 'Vendor Details';
                SubPageLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
            }
            group("Procurement Approval")
            {
                Visible = OpexAppr;
                grid(Control01)
                {
                    group(Control02)
                    {
                        field("Head of Department"; Rec."Head of Department")
                        {
                            Caption = 'Head of Department';
                            Editable = EditHOD2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name HOD"; Rec."Name HOD")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate1; Rec.TimeDate1)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control03)
                    {
                        field("Head of Audit"; Rec."Head of Audit")
                        {
                            Caption = 'Head of Audit';
                            Editable = EditHOA2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name Head of Audit"; Rec."Name Head of Audit")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate2; Rec.TimeDate2)
                        {
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(Control04)
                    {
                        Visible = GMAppr;
                        field("General Manager"; Rec."General Manager")
                        {
                            Caption = 'General Manager';
                            Editable = EditGM2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name GM"; Rec."Name GM")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate3; Rec.TimeDate3)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control05)
                    {
                        Visible = MDAppr;
                        field("Managing Director"; Rec."Managing Director")
                        {
                            Caption = 'Managing Director';
                            Editable = EditMD2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name MD"; Rec."Name MD")
                        {
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(TimeDate4; Rec.TimeDate4)
                        {
                            ShowCaption = false;
                        }
                    }
                }
            }
            group("Advance Payment Approval")
            {
                Visible = AdvPay;
                grid(Control06)
                {
                    group(Control07)
                    {
                        field("Adv. Paymt. HOD"; Rec."Adv. Paymt. HOD")
                        {
                            Caption = 'Head of Department';
                            Editable = EditAdvanceHOD;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Authorized by HOD"; Rec."Authorized by HOD")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate5; Rec.TimeDate5)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control08)
                    {
                        field("Adv. Paymt. Audit"; Rec."Adv. Paymt. Audit")
                        {
                            Caption = 'Head of Audit';
                            Editable = EditAdvanceHOA;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Authorized by Audit"; Rec."Authorized by Audit")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate6; Rec.TimeDate6)
                        {
                            ShowCaption = false;
                        }
                    }
                }
            }
            group("Service/Item Delivery Check")
            {
                Visible = Check;
                grid(Control09)
                {
                    group(Control10)
                    {
                        field("Service Delivery1"; Rec."Service Delivery1")
                        {
                            Caption = 'Requester';
                            Editable = EditServiceCheckRequester;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Confirmed By1"; Rec."Confirmed By1")
                        {
                            Caption = 'Checked by Requester';
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(TimeDate7; Rec.TimeDate7)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control11)
                    {
                        field("Service Delivery2"; Rec."Service Delivery2")
                        {
                            Caption = 'Auditor';
                            Editable = EditServiceCheckAudit;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Confirmed By2"; Rec."Confirmed By2")
                        {
                            Caption = 'Checked by Audit';
                            ShowCaption = false;
                        }
                        field(TimeDate9; Rec.TimeDate9)
                        {
                            ShowCaption = false;
                        }
                    }
                }
            }
            group("Balance Payment  Approval")
            {
                Visible = BalPay;
                grid(Control12)
                {
                    group(Control13)
                    {
                        field("Bal. Paymt. HOD"; Rec."Bal. Paymt. HOD")
                        {
                            Caption = 'Head of Department';
                            Editable = EditBalanceHOD;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Bal. Paymt. by HOD"; Rec."Bal. Paymt. by HOD")
                        {
                            Caption = 'Payment Approved by';
                            ShowCaption = false;
                        }
                        field(TimeDate8; Rec.TimeDate8)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control14)
                    {
                        field("Bal. Paymt. Audit"; Rec."Bal. Paymt. Audit")
                        {
                            Caption = 'Head of Audit';
                            Editable = EditBalanceHOA;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Bal. Paymt. by Audit"; Rec."Bal. Paymt. by Audit")
                        {
                            Caption = 'Payment Approved by';
                            ShowCaption = false;
                        }
                        field(TimeDate10; Rec.TimeDate10)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control15)
                    {
                        Visible = BalGM;
                        field("Bal. Paymt. GM"; Rec."Bal. Paymt. GM")
                        {
                            Caption = 'General Manager';
                            Editable = EditBalanceGM;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Bal. Paymt. by GM"; Rec."Bal. Paymt. by GM")
                        {
                            Caption = 'Payment Approved by';
                            ShowCaption = false;
                        }
                        field(TimeDate11; Rec.TimeDate11)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control16)
                    {
                        Visible = BalMD;
                        field("Bal. Paymt. MD"; Rec."Bal. Paymt. MD")
                        {
                            Caption = 'Managing Director';
                            Editable = EditBalanceMD;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Bal. Paymt. by MD"; Rec."Bal. Paymt. by MD")
                        {
                            Caption = 'Payment Approved by';
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(TimeDate12; Rec.TimeDate12)
                        {
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Factbox; "Procurement FactBox")
            {
                SubPageLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = CreateFinanceChargememo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Adv. Paymt. Audit");


                    IF NOT CONFIRM(Text003, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::"e-Pay";
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text015);
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2);
                        Rec."Advance Voucher" := TRUE;
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
                    Rec.TESTFIELD("Adv. Paymt. Audit");
                    IF NOT CONFIRM(Text016, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::Requisition;
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text017);
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70010, PaymentRec2);
                        Rec."Advance Voucher" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF Rec.Send THEN BEGIN
            OpexAppr := TRUE
        END
        ELSE
            OpexAppr := FALSE;

        IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
            IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                GMAppr := TRUE;
                NameGM := TRUE;
                Date3 := TRUE;
                MDAppr := FALSE;
                NameMD := FALSE;
                Date4 := FALSE;
                Rec.ListGM := TRUE;
                Rec.ListMD := FALSE;
                Rec.MODIFY

            END ELSE BEGIN
                GMAppr := FALSE;
                NameGM := FALSE;
                Date3 := FALSE;
                MDAppr := TRUE;
                NameMD := TRUE;
                Date4 := TRUE;
                Rec.ListGM := FALSE;
                Rec.ListMD := TRUE;
                Rec.MODIFY

            END
        END ELSE BEGIN
            IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                GMAppr := TRUE;
                NameGM := TRUE;
                Date3 := TRUE;
                MDAppr := FALSE;
                NameMD := FALSE;
                Date4 := FALSE;
                Rec.ListGM := TRUE;
                Rec.ListMD := FALSE;
                Rec.MODIFY

            END ELSE BEGIN
                GMAppr := FALSE;
                NameGM := FALSE;
                Date3 := FALSE;
                MDAppr := TRUE;
                NameMD := TRUE;
                Date4 := TRUE;
                Rec.ListGM := FALSE;
                Rec.ListMD := TRUE;
                Rec.MODIFY

            END
        END;

        ProcurementLine.SETRANGE("Document No.", Rec."No.");
        ProcurementLine.SETRANGE(Preferred, TRUE);
        IF ProcurementLine.FINDFIRST THEN
            IF (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% after delivery") AND
               (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% before delivery") THEN
                IF (Rec."General Manager" = Rec."General Manager"::Approved) OR (Rec."Managing Director" = Rec."Managing Director"::Approved) THEN
                    AdvPay := TRUE;

        IF Rec.Compliance = TRUE THEN
            Check := TRUE;

        IF Rec."Service Delivery2" = Rec."Service Delivery2"::Satisfactory THEN BEGIN
            IF Rec."Proposed Purchase Amount" <= 500000 THEN
                BalGM := TRUE
            ELSE
                BalMD := TRUE;
            BalPay := TRUE;
        END;
        IF (Rec.Send = TRUE) OR (Rec."Payment Approval Only" = TRUE) THEN
            EditSend := FALSE ELSE
            EditSend := TRUE;
    end;

    var
        OpexLine: Record 70001;
        Mail: Codeunit 397;
        ToAddresses: Text;
        CcAddresses: Text;
        BccAddresses: Text;
        Subject: Text;
        Body: Text;
        AttachFilename: Text;
        ShowNewMailDialogOnSend: Boolean;
        UserSetup: Record 91;
        UserSetup2: Record 91;
        IOUReg: Record 50105;
        OpexRec: Record 70008;
        OpexRec2: Record 70008;
        Url: Text[500];
        PaymentRec: Record 50103;
        PaymentRec2: Record 50103;
        EditHOD: Boolean;
        EditAudit: Boolean;
        EditGM: Boolean;
        EditMD: Boolean;
        VisibleGM: Boolean;
        VisibleMD: Boolean;
        ProcurementLine: Record 70001;
        ProcurementLine2: Record 70001;
        PurchSetup: Record 312;
        CRLF: Text[2];
        VendName: Text[70];
        VendAddr: Text[100];
        VendAmt: Decimal;
        UserSetup4: Record 91;
        SendersName: Text[50];
        Addressee: Text[50];
        GMAppr: Boolean;
        NameGM: Boolean;
        MDAppr: Boolean;
        NameMD: Boolean;
        AdvPay: Boolean;
        Check: Boolean;
        BalPay: Boolean;
        OpexAppr: Boolean;
        Date3: Boolean;
        Date4: Boolean;
        BalMD: Boolean;
        BalGM: Boolean;
        Text001: Label 'An invoice from a vendor is required for this transaction!';
        Text002: Label '3 quotes from 3 vendors will be required for this transaction!';
        Text003: Label 'Are you sure you want to create an e-payment voucher?';
        Text011: Label 'A request for payment has been made. Kindly approve!';
        Text012: Label 'This document requires a compliance check and approval for payment!';
        Text015: Label 'A payment voucher has been raised!';
        Text016: Label 'Are you sure you want to create an cheque requisition?';
        Text017: Label 'A cheque requisition  has been raised!';
        EditSend: Boolean;
        EditHOD2: Boolean;
        EditHOA2: Boolean;
        EditGM2: Boolean;
        EditMD2: Boolean;
        EditAdvanceHOD: Boolean;
        EditAdvanceHOA: Boolean;
        EditServiceCheckRequester: Boolean;
        EditServiceCheckAudit: Boolean;
        EditBalanceHOD: Boolean;
        EditBalanceHOA: Boolean;
        EditBalanceGM: Boolean;
        EditBalanceMD: Boolean;
        EditVendorDetails: Boolean;

    local procedure EditApproval()
    begin
        IF (Rec.Send = TRUE) OR (Rec."Payment Approval Only" = TRUE) THEN
            EditSend := FALSE ELSE
            EditSend := TRUE;


        IF (Rec."Head of Department" = Rec."Head of Department"::Approved) OR
           (Rec."Bal. Paymt. HOD" = Rec."Bal. Paymt. HOD"::Approved) THEN
            EditVendorDetails := FALSE ELSE
            EditVendorDetails := TRUE;


        IF Rec."Head of Department" = Rec."Head of Department"::Approved THEN
            EditHOD2 := FALSE ELSE
            EditHOD2 := TRUE;

        IF Rec."Head of Audit" = Rec."Head of Audit"::Approved THEN
            EditHOA2 := FALSE ELSE
            EditHOA2 := TRUE;

        IF Rec."General Manager" = Rec."General Manager"::Approved THEN
            EditGM2 := FALSE ELSE
            EditGM2 := TRUE;


        IF Rec."Managing Director" = Rec."Managing Director"::Approved THEN
            EditMD2 := FALSE ELSE
            EditMD2 := TRUE;

        IF Rec."Adv. Paymt. HOD" = Rec."Adv. Paymt. HOD"::Approved THEN
            EditAdvanceHOD := FALSE ELSE
            EditAdvanceHOD := TRUE;

        IF Rec."Adv. Paymt. Audit" = Rec."Adv. Paymt. Audit"::Approved THEN
            EditAdvanceHOA := FALSE ELSE
            EditAdvanceHOA := TRUE;
        IF Rec."Service Delivery1" = Rec."Service Delivery1"::Satisfactory THEN
            EditServiceCheckRequester := FALSE ELSE
            EditServiceCheckRequester := TRUE;

        IF Rec."Service Delivery2" = Rec."Service Delivery2"::Satisfactory THEN
            EditServiceCheckAudit := FALSE ELSE
            EditServiceCheckAudit := TRUE;

        IF Rec."Bal. Paymt. HOD" = Rec."Bal. Paymt. HOD"::Approved THEN
            EditBalanceHOD := FALSE ELSE
            EditBalanceHOD := TRUE;

        IF Rec."Bal. Paymt. Audit" = Rec."Bal. Paymt. Audit"::Approved THEN
            EditBalanceHOA := FALSE ELSE
            EditBalanceHOA := TRUE;

        IF Rec."Bal. Paymt. GM" = Rec."Bal. Paymt. GM"::Approved THEN
            EditBalanceGM := FALSE ELSE
            EditBalanceGM := TRUE;

        IF Rec."Bal. Paymt. MD" = Rec."Bal. Paymt. MD"::Approved THEN
            EditBalanceMD := FALSE ELSE
            EditBalanceMD := TRUE;
    end;
}

