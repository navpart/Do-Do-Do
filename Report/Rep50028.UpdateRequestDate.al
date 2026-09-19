namespace AL_TNL.AL_TNL;

report 50028 "Update Request Date"
{
    ApplicationArea = All;
    Caption = 'Update Request Date';
    UsageCategory = Lists;
    ProcessingOnly = true;
    dataset
    {
        dataitem(SearchTrackerLine; "Search Tracker Line")
        {
            column(DocumentNo; "Document No.")
            {
            }
            trigger OnAfterGetRecord()
            var
                SearchTrackerHeader: Record "Search Tracker Header";
            begin
                SearchTrackerHeader.SetRange("No.", "Document No.");
                if SearchTrackerHeader.FindFirst() then begin
                    repeat
                        "Request Date" := SearchTrackerHeader."Request Date";
                        "Request by" := SearchTrackerHeader."Request by";
                        Modify();
                    until SearchTrackerHeader.Next() = 0;
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
