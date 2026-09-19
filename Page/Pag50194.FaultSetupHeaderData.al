namespace AL_TNL.AL_TNL;

page 50194 "Fault Setup Header Data"
{
    ApplicationArea = All;
    Caption = 'Fault Setup Header Data';
    PageType = List;
    SourceTable = "Fault Setup HeaderX";
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
