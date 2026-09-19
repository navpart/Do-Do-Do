namespace AL_TNL.AL_TNL;

page 50076 "POS Terminals"
{
    ApplicationArea = All;
    Caption = 'POS Terminals';
    PageType = List;
    SourceTable = "POS Terminal";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Device No."; Rec."Device No.")
                {
                    ToolTip = 'Specifies the value of the Device No. field.', Comment = '%';
                }
                field("Bank No."; Rec."Bank No.")
                {
                    ToolTip = 'Specifies the value of the Bank No. field.', Comment = '%';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
            }
        }
    }
}
