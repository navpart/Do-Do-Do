page 50049 PartLabourAPI
{
    ApplicationArea = All;
    Caption = 'PartLabourAPI';
    PageType = List;
    SourceTable = "Customer Order LineX";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Amount Inc. VAT"; Rec."Amount Inc. VAT")
                {
                    ToolTip = 'Specifies the value of the Amount Inc. VAT field.', Comment = '%';
                }
                
            }
        }
    }
}
