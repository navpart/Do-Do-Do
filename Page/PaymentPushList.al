namespace AL_TNL.AL_TNL;

page 50071 "Payment Push List"
{
    ApplicationArea = All;
    Caption = 'Payment Push List';
    PageType = List;
    SourceTable = "Payment Push";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Webservice Url"; Rec."Webservice Url")
                {
                    ToolTip = 'Specifies the value of the Webservice Url field.', Comment = '%';
                }
                field("Temporary Folder"; Rec."Temporary Folder")
                {
                    ToolTip = 'Specifies the value of the Temporary Folder field.', Comment = '%';
                }
            }
        }
    }
}
