page 50385 "Sublet List"
{
    CardPageID = "Sublet Register Card";
    PageType = List;
    SourceTable = "Sublet Service";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sublet Code"; Rec."Sublet Code")
                {
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
        area(processing)
        {
            action("Sublet &Card ")
            {
                Caption = 'Sublet &Card ';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50386;
                RunPageOnRec = true;
            }
        }
    }
}

