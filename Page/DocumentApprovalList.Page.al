page 70046 "Document Approval List"
{
    CardPageID = "Document Approval Card";
    PageType = List;
    SourceTable = "Document Approval";
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
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Level 1"; Rec."Level 1")
                {
                }
                field("Level 2"; Rec."Level 2")
                {
                }
                field("Level 3"; Rec."Level 3")
                {
                }
                field("Sender 1"; Rec."Sender 1")
                {
                }
                field("Sender 2"; Rec."Sender 2")
                {
                }
                field("Sender 3"; Rec."Sender 3")
                {
                }
                field("Sender 4"; Rec."Sender 4")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Document Title"; Rec."Document Title")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Type"; Rec."Payment Type")
                {
                }
                field("Pending Person"; Rec."Pending Person")
                {
                }
            }
        }
    }

    actions
    {
    }
}

