page 50052 "Search Tracker Subform"
{
    ApplicationArea = All;
    Caption = 'Search Tracker Subform';
    PageType = ListPart;
    SourceTable = "Search Tracker Line";
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
                field("Part No"; Rec."Part No")
                {
                    ToolTip = 'Specifies the value of the Part No field.', Comment = '%';
                }
                field("Part Description"; Rec."Part Description")
                {
                    ToolTip = 'Specifies the value of the Part Description field.', Comment = '%';
                }
                field("Stock Type"; Rec."Stock Type")
                {
                    ToolTip = 'Specifies the value of the Stock Type field.', Comment = '%';
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.', Comment = '%';
                }
                field("Model Name"; Rec."Model Name")
                {
                    ToolTip = 'Specifies the value of the Model Name field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field(Variant; Rec.Variant)
                {
                    ToolTip = 'Specifies the value of the Variant field.', Comment = '%';
                }
                field(Supplied; Rec.Supplied)
                {
                    ToolTip = 'Specifies the value of the Supplied field.', Comment = '%';
                }

                field("Non Specification"; Rec."Non Specification")
                {
                    ToolTip = 'Specifies the value of the Non Specification field.', Comment = '%';
                }
                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                    ToolTip = 'Specifies the value of the Quantity Demanded field.', Comment = '%';
                }
                field("Quantity Supplied"; Rec."Quantity Supplied")
                {
                    ToolTip = 'Specifies the value of the Quantity Supplied field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
            }
        }
    }
}
