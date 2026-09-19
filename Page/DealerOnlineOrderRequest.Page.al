page 50156 "Dealer Online Order Request"
{
    PageType = Card;
    SourceTable = "Dealer Online Order Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field("Dealer No."; Rec."Dealer No.")
                {
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                }
                field("Dealer Address"; Rec."Dealer Address")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Process date"; Rec."Process date")
                {
                }
                field(Processed; Rec.Processed)
                {
                }
                field(Submit; Rec.Submit)
                {
                }
            }
            part(Lines; "Dealer Online order subform")
            {
                SubPageLink = "Claim No." = FIELD("Order No.");
            }
        }
    }

    actions
    {
    }
}

