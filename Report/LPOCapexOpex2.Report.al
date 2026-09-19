report 50446 "LPO Capex-Opex2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LPOCapexOpex2.rdl';

    dataset
    {
        dataitem(DataItem1000000000; LPO)
        {
            column(LPONo_LPO; "LPO No.")
            {
            }
            column(VendorName_LPO; "Vendor Name")
            {
            }
            column(Address_LPO; Address)
            {
            }
            column(Amount_LPO; Amount)
            {
            }
            column(Vatamount_LPO; "Vat amount")
            {
            }
            column(Vatable_LPO; Vatable)
            {
            }
            column(Description_LPO; Description)
            {
            }
            column(PurchRequisitionNo_LPO; "Purch.Requisition No")
            {
            }
            column(PaymentTerms_LPO; "Payment Terms")
            {
            }
            column(VendorNo_LPO; "Vendor No.")
            {
            }
            column(PurchRequisitionDate_LPO; "Purch.Requisition Date")
            {
            }
            column(NoSeries_LPO; "No. Series")
            {
            }
            column(CapexOpexNo_LPO; "Capex-Opex No.")
            {
            }
            column(VoucherRaised_LPO; "Voucher Raised")
            {
            }
            column(Quantity_LPO; Quantity)
            {
            }
            column(Paymenttermdetail_LPO; "Payment term detail")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //IF DimValue.GET('DEPARTMENT',"Shortcut Dimension 1 Code") THEN
                //  Department := DimValue.Name;

                //IF CapexOpexReq.GET(CapexOpexReq."Document Type","Purchase Header"."Requsition No.") THEN
                //  Requester := CapexOpexReq."Requester Name";
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
        DimValue: Record 349;
        Department: Text[50];
        CapexOpexReq: Record 70008;
        Requester: Text[60];
}

