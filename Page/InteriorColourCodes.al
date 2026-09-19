namespace AL_TNL.AL_TNL;

page 50192 "Interior Colour Codes"
{
    ApplicationArea = All;
    Caption = 'Interior Colour Codes';
    PageType = List;
    SourceTable = "Interior Colour Codes";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ToolTip = 'Specifies the value of the Product Group Code field.', Comment = '%';
                }
                field("Interior Colour Code"; Rec."Interior Colour Code")
                {
                    ToolTip = 'Specifies the value of the Interior Colour Code field.', Comment = '%';
                }
                field("Interior Colour Name"; Rec."Interior Colour Name")
                {
                    ToolTip = 'Specifies the value of the Interior Colour Name field.', Comment = '%';
                }
            }
        }
    }
}
