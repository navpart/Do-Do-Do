page 50050 "Search Tracker List New"
{
    ApplicationArea = All;
    Caption = 'Search Tracker List New';
    PageType = List;
    SourceTable = "Search Tracker Header";
    UsageCategory = Lists;
    CardPageId = "Search Tracker Card New";

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
                field("Request Date"; Rec."Request Date")
                {
                    ToolTip = 'Specifies the value of the Request Date field.', Comment = '%';
                }
                field("Request by"; Rec."Request by")
                {
                    ToolTip = 'Specifies the value of the Request by field.', Comment = '%';
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                    ToolTip = 'Specifies the value of the Request Customer Name field.', Comment = '%';
                }
                field("Time of Request"; Rec."Time of Request")
                {
                    ToolTip = 'Specifies the value of the Time of Request field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Last Time Modified"; Rec."Last Time Modified")
                {
                    ToolTip = 'Specifies the value of the Last Time Modified field.', Comment = '%';
                }
            }
        }
    }
}
