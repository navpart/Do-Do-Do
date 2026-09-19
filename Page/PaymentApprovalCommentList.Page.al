page 50201 "Payment Approval Comment List"
{
    Caption = 'Comment List';
    DataCaptionFields = "No.";
    DeleteAllowed = false;
    Editable = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "Payment Approval Comment Line";
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
                field(Code; Rec.Code)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

