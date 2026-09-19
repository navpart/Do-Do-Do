page 50386 "Sublet Register Card"
{
    PageType = Card;
    SourceTable = "Sublet Service";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sublet Code"; Rec."Sublet Code")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE(TRUE);
                    end;
                }
                field("Sublet Descriptions"; Rec."Sublet Descriptions")
                {
                }
                field("Standard Duration"; Rec."Standard Duration")
                {
                }
                field("Standard Cost"; Rec."Standard Cost")
                {
                }
                field("Standard Price"; Rec."Standard Price")
                {
                }
                field("Debit Account"; Rec."Debit Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

