page 70137 "Approved Opex Card"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Header";

    layout
    {
        area(content)
        {
            group("Opex Details")
            {
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
                grid(Control010)
                {
                    group(Control011)
                    {
                        field("Head of Department"; Rec."Head of Department")
                        {
                            Caption = 'Head of Department';
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
                    group(Control012)
                    {
                        field("Head of Audit"; Rec."Head of Audit")
                        {
                            Caption = 'Head of Audit';
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name Head of Audit"; Rec."Name Head of Audit")
                        {
                            ShowCaption = false;
                        }
                        field(TimeDate2; Rec.TimeDate2)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control013)
                    {
                        Visible = GMAppr;
                        field("General Manager"; Rec."General Manager")
                        {
                            Caption = 'General Manager';
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
                    group(Control014)
                    {
                        Visible = MDAppr;
                        field("Managing Director"; Rec."Managing Director")
                        {
                            Caption = 'Managing Director';
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Name MD"; Rec."Name MD")
                        {
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
                grid(Control015)
                {
                    group(Control016)
                    {
                        field("Adv. Paymt. HOD"; Rec."Adv. Paymt. HOD")
                        {
                            Caption = 'Head of Department';
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
                    group(Control017)
                    {
                        field("Adv. Paymt. Audit"; Rec."Adv. Paymt. Audit")
                        {
                            Caption = 'Head of Audit';
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
                grid(Control018)
                {
                    group(Control019)
                    {
                        field("Service Delivery1"; Rec."Service Delivery1")
                        {
                            Caption = 'Requester';
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Confirmed By1"; Rec."Confirmed By1")
                        {
                            Caption = 'Checked by Requester';
                            ShowCaption = false;
                        }
                        field(TimeDate7; Rec.TimeDate7)
                        {
                            ShowCaption = false;
                        }
                    }
                    group(Control020)
                    {
                        field("Service Delivery2"; Rec."Service Delivery2")
                        {
                            Caption = 'Auditor';
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
                grid(Control021)
                {
                    group(Control022)
                    {
                        field("Bal. Paymt. HOD"; Rec."Bal. Paymt. HOD")
                        {
                            Caption = 'Head of Department';
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
                    group(Control023)
                    {
                        field("Bal. Paymt. Audit"; Rec."Bal. Paymt. Audit")
                        {
                            Caption = 'Head of Audit';
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
                    group(Control024)
                    {
                        Visible = BalGM;
                        field("Bal. Paymt. GM"; Rec."Bal. Paymt. GM")
                        {
                            Caption = 'General Manager';
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
                    group(Control025)
                    {
                        Visible = BalMD;
                        field("Bal. Paymt. MD"; Rec."Bal. Paymt. MD")
                        {
                            Caption = 'Managing Director';
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                        field("Bal. Paymt. by MD"; Rec."Bal. Paymt. by MD")
                        {
                            Caption = 'Payment Approved by';
                            ShowCaption = false;
                        }
                        field(TimeDate12; Rec.TimeDate12)
                        {
                            ShowCaption = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Factbox; 70130)
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
                    Rec.TESTFIELD("Bal. Paymt. HOD", 1);
                    Rec.TESTFIELD("Bal. Paymt. Audit", 1);
                    IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
                        IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                            Rec.TESTFIELD("Bal. Paymt. GM", 1);
                        END ELSE BEGIN
                            Rec.TESTFIELD("Bal. Paymt. MD", 1);
                            IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                                Rec.TESTFIELD("Bal. Paymt. GM", 1);
                            END ELSE BEGIN
                                Rec.TESTFIELD("Bal. Paymt. MD", 1);

                            END;
                        END;
                    END;



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
                        Rec."Voucher Raised" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
            action("Create IOU")
            {
                Caption = 'Create IOU';
                Image = CreateForm;
                Promoted = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Bal. Paymt. HOD",1);
                    //TESTFIELD("Bal. Paymt. Audit",1);
                    //  IF "Proposed Purchase Amount" > 500000 THEN
                    //     TESTFIELD("Bal. Paymt. MD", 1);
                    //   IF "Proposed Purchase Amount" <= 500000 THEN
                    //      TESTFIELD("Bal. Paymt. GM",1);

                    Rec.TESTFIELD("Bal. Paymt. HOD", 1);
                    Rec.TESTFIELD("Bal. Paymt. Audit", 1);
                    IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
                        IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                            Rec.TESTFIELD("Bal. Paymt. GM", 1);
                        END ELSE BEGIN
                            Rec.TESTFIELD("Bal. Paymt. MD", 1);
                            IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                                Rec.TESTFIELD("Bal. Paymt. GM", 1);
                            END ELSE BEGIN
                                Rec.TESTFIELD("Bal. Paymt. MD", 1);

                            END;
                        END;
                    END;

                    IOUReg.SETRANGE("Procurement No.", Rec."No.");
                    IF IOUReg.FINDFIRST THEN
                        PAGE.RUNMODAL(70031, IOUReg);

                    IOUReg.SETRANGE("Procurement No.", Rec."No.");
                    IF NOT IOUReg.FINDFIRST THEN BEGIN
                        IOUReg.INIT;
                        IOUReg."Entry Date" := Rec.Date;
                        IOUReg."Procurement No." := Rec."No.";
                        IOUReg."Procurement Type" := Rec."Document Type";
                        IOUReg.INSERT(TRUE);
                        COMMIT;
                        IOUReg.SETRANGE("Procurement No.", Rec."No.");
                        PAGE.RUNMODAL(70031, IOUReg);
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


                    Rec.TESTFIELD("Bal. Paymt. HOD", 1);
                    Rec.TESTFIELD("Bal. Paymt. Audit", 1);
                    IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
                        IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                            Rec.TESTFIELD("Bal. Paymt. GM", 1);
                        END ELSE BEGIN
                            Rec.TESTFIELD("Bal. Paymt. MD", 1);
                            IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                                Rec.TESTFIELD("Bal. Paymt. GM", 1);
                            END ELSE BEGIN
                                Rec.TESTFIELD("Bal. Paymt. MD", 1);

                            END;
                        END;
                    END;


                    IF NOT CONFIRM(Text016, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70010, PaymentRec2)
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

                    Rec.TESTFIELD("Bal. Paymt. HOD", 1);
                    Rec.TESTFIELD("Bal. Paymt. Audit", 1);
                    IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
                        IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                            Rec.TESTFIELD("Bal. Paymt. GM", 1);
                        END ELSE BEGIN
                            Rec.TESTFIELD("Bal. Paymt. MD", 1);
                            IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                                Rec.TESTFIELD("Bal. Paymt. GM", 1);
                            END ELSE BEGIN
                                Rec.TESTFIELD("Bal. Paymt. MD", 1);

                            END;
                        END;
                    END;

                    IF NOT CONFIRM(Text017, FALSE) THEN BEGIN
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70097, PaymentRec2)
                    END ELSE BEGIN
                        PaymentRec.INIT;
                        PaymentRec."Document Type" := PaymentRec."Document Type"::Journal;
                        PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                        PaymentRec."Account Type" := PaymentRec."Account Type"::Vendor;
                        PaymentRec."Procurement No." := Rec."No.";
                        PaymentRec.INSERT(TRUE);
                        COMMIT;
                        MESSAGE(Text018);
                        PaymentRec2.SETRANGE("Procurement No.", Rec."No.");
                        IF PaymentRec2.FINDFIRST THEN
                            PAGE.RUNMODAL(70011, PaymentRec2);
                        Rec."Voucher Raised" := TRUE;
                        Rec.MODIFY;
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Send THEN BEGIN
            OpexAppr := TRUE
        END
        ELSE
            OpexAppr := FALSE;

        IF Rec."Proposed Purchase Amount" <= 500000 THEN BEGIN
            GMAppr := TRUE;
            MDAppr := FALSE;
        END ELSE BEGIN
            GMAppr := FALSE;
            MDAppr := TRUE;
        END;

        IF Rec.Compliance = TRUE THEN
            Check := TRUE;

        IF Rec."Service Delivery2" = Rec."Service Delivery2"::Satisfactory THEN
            BalPay := TRUE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."No." <> '' THEN BEGIN
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



            IF NOT (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
                IF (Rec."Proposed Purchase Amount" <= 500000) THEN BEGIN
                    BalGM := TRUE;
                    BalMD := FALSE;
                    BalPay := TRUE;
                    Rec.MODIFY
                END ELSE BEGIN
                    BalGM := FALSE;
                    BalMD := TRUE;
                    BalPay := TRUE;
                    Rec.MODIFY

                END
            END ELSE BEGIN
                IF (Rec."Proposed Purchase Amount" <= 50000) THEN BEGIN
                    BalGM := TRUE;
                    BalMD := FALSE;
                    BalPay := TRUE;
                    Rec.MODIFY
                END ELSE BEGIN
                    BalGM := FALSE;
                    BalMD := TRUE;
                    BalPay := TRUE;
                    Rec.MODIFY

                END;
            END;
        END;

        IF (Rec.Send = TRUE) OR (Rec."Payment Approval Only" = TRUE) THEN
            EditSend := FALSE ELSE
            EditSend := TRUE;
    end;

    var
        Text001: Label 'An invoice from a vendor is required for this transaction!';
        OpexLine: Record 70001;
        Text002: Label '3 quotes from 3 vendors will be required for this transaction!';
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
        Text003: Label 'Are you sure you want to create an e-payment voucher?';
        Text011: Label 'A request for payment has been made. Kindly approve!';
        Text012: Label 'This document requires a compliance check and approval for payment!';
        Text015: Label 'A payment voucher has been raised!';
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
        Text016: Label 'Are you sure you want to create an cheque requisition?';
        Text017: Label 'A cheque requisition  has been raised!';
        Text018: Label 'Are you sure you want to generate a journal voucher?';
        Text019: Label 'A journal  voucher  has been raised!';
        EditSend: Boolean;
}

