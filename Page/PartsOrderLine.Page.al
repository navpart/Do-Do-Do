page 90064 "Parts Order Line"
{
    PageType = List;
    SourceTable = "Parts Order Line";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field(Line; Rec.Line)
                {
                }
                field("Part Name"; Rec."Part Name")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

