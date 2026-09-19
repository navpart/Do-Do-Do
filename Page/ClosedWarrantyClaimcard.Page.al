page 50168 "Closed Warranty Claim card"
{
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Warranty Claim Header";
    SourceTableView = WHERE("Warranty Closed" = filter(true));
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
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                    Editable = false;
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                    Editable = false;
                }
                field("Process Date"; Rec."Process Date")
                {
                    Editable = false;
                }
                field("Vehicle Identification No."; Rec."Vehicle Identification No.")
                {
                    Editable = false;
                }
                field("Owners Name"; Rec."Owners Name")
                {
                    Editable = false;
                }
                field("Vehicle Engine No."; Rec."Vehicle Engine No.")
                {
                    Editable = false;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    Editable = false;
                }
                field("Model Year"; Rec."Model Year")
                {
                    Editable = false;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    Editable = false;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    Editable = false;
                }
                field("Settlement Report No."; Rec."Settlement Report No.")
                {
                    Editable = false;
                }
                field("SRN Date"; Rec."SRN Date")
                {
                    Editable = false;
                }
                field("Under Warranty"; Rec."Under Warranty")
                {
                    Editable = false;
                }
                field("Warranty Expired"; Rec."Warranty Expired")
                {
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Warranty Claim Exist"; Rec."Warranty Claim Exist")
                {
                }
                field("Warranty Expired Date"; Rec."Warranty Expired Date")
                {
                }
                field("Date Approved by TNL"; Rec."Date Approved by TNL")
                {
                    Editable = false;
                }
                field("TWC No."; Rec."TWC No.")
                {
                    Editable = false;
                }
                field("Total Material Claim cost"; Rec."Total Material Claim cost")
                {
                }
                field("Total Labour Claim"; Rec."Total Labour Claim")
                {
                }
                field("Warranty Refund Account"; Rec."Warranty Refund Account")
                {
                    Editable = false;
                }
                field("Mat Amt Refunded by TMC(FCY)"; Rec."Mat Amt Refunded by TMC(FCY)")
                {
                    Editable = false;
                }
                field("Labor Amt Refunded by TMC(FCY)"; Rec."Labor Amt Refunded by TMC(FCY)")
                {
                    Editable = false;
                }
                field("Labour Charge accepted by TMC"; Rec."Labour Charge accepted by TMC")
                {
                }
                field("Batch No."; Rec."Batch No.")
                {
                    Editable = false;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    Editable = false;
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
                field("Claim Charges Posted"; Rec."Claim Charges Posted")
                {
                }
                field("Claim Materials Posted"; Rec."Claim Materials Posted")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                    Editable = false;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    Editable = false;
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
                    Editable = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
            }
            part("Closed Claim"; 50169)
            {
                Editable = false;
                SubPageLink = "Claim No." = FIELD("Claim No."),
                              "Vehicle identification Number" = FIELD("Vehicle Identification No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
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

