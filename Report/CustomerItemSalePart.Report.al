report 50608 "Customer Item Sale-Part"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerItemSalePart.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Sales Invoice Line")
        {
            DataItemTableView = WHERE(Type = CONST(Item),
                                      "Inventoy Posting Group" = CONST('N_PARTS'));
            RequestFilterFields = "Posting Date", "Sell-to Customer No.";
            column(STRSUBSTNO_Text000_PeriodText_; STRSUBSTNO(Text000, PeriodText))
            {
            }

            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(ShipmentDate_SalesInvoiceLine; "Shipment Date")
            {
            }
            column(SelltoCustomerNo_SalesInvoiceLine; "Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceLine; "No.")
            {
            }
            column(Description_SalesInvoiceLine; Description)
            {
            }
            column(QtyDemanded_SalesInvoiceLine; "Qty. Demanded")
            {
            }
            column(Quantity_SalesInvoiceLine; Quantity)
            {
            }
            column(UnitPrice_SalesInvoiceLine; "Unit Price")
            {
            }
            column(UnitCostLCY_SalesInvoiceLine; "Unit Cost (LCY)")
            {
            }
            column(LineDiscountAmount_SalesInvoiceLine; "Line Discount Amount")
            {
            }
            column(Amount_SalesInvoiceLine; Amount)
            {
            }
            column(QuantityDemanded_SalesInvoiceLine; "Quantity Demanded")
            {
            }
            column(PostingDate_SalesInvoiceLine; "Posting Date")
            {
            }
            column(ProdGrpCode_SalesInvoiceLine; "Prod. Grp. Code")
            {
            }
            column(ProdCode_SalesInvoiceLine; "Prod. Code")
            {
            }
            column(CustomerName_SalesInvoiceLine; "Customer Name")
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

    var
        Text000: Label 'Period: %1';
        PeriodText: Text[30];
}

