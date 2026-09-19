page 70052 "Transfer Route List"
{
    CardPageID = "Transfer Routes";
    PageType = List;
    SourceTable = "Location";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

