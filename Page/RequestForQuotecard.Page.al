page 70061 "Request For Quote card"
{
    PageType = Card;
    SourceTable = "Procurement Header";
    ApplicationArea = All;

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
                field("TCOF No."; Rec."TCOF No.")
                {
                    Editable = false;
                }
            }
            part("Vendor Details"; 70062)
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
                        field("General Manager"; Rec."General Manager")
                        {
                            Caption = 'General Manager';
                            Editable = EditGM2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                            Visible = GMAppr;
                        }
                        field("Name GM"; Rec."Name GM")
                        {
                            ShowCaption = false;
                            Visible = NameGM;
                        }
                        field(TimeDate3; Rec.TimeDate3)
                        {
                            ShowCaption = false;
                            Visible = Date3;
                        }
                    }
                    group(Control05)
                    {
                        field("Managing Director"; Rec."Managing Director")
                        {
                            Caption = 'Managing Director';
                            Editable = EditMD2;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                            Visible = MDAppr;
                        }
                        field("Name MD"; Rec."Name MD")
                        {
                            Editable = false;
                            ShowCaption = false;
                            Visible = NameMD;
                        }
                        field(TimeDate4; Rec.TimeDate4)
                        {
                            ShowCaption = false;
                            Visible = Date4;
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
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(TimeDate5; Rec.TimeDate5)
                        {
                            Editable = false;
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
                    group(Control010)
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
                    group(Control011)
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
                grid(Control012)
                {
                    group(Control013)
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
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(TimeDate8; Rec.TimeDate8)
                        {
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(Control014)
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
                    group(Control015)
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
                    group(Control016)
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
            action("Payment Approval Only")
            {
                Caption = 'Payment Approval Only';
                Image = CheckRulesSyntax;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProcurementLine.SETRANGE("Document Type", Rec."Document Type");
                    ProcurementLine.SETRANGE("Document No.", Rec."No.");
                    IF ProcurementLine.FINDFIRST THEN BEGIN
                        IF (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% after delivery") AND
                           (ProcurementLine."Payment Terms" <> ProcurementLine."Payment Terms"::"100% before delivery") THEN
                            ERROR('You cannot use payment approval only for advance payment.');

                    END;


                    Rec.TESTFIELD(Send, FALSE);
                    ProcurementLine.SETRANGE("Document Type", Rec."Document Type");
                    ProcurementLine.SETRANGE("Document No.", Rec."No.");
                    IF ProcurementLine.FINDFIRST THEN BEGIN
                        REPEAT
                            ProcurementLine.CALCFIELDS(Amount);
                            ProcurementLine.TESTFIELD(Amount);
                            ProcurementLine.TESTFIELD(Preferred, TRUE);
                        UNTIL ProcurementLine.NEXT = 0;
                    END;
                    Rec.TESTFIELD("Send To");
                    Rec.TESTFIELD("Proposed Purchase Amount");
                    IF Rec."Document Type" = Rec."Document Type"::Opex THEN
                        Rec.TESTFIELD("Opex Type");
                    IF Rec."Document Type" = Rec."Document Type"::Capex THEN
                        Rec.TESTFIELD("Capex Type");
                    IF Rec."Document Type" = Rec."Document Type"::Opex THEN
                        Rec.TESTFIELD("Purchase Type");

                    Rec.TESTFIELD("Purchase Justification");


                    Rec."Payment Approval Only" := TRUE;
                    Rec.Compliance := TRUE;
                    Rec.MODIFY;

                    MESSAGE('Kindly proceed to compliance check!');

                    //UserSetup.GET("Send To");
                    //ToAddresses := 'adewumi@toyotanigeria.com';
                    //CcAddresses := '';
                    //BccAddresses := '';
                    //Subject := STRSUBSTNO("No.");
                    //Body := Text012;
                    //AttachFilename := '';
                    //ShowNewMailDialogOnSend := TRUE;
                    //Mail.NewMessage(ToAddresses,CcAddresses,BccAddresses,Subject,Body,AttachFilename,ShowNewMailDialogOnSend);
                end;
            }
            action("Raise LPP")
            {
                Image = RegisterPick;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //IF "LPP Created" THEN
                    //  ERROR('LPP has been raised');

                    Rec.CreateLPP;
                    MESSAGE('LPP Raised');
                end;
            }
            action("View LPP")
            {
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70193;
                RunPageLink = "RFQ No." = FIELD("No."), "TCOF No." = FIELD("TCOF No.");
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

        //IF "Proposed Purchase Amount" <= 500000 THEN BEGIN
        //  GMAppr := TRUE;
        //  NameGM := TRUE;
        //  Date3  := TRUE;
        //  MDAppr := FALSE;
        //  NameMD := FALSE;
        //  Date4  := FALSE
        //END ELSE BEGIN
        //  GMAppr := FALSE;
        //  NameGM := FALSE;
        //  Date3  := FALSE;
        //  MDAppr := TRUE;
        //  NameMD := TRUE;
        //  Date4  := TRUE;
        //END;

        IF (Rec."Proposed Purchase Amount" <= 500000) AND (Rec."Opex Type" = Rec."Opex Type"::Entertainment) THEN BEGIN
            GMAppr := TRUE;
            NameGM := TRUE;
            Date3 := TRUE;
            MDAppr := FALSE;
            NameMD := FALSE;
            Date4 := FALSE
        END ELSE BEGIN
            GMAppr := FALSE;
            NameGM := FALSE;
            Date3 := FALSE;
            MDAppr := TRUE;
            NameMD := TRUE;
            Date4 := TRUE;
        END;





        IF Rec.Compliance = TRUE THEN
            Check := TRUE;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        ERROR('You can not delete this entry. Contact your System Administrator!')
    end;

    trigger OnOpenPage()
    begin
        //IF Send THEN BEGIN
        //  OpexAppr := TRUE END
        //ELSE OpexAppr := FALSE;
        IF Rec."No." <> '' THEN BEGIN
            IF Rec.Send THEN BEGIN
                OpexAppr := TRUE
            END
            ELSE
                OpexAppr := FALSE;

            //IF "Proposed Purchase Amount" <= 500000 THEN BEGIN
            //  GMAppr := TRUE;
            //  NameGM := TRUE;
            //  Date3  := TRUE;
            //  MDAppr := FALSE;
            //  NameMD := FALSE;
            //  Date4  := FALSE
            //END ELSE BEGIN
            //  GMAppr := FALSE;
            //  NameGM := FALSE;
            //  Date3  := FALSE;
            //  MDAppr := TRUE;
            //  NameMD := TRUE;
            //  Date4  := TRUE;
            //END;



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

            IF Rec."Payment Approval Only" = TRUE THEN BEGIN
                Check := TRUE;
                SendVisible := FALSE
            END ELSE BEGIN
                Check := FALSE;
                SendVisible := TRUE;
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
                //IF "Proposed Purchase Amount" <= 500000 THEN
                //BalGM := TRUE
                //ELSE
                //BalMD := TRUE;
                //BalPay := TRUE;
                //END;
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
            // IF (Send = TRUE)OR ("Payment Approval Only" = TRUE) THEN
            //    EditSend := FALSE ELSE
            //    EditSend := TRUE;
            EditApproval;
        END;
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
        Date5: Boolean;
        Date6: Boolean;
        BalMD: Boolean;
        BalGM: Boolean;
        ProcurementLine3: Record 70001;
        PaymentRec3: Record 50103;
        LPO: Record 70010;
        CapexLine: Record 70001;
        SendVisible: Boolean;
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
        ProcurementDetail: Record 70001;

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

