page 70230 "Item list List"
{
    PageType = List;
    SourceTable = "Item";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Last Purchase Date"; Rec."Last Purchase Date")
                {
                }
                field("Last Sales Date"; Rec."Last Sales Date")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

