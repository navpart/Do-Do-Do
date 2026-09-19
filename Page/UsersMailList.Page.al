page 50200 "Users Mail List"
{
    PageType = List;
    SourceTable = "User Setup";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Users Mail List';
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the user ID.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the email address of the user.';
                }
            }
        }
    }

    actions
    {
    }
}
