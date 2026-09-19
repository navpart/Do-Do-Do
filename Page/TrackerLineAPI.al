page 50054 TrackerLineAPI
{
    ApplicationArea = All;
    Caption = 'TrackerLineAPI';
    PageType = List;
    SourceTable = "Search Tracker Line";
    UsageCategory = Lists;
    DelayedInsert = true;
    AutoSplitKey = true;
    DeleteAllowed = true;
    MultipleNewLines = true;

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
                field("Part No"; Rec."Part No")
                {
                    ToolTip = 'Specifies the value of the Part No field.', Comment = '%';
                }
                field("Part Description"; Rec."Part Description")
                {
                    ToolTip = 'Specifies the value of the Part Description field.', Comment = '%';
                }

                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                    ToolTip = 'Specifies the value of the Quantity Demanded field.', Comment = '%';
                }
                field("Quantity Supplied"; Rec."Quantity Supplied")
                {

                }
            }
        }
    }
}
