report 50611 "LPP Lpo"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LPPLpo.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Local Part Purchase Register")
        {
            column(LPPNo_LocalPartPurchaseRegister; "LPP No.")
            {
            }
            column(RequesterCode_LocalPartPurchaseRegister; "Requester Code")
            {
            }
            column(RequesterName_LocalPartPurchaseRegister; "Requester Name")
            {
            }
            column(DepartmentCode_LocalPartPurchaseRegister; "Department Code")
            {
            }
            column(RequesterDepartment_LocalPartPurchaseRegister; "Requester Department")
            {
            }
            column(Date_LocalPartPurchaseRegister; Date)
            {
            }
            column(SuppliersAddress_LocalPartPurchaseRegister; "Supplier's Address")
            {
            }
            column(SuppliersName_LocalPartPurchaseRegister; "Supplier's Name")
            {
            }
            column(ProfomaInvoiceNo_LocalPartPurchaseRegister; "Profoma Invoice No:")
            {
            }
            column(Justificationforpurchase_LocalPartPurchaseRegister; "Justification for purchase")
            {
            }
            column(TotalPurchaseValue_LocalPartPurchaseRegister; "Total Purchase Value")
            {
            }
            column(OrderType_LocalPartPurchaseRegister; "Order Type")
            {
            }
            dataitem(DataItem1000000001; "LPP Line")
            {
                DataItemLink = "Document No." = FIELD("LPP No.");
                column(DocumentNo_LPPLine; "Document No.")
                {
                }
                column(OrderType_LPPLine; "Order Type")
                {
                }
                column(ItemNo_LPPLine; "Item No")
                {
                }
                column(ItemName_LPPLine; "Item Name")
                {
                }
                column(Quantity_LPPLine; Quantity)
                {
                }
                column(UnitCost_LPPLine; "Unit Cost")
                {
                }
                column(Amount_LPPLine; Amount)
                {
                }
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

