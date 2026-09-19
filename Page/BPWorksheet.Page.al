page 70507 "BP Worksheet"
{
    PageType = Card;
    SourceTable = "BP Worksheet Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Comment; Rec.Comment)
                {
                    MultiLine = true;
                }
            }
            part(Lines; 70508)
            {
                SubPageLink = "Document No."=FIELD("No.");
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

