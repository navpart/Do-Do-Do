namespace AL_TNL.AL_TNL;

page 50095 "API Test List"
{
    ApplicationArea = All;
    Caption = 'API Test List';
    PageType = List;
    SourceTable = "API Test";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Approve; Rec.Approve)
                {
                    ToolTip = 'Specifies the value of the Approve field.', Comment = '%';
                }
                field(Approver; Rec.Approver)
                {
                    ToolTip = 'Specifies the value of the Approver field.', Comment = '%';
                }
                field(DocNo; Rec.DocNo)
                {
                    ToolTip = 'Specifies the value of the DocNo field.', Comment = '%';
                }
            }
        }
    }
}
