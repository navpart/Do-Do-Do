namespace AL_TNL.AL_TNL;

page 50196 "Fault Setup Header Data2"
{
    ApplicationArea = All;
    Caption = 'Fault Setup Header Data2';
    PageType = List;
    SourceTable = "Fault Setup Header";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Operation Code"; Rec."Operation Code")
                {
                    ToolTip = 'Specifies the value of the Operation Code field.', Comment = '%';
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.', Comment = '%';
                }
                field("Model Name"; Rec."Model Name")
                {
                    ToolTip = 'Specifies the value of the Model Name field.', Comment = '%';
                }
            }
        }
    }
}
