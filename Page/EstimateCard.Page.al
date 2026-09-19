page 80011 "Estimate Card"
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
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
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
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field("Delivery Type"; Rec."Delivery Type")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Service Adviser"; Rec."Service Adviser")
                {
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
            part(Lines; "Estimate Subform")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }

    var
        estrec: Record 50121;
}

