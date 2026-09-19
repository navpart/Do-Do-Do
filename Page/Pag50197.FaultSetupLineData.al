namespace AL_TNL.AL_TNL;

page 50197 "Fault Setup Line Data2"
{
    ApplicationArea = All;
    Caption = 'Fault Setup Line Data2';
    PageType = List;
    SourceTable = "Fault Setup Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Operation code"; Rec."Operation code")
                {
                    ToolTip = 'Specifies the value of the Operation code field.', Comment = '%';
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.', Comment = '%';
                }
                field("Model Description"; Rec."Model Description")
                {
                    ToolTip = 'Specifies the value of the Model Description field.', Comment = '%';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
            }
        }
    }
}
