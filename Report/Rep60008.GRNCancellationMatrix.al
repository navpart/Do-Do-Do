report 60008 "GRN Cancellation Matrix"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/GRNCancellationMatrix.rdl';
    Caption = 'GRN Cancellation Matrix';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
        {
            DataItemTableView = SORTING("Sell-to Customer No.");
            RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Location Code";

            column(CancellationReasonTxt; CancellationReasonTxt)
            {
            }
            column(CancellationReasonSort; CancellationReasonSort)
            {
            }
            column(SellToCustomerNo; "Sell-to Customer No.")
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(LineCount; 1)
            {
            }
            column(LineAmount; Amount)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(ReportFilters; ReportFilters)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }

            trigger OnPreDataItem()
            begin
                ReportFilters := GETFILTERS;
            end;

            trigger OnAfterGetRecord()
            begin
                // Set and trim cancellation reason text; skip blank reason
                CancellationReasonTxt := DELCHR(FORMAT("Cancellation Reason"), '<>', ' ');
                if CancellationReasonTxt = '' then
                    CurrReport.SKIP;

                // Filter to Dealer customers only
                if not DealerCust.GET("Sell-to Customer No.") then
                    CurrReport.SKIP;
                if FORMAT(DealerCust.Customertype) <> 'Dealer' then
                    CurrReport.SKIP;

                CustomerName := DealerCust.Name;

                // Assign sort order matching the OptionCaption sequence
                case CancellationReasonTxt of
                    'Invoice Cancellation':
                        CancellationReasonSort := 1;
                    'Purchase Reversal':
                        CancellationReasonSort := 2;
                    'Price Difference':
                        CancellationReasonSort := 3;
                    'Order Duplication':
                        CancellationReasonSort := 4;
                    'Defective Supply':
                        CancellationReasonSort := 5;
                    'Technical Issues':
                        CancellationReasonSort := 6;
                    'Delayed ETA':
                        CancellationReasonSort := 7;
                    'Others':
                        CancellationReasonSort := 8;
                    else
                        CancellationReasonSort := 99;
                end;
            end;
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

    var
        DealerCust: Record Customer;
        CancellationReasonTxt: Text[100];
        CancellationReasonSort: Integer;
        CustomerName: Text[100];
        ReportFilters: Text[250];
}
