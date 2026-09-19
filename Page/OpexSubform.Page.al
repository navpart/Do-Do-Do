page 70127 "Opex Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    DeleteAllowed = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Procurement Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Preferred; Rec.Preferred)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                }
                field("Advance Payment"; Rec."Advance Payment")
                {
                    Editable = false;
                }
                field(Balance; Rec.Balance)
                {
                    Editable = false;
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec."Incoming Document Entry No." > 0 THEN
                            HYPERLINK(Rec.GetIncomingDocumentURL);
                    end;

                    /* trigger OnLookup(var Text: Text): Boolean
                    begin
                        IncomingDocument.SETRANGE("Entry No.", Rec."Incoming Document Entry No.");
                        IF PAGE.RUNMODAL(0, IncomingDocument) = ACTION::LookupOK THEN
                            Rec."Incoming Document Entry No." := IncomingDocument."Entry No.";
                    end; */
                }
                field(Description; Rec.Description)
                {
                }
                field(Remark; Rec.Remark)
                {
                }
            }

        }

    }

    actions
    {
        area(processing)
        {
            action("View Details")
            {
                Caption = 'View Details';
                Image = ViewDetails;
                RunObject = Page "Procurement Details";
                RunPageLink = "Document Type" = field("Document Type"), "Document No." = FIELD("Document No."), "Capex Line No." = FIELD("Line No.");
            }
            action("Generate LPO")
            {
                Caption = 'Generate LPO';
                Image = CreateFinanceChargememo;
                //Promoted = true;
                //PromotedCategory = Process;
                //PromotedIsBig = true;

                trigger OnAction()
                begin

                    PaymentRec3.SETRANGE(PaymentRec3."No.", Rec."Document No.");
                    PaymentRec3.SETRANGE(PaymentRec3."Adv. Pymt. Required", FALSE);
                    IF PaymentRec3.FINDFIRST THEN
                        //PaymentRec3.TESTFIELD(PaymentRec3."Move to LPO",TRUE);


                        IF PaymentRec3."Proposed Purchase Amount" < 150000 THEN
                            ERROR('You didnt need an LPO this transaction');
                    IF PaymentRec3."Opex Type" IN [PaymentRec3."Opex Type"::SLA, PaymentRec3."Opex Type"::SE] THEN
                        ERROR('You do not need an LPO this transaction');

                    LPO.SETRANGE("Purch.Requisition No", Rec."Document No.");
                    IF LPO.FINDFIRST THEN
                        ERROR('The LPO has been generated!');

                    IF CONFIRM(Text001) THEN BEGIN
                        Rec.SETRANGE(Preferred, TRUE);
                        IF Rec.FINDFIRST THEN BEGIN
                            LPO.INIT;
                            LPO."Vendor Name" := Rec."Vendor Name";
                            LPO.Address := Rec.Address;
                            LPO.Amount := Rec.Amount;
                            LPO.Description := Rec.Description;
                            LPO."Payment Terms" := Rec."Payment Terms";
                            LPO."Capex-Opex No." := Rec."Document No.";
                            LPO."Purch.Requisition No" := Rec."Document No.";
                            Rec."LPO No." := LPO."LPO No.";
                            LPO.INSERT(TRUE);
                            COMMIT;
                            MESSAGE(Text002);
                            LPO.SETRANGE("Capex-Opex No.", Rec."Document No.");
                            IF LPO.FINDFIRST THEN
                                PAGE.RUNMODAL(70142, LPO);
                        END;
                    END;
                end;
            }
        }

    }


    var
        IncomingDocument: Record 130;
        ProcurementLine3: Record 70001;
        PaymentRec3: Record 70008;
        LPO: Record 70010;
        Text001: Label 'Are you sure you want to generate an LPO?';
        Text002: Label 'An LPO has been raised!';
        CapexOpexLine: Record 70001;
        CapexOpexReq: Record 70008;
}

