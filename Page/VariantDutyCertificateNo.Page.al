page 50170 "Variant Duty Certificate No."
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Stockkeeping Unit";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Chassis Number"; Rec."Chassis Number")
                {
                    Editable = false;
                }
                field("Engine Number"; Rec."Engine Number")
                {
                    Editable = false;
                }
                field(Colour; Rec.Colour)
                {
                    Editable = false;
                }
                field("Sold To"; Rec."Sold To")
                {
                    Editable = false;
                }
                field("Sales Inv No."; Rec."Sales Inv No.")
                {
                }
                field("Sales Inv. Date"; Rec."Sales Inv. Date")
                {
                }
                field("Duty Cert No."; Rec."Duty Cert No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        CRec: Record 18;
}

