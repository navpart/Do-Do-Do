page 50001 "Test Email Attachment"
{
    PageType = List;
    SourceTable = Test;
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Take Action"; Rec."Take Action")
                {

                }
            }
        }
    }

    actions
    {
    }
}

