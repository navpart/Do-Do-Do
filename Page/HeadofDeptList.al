namespace AL_TNL.AL_TNL;

page 50120 "Head of Dept. List"
{
    ApplicationArea = All;
    Caption = 'Head of Dept. List';
    PageType = List;
    SourceTable = "Head of Department";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                }
                field("Head of Department"; Rec."Head of Department")
                {
                    ToolTip = 'Specifies the value of the Head of Department field.', Comment = '%';
                }
            }
        }
    }
}
