page 50322 "Estimation Header"
{
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Estimate Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(Estimation)
            {
                Caption = 'Estimation';
                field("Estimate No"; Rec."Estimate No")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Address 1"; Rec."Address 1")
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field("Tel. No"; Rec."Tel. No")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Veh. Registration No."; Rec."Veh. Registration No.")
                {
                }
                field("Veh. Registration date"; Rec."Veh. Registration date")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Customer Order Form No"; Rec."Customer Order Form No")
                {
                }
                field("Estimate Factor"; Rec."Estimate Factor")
                {
                }
                field("Delivery Type"; Rec."Delivery Type")
                {
                }
                field("Payment Method"; Rec."Payment Method")
                {
                }
                field("Service Adviser"; Rec."Service Adviser")
                {
                }
            }
            part(lines; "Estimate Subform")
            {
                SubPageLink = "Estimate Code" = FIELD("Estimate No");
            }
            group(Delivery)
            {
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Customer come-in"; Rec."Delivery Type")
                {

                }
                field(Time; Rec.Time)
                {
                }
            }
            field("Total Estimation"; Rec."Total Estimation")
            {
                Editable = false;
            }
            field("Cost Changed"; Rec."Cost Changed")
            {
                Editable = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Estimate")
            {
                Caption = 'Print Estimate';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    estrec.SETRANGE(estrec."Estimate No", Rec."Estimate No");
                    IF estrec.FINDFIRST THEN
                        REPORT.RUNMODAL(50323, TRUE, TRUE, estrec);
                end;
            }
        }
    }

    var
        estrec: Record 50121;
}

