report 50209 "Sales summary TSP1004"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/SalessummaryTSP1004.rdl';

    dataset
    {
        dataitem(SalesInvHeader; "Sales Invoice Header")
        {
            DataItemTableView = WHERE("Bill-to Customer No." = FILTER('TDP*'));
            RequestFilterFields = "Posting Date", "Location Code", "Bill-to Customer No.";
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; "No.")
            {
            }
            column(BilltoCustomerNo_SalesInvoiceHeader; "Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Bill-to Name")
            {
            }
            column(PostingDate_SalesInvoiceHeader; "Posting Date")
            {
            }
            column(Amount_SalesInvoiceHeader; Amount)
            {
            }
            column(SalesHeaderFilters; SalesHeaderFilters)
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; "Amount Including VAT")
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        SalesHeaderFilters := SalesInvHeader.GETFILTERS;
    end;

    var
        SalesHeaderFilters: Text;
}

