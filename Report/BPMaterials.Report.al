report 50632 "B&P Materials"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BPMaterials.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Service Line")
        {
            DataItemTableView = WHERE("Location Code" = CONST('131PWISOLO'));
            RequestFilterFields = "Document No.";
            column(CustomerNo_ServiceLine; "Customer No.")
            {
            }
            column(DocumentNo_ServiceLine; "Document No.")
            {
            }
            column(ServiceItemNo_ServiceLine; "Service Item No.")
            {
            }
            column(Description_ServiceLine; Description)
            {
            }
            column(Type_ServiceLine; Type)
            {
            }
            column(No_ServiceLine; "No.")
            {
            }
            column(LocationCode_ServiceLine; "Location Code")
            {
            }
            column(Quantity_ServiceLine; Quantity)
            {
            }
            column(UnitofMeasure_ServiceLine; "Unit of Measure")
            {
            }
            column(UnitPrice_ServiceLine; "Unit Price")
            {
            }
            column(LineAmount_ServiceLine; "Line Amount")
            {
            }
            column(VAT_ServiceLine; "VAT %")
            {
            }
            column(QtytoShip_ServiceLine; "Qty. to Ship")
            {
            }
            column(QtytoInvoice_ServiceLine; "Qty. to Invoice")
            {
            }
            column(QuantityShipped_ServiceLine; "Quantity Shipped")
            {
            }
            column(QuantityInvoiced_ServiceLine; "Quantity Invoiced")
            {
            }
            column(VATBaseAmount_ServiceLine; "VAT Base Amount")
            {
            }
            column(VATBusPostingGroup_ServiceLine; "VAT Bus. Posting Group")
            {
            }
            column(VATProdPostingGroup_ServiceLine; "VAT Prod. Posting Group")
            {
            }
            column(VariantCode_ServiceLine; "Variant Code")
            {
            }
            column(AmountIncludingVAT_ServiceLine; "Amount Including VAT")
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

