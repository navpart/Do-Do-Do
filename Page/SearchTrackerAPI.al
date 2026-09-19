page 50045 "Search Tracker API"
{
    ApplicationArea = All;
    Caption = 'Search Tracker API';
    PageType = List;
    SourceTable = "Parts Enquiry";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Search Code"; Rec."Search Code")
                {
                    ToolTip = 'Specifies the value of the Search Code field.', Comment = '%';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
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
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                }
                field("Time of Request"; Rec."Time of Request")
                {
                    ToolTip = 'Specifies the value of the Time of Request field.', Comment = '%';
                }
                field("Part No"; Rec."Part No")
                {
                    ToolTip = 'Specifies the value of the Part No. field.', Comment = '%';
                }
                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                    ToolTip = 'Specifies the value of the Quantity Demanded field.', Comment = '%';
                }

            }
        }
    }
}
