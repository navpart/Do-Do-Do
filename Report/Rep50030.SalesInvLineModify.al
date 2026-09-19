namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

report 50030 "SalesInvLine Modify"
{
    ApplicationArea = All;
    Caption = 'SalesInvLine Modify';
    UsageCategory = Lists;
    Permissions = tabledata "Sales Invoice Line" = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesInvoiceLine; "Sales Invoice Line")
        {
            RequestFilterFields = "Document No.";
            column(No; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Yr := Format(CurrentDateTime, 0, '<Year4>');
                Mth := Format(CurrentDateTime, 0, '<Month,2>');
                Dy := Format(CurrentDateTime, 0, '<Day,2>');

                SalesInvoiceLine.IRN := SalesInvoiceLine."Document No." + '-' + 'B17E2F91' + '-' + Yr + Mth + Dy;
                SalesInvoiceLine.TIN := '1234567890';
                SalesInvoiceLine.Modify();
            end;
        }

    }
    var
        Yr: Text;
        Mth: Text;
        Dy: Text;

}
