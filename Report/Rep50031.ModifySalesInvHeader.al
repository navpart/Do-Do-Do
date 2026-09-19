namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

report 50031 "Modify Sales Inv. Header"
{
    ApplicationArea = All;
    Caption = 'Modify Sales Inv. Header';
    UsageCategory = Lists;
    permissions = TableData "Sales Invoice Header" = rm;
    processingonly = true;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            requestfilterfields = "No.";
            column(No; "No.")
            {
            }
            trigger OnAfterGetRecord()

            begin
                SalesInvoiceHeader."Sent to NRS" := true;
                SalesInvoiceHeader.Modify();
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
