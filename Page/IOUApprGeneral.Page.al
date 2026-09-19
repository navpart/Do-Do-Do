page 70239 "IOU Appr. General"
{
    ApplicationArea = All;
    PageType = List;
    Editable = false;
    SourceTable = "IOU Register";
    SourceTableView = WHERE("Send for Approval" = FILTER('Yes'),
                            "Global Dimension 1 Code" = FILTER(<> '08AUDSYS'),
                            "2nd Apprv. Status" = FILTER(' '),
                            "2nd Approval to" = FILTER('ADEWUMI'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Collected By"; Rec."Collected By")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Account No.";Rec."Account No.")
                {

                }
                field("Account Name";Rec."Account Name")
                {
                    
                }
            }
        }
    }

    actions
    {
    }
}

