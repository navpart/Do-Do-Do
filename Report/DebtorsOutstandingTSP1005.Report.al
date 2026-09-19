report 50211 "Debtors Outstanding TSP1005"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/DebtorsOutstandingTSP1005.rdl';
    Caption = 'Debtors Outstanding TSP1005';

    dataset
    {
        dataitem(DataItem1; "Cust. Ledger Entry")
        {
            DataItemTableView = WHERE("Document Type" = FILTER(Invoice), "Posting Group" = FILTER('N_PARTS'));
            RequestFilterFields = "Posting Date", "Customer No.", "Global Dimension 2 Code";
            column(ClosedatDate_CustLedgerEntry; "Closed at Date")
            {
            }
            column(ClosedbyAmount_CustLedgerEntry; "Closed by Amount")
            {
            }
            column(AppliedDocNo_CustLedgerEntry; "Applied Doc. No.")
            {
            }
            column(PaymentDocNo_CustLedgerEntry; "Payment Doc. No.")
            {
            }
            column(PaymentDocAmt_CustLedgerEntry; "Payment Doc. Amt.")
            {
            }
            column(CustomerNo_CustLedgerEntry; "Customer No.")
            {
            }
            column(PostingDate_CustLedgerEntry; "Posting Date")
            {
            }
            column(DocumentType_CustLedgerEntry; "Document Type")
            {
            }
            column(DocumentNo_CustLedgerEntry; "Document No.")
            {
            }
            column(Description_CustLedgerEntry; Description)
            {
            }
            column(CustomerName_CustLedgerEntry; CustName)
            {
            }
            column(CurrencyCode_CustLedgerEntry; "Currency Code")
            {
            }
            column(Amount_CustLedgerEntry; Amount)
            {
            }
            column(RemainingAmount_CustLedgerEntry; "Remaining Amount")
            {
            }
            column(OriginalAmtLCY_CustLedgerEntry; "Original Amt. (LCY)")
            {
            }
            column(RemainingAmtLCY_CustLedgerEntry; "Remaining Amt. (LCY)")
            {
            }
            column(AmountLCY_CustLedgerEntry; "Amount (LCY)")
            {
            }
            column(CalculateDate; CalDate)
            {
            }
            column(Age; TODAY - "Posting Date")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalDate := TODAY;
                if Customer.Get("Customer No.") then begin
                    CustName := Customer.Name;
                end else begin
                    CustName := '';
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
        CalDate: Date;
        CustName: Text[200];
        Customer: Record Customer;
}

