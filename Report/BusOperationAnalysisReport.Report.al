report 50634 "Bus. Operation Analysis Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BusOperationAnalysisReport.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Service Invoice Line")
        {
            DataItemTableView = WHERE("Local Buys" = FILTER(true),
                                      "Location Code" = FILTER('120ISO' | '150ISOLO'));
            RequestFilterFields = "Posting Date", "No.", Quantity, "Unit Cost (LCY)", "Unit Price", Amount, "Model Name";
            column(No_ServiceInvoiceLine; "No.")
            {
            }
            column(Description_ServiceInvoiceLine; Description)
            {
            }
            column(Quantity_ServiceInvoiceLine; Quantity)
            {
            }
            column(UnitPrice_ServiceInvoiceLine; "Unit Price")
            {
            }
            column(UnitCostLCY_ServiceInvoiceLine; "Unit Cost (LCY)")
            {
            }
            column(Amount_ServiceInvoiceLine; Amount)
            {
            }
            column(ServiceItemSerialNo_ServiceInvoiceLine; "Service Item Serial No.")
            {
            }
            column(PostingDate_ServiceInvoiceLine; "Posting Date")
            {
            }
            column(ModelNo_ServiceInvoiceLine; "Model No.")
            {
            }
            column(ModelName_ServiceInvoiceLine; "Model Name")
            {
            }
            column(VIN_ServiceInvoiceLine; VIN)
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
}

