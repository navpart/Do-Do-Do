page 70508 "BP Worksheet Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "BP Worksheet Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                    BlankZero = true;
                    DecimalPlaces = 0 : 2;
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Incl.VAT"; Rec."Amount Incl.VAT")
                {
                }
            }
        }
    }

    actions
    {
    }
}

