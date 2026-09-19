page 50203 "Posted Labour Claims"
{
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Warranty Closed" = filter(false),
                            "Claim Materials Posted" = filter(true),
                            "Claim Charges Posted" = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Claim No."; Rec."Claim No.")
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("Process Date"; Rec."Process Date")
                {
                }
                field("Vehicle Identification No."; Rec."Vehicle Identification No.")
                {
                }
                field("Owners Name"; Rec."Owners Name")
                {
                }
                field("Vehicle Engine No."; Rec."Vehicle Engine No.")
                {
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                }
                field("Settlement Report No."; Rec."Settlement Report No.")
                {
                }
                field("SRN Date"; Rec."SRN Date")
                {
                }
                field("Under Warranty"; Rec."Under Warranty")
                {
                }
                field("Warranty Expired"; Rec."Warranty Expired")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Warranty Claim Exist"; Rec."Warranty Claim Exist")
                {
                }
                field("Warranty Expired Date"; Rec."Warranty Expired Date")
                {
                }
                field("TWC No."; Rec."TWC No.")
                {
                }
                field("Total Material Claim cost"; Rec."Total Material Claim cost")
                {
                }
                field("Total Labour Claim"; Rec."Total Labour Claim")
                {
                }
                field("Warranty Refund Account"; Rec."Warranty Refund Account")
                {
                }
                field("Mat Amt Refunded by TMC(FCY)"; Rec."Mat Amt Refunded by TMC(FCY)")
                {
                }
                field("Labor Amt Refunded by TMC(FCY)"; Rec."Labor Amt Refunded by TMC(FCY)")
                {
                }
                field("Labour Charge accepted by TMC"; Rec."Labour Charge accepted by TMC")
                {
                }
                field("Batch No."; Rec."Batch No.")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("CLaim Refunded By TMC Date"; Rec."CLaim Refunded By TMC Date")
                {
                }
                field("Material Claim Approved"; Rec."Material Claim Approved")
                {
                }
                field("Replace Dealer Material Claim"; Rec."Replace Dealer Material Claim")
                {
                }
                field("Labour Claim Approved"; Rec."Labour Claim Approved")
                {
                }
                field("Refund Dealer Labour Claim"; Rec."Refund Dealer Labour Claim")
                {
                }
                field("Claim Materials Posted"; Rec."Claim Materials Posted")
                {
                }
                field("Claim Charges Posted"; Rec."Claim Charges Posted")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Claim Refund by TMC"; Rec."Claim Refund by TMC")
                {
                }
                field("Claim Settled by TMC"; Rec."Claim Settled by TMC")
                {
                    Visible = false;
                }
                field("Warranty Closed"; Rec."Warranty Closed")
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                }
            }
            part(multiline; 50162)
            {
                SubPageLink = "Claim No." = FIELD("Claim No."),
                              "Vehicle identification Number" = FIELD("Vehicle Identification No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Picking List")
            {
                Caption = 'Print Picking List';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    recrep.SETRANGE(recrep."Claim No.", Rec."Claim No.");
                    IF recrep.FIND('-') THEN
                        REPORT.RUNMODAL(50254, TRUE, TRUE, recrep);
                end;
            }
            action("Print Picking List.")
            {
                Caption = 'Print Picking List.';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    recrep.SETRANGE(recrep."Claim No.", Rec."Claim No.");
                    IF recrep.FIND('-') THEN
                        REPORT.RUNMODAL(50237, TRUE, TRUE, recrep);
                end;
            }
            action("Print Invoice1")
            {
                Caption = 'Print Invoice';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    recrep.SETRANGE(recrep."Claim No.", Rec."Claim No.");
                    IF recrep.FIND('-') THEN
                        REPORT.RUNMODAL(50229, TRUE, TRUE, recrep);
                end;
            }
            group("Pri&nt")
            {
                Caption = 'Pri&nt';
                action("Picking List")
                {
                    Caption = 'Picking List';

                    trigger OnAction()
                    begin
                        recrep.SETRANGE(recrep."Claim No.", Rec."Claim No.");
                        IF recrep.FIND('-') THEN
                            REPORT.RUNMODAL(50237, TRUE, TRUE, recrep);
                    end;
                }
                separator(Control1)
                {
                }
                action("Print Invoice")
                {
                    Caption = 'Print Invoice';

                    trigger OnAction()
                    begin
                        recrep.SETRANGE(recrep."Claim No.", Rec."Claim No.");
                        IF recrep.FIND('-') THEN
                            REPORT.RUNMODAL(50229, TRUE, TRUE, recrep);
                    end;
                }
            }
        }
    }

    var
        recrep: Record 50038;
}

