page 50149 "Purch. Line Comment List"
{
    Caption = 'Comment List';
    DataCaptionFields = "Table Name", "No.";
    Editable = false;
    PageType = Card;
    SourceTable = "Comment Line";
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
                field(Date; Rec.Date)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

