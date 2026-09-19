page 50613 "Change Management List"
{
    CardPageID = "Change Management Card";
    PageType = List;
    SourceTable = "Change Management";
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
                field("Requesters Name"; Rec."Requesters Name")
                {
                }
                field("Requesters Location"; Rec."Requesters Location")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Request Category"; Rec."Request Category")
                {
                }
            }
        }
    }

    actions
    {
    }
}

