page 50277 "Treasury Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Finance Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Receipts)
            {
                Caption = 'Receipts';
                field("Overdue Sales Documents"; Rec."Overdue Sales Documents")
                {
                    DrillDownPageID = "Customer Ledger Entries";
                }
                field("Overdue Service Documents"; Rec."Overdue Service Documents")
                {
                }
                field("Customer Payments Due-Today"; Rec."Customer Payments Due-Today")
                {
                }

                actions
                {
                    
                    action("Page Customer List")
                    {
                        Caption = 'View Customer Balances';
                        RunObject = Page 22;
                        RunPageMode = Create;
                    }
                    action(Navigate)
                    {
                        Caption = 'Navigate';
                        RunObject = Page 344;
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;

        Rec.SETFILTER("Due Date Filter", '<=%1', WORKDATE);
        Rec.SETFILTER("Overdue Date Filter", '<%1', WORKDATE);
    end;
}

