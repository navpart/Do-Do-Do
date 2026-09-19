page 80053 "Customer Type"
{
    PageType = List;
    SourceTable = "Customer Type";
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
                field("Code Name"; Rec."Code Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

