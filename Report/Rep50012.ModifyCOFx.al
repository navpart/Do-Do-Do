report 50012 "Modify COFx"
{
    ApplicationArea = All;
    Caption = 'Modify COFx';
    UsageCategory = Lists;
    ProcessingOnly = true;

    dataset
    {
        dataitem(CustomerOrderHeaderX; "Customer Order HeaderX")
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Delete(true);
                Modify();
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

