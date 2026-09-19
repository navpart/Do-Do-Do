namespace AL_TNL.AL_TNL;

page 50123 "Service Complaint List"
{
    ApplicationArea = All;
    Caption = 'Service Complaint List';
    PageType = List;
    CardPageId = "Service Complaint Card";
    SourceTable = "Complain TableX";
    SourceTableView = WHERE(Resolved = FILTER(false));
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Complain Code"; Rec."Complain Code")
                {
                    ToolTip = 'Specifies the value of the Complain Code field.', Comment = '%';
                }
                field("COF No."; Rec."COF No.")
                {
                    ToolTip = 'Specifies the value of the COF No. field.', Comment = '%';
                }
                field("COF Date"; Rec."COF Date")
                {
                    ToolTip = 'Specifies the value of the COF Date field.', Comment = '%';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ToolTip = 'Specifies the value of the Date of Complaint field.', Comment = '%';
                }
                field(Complaint; Rec.Complaint)
                {
                    ToolTip = 'Specifies the value of the Complaint field.', Comment = '%';
                }
            }
        }
    }
}
