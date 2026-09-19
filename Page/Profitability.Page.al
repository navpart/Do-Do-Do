page 50442 Profitability
{
    Editable = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Profitability";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Units; Rec.Units)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Cost; Rec.Cost)
                {
                }
                field(Profit; Rec.Profit)
                {
                }
                field("Profit%"; Rec."Profit%")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF (Rec.Amount <> 0) AND (Rec.Cost <> 0) THEN BEGIN
            Rec.Profit := Rec.Amount + Rec.Cost;
            Rec."Profit%" := (Rec.Profit / Rec.Amount) * 100;
        END;
    end;
}

