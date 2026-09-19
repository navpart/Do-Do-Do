page 50053 TrackerHeaderAPI
{
    ApplicationArea = All;
    Caption = 'TrackerHeaderAPI';
    PageType = List;
    SourceTable = "Search Tracker Header";
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
                field("Request by"; Rec."Request by")
                {
                    ToolTip = 'Specifies the value of the Request by field.', Comment = '%';
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                    ToolTip = 'Specifies the value of the Request Customer Name field.', Comment = '%';
                }
                field("Request Customer Address"; Rec."Request Customer Address")
                {
                    ToolTip = 'Specifies the value of the Request Customer Address field.', Comment = '%';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ToolTip = 'Specifies the value of the Request Date field.', Comment = '%';
                }
                field("Order Type"; Rec."Order Type")
                {
                    ToolTip = 'Specifies the value of the Order Type field.', Comment = '%';
                }
                field("Online Order"; Rec."Online Order")
                {
                    ToolTip = 'Specifies the value of the Online Order field.', Comment = '%';
                }
            }
        }
    }
}
