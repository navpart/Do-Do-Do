page 50082 "Scholarship payment subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = true;
    MultipleNewLines = true;
    PageType = Card;
    SourceTable = "Scholarship Payment";
    SourceTableView = SORTING("Register No", "Employee No", "No.");
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Date Paid"; Rec."Date Paid")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field(Amount; Rec.Amount)
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

    var
        RegRec: Record "Scholarship Register";
        SchPayRec: Record "Scholarship Payment";
        AmtPaid: Decimal;
}

