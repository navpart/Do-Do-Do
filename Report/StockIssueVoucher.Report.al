report 50631 "Stock Issue Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockIssueVoucher.rdl';

    dataset
    {
        dataitem(DataItem1000000005; "Customer Order LineX")
        {
            DataItemTableView = WHERE(Type = CONST(Item));
            RequestFilterFields = "Document No.";
            column(No_CustomerOrderLineX; "No.")
            {
            }
            column(Description_CustomerOrderLineX; Description)
            {
            }
            column(QuantityRequested_CustomerOrderLineX; "Quantity Requested")
            {
            }
            column(QuantityReceived_CustomerOrderLineX; "Quantity Received")
            {
            }
            column(DocumentNo_CustomerOrderLineX; "Document No.")
            {
            }
            column(VehicleRegistrationNo_CustomerOrderLineX; "Vehicle Registration No.")
            {
            }
            column(ServiceAdvisorsName_CustomerOrderLineX; "Service Advisor's Name")
            {
            }
            column(VariantCode_CustomerOrderLineX; "Variant Code")
            {
            }
            column(ModelName_CustomerOrderLineX; "Model Name")
            {
            }
            column(ETA_CustomerOrderLineX; ETA)
            {
            }
            column(EDA_CustomerOrderLineX; EDA)
            {
            }
            column(ShipmentStatus_CustomerOrderLineX; "Shipment Status")
            {
            }
            column(Reason_CustomerOrderLineX; Reason)
            {
            }

            trigger OnAfterGetRecord()

            Begin
                if CustomerOrderHeaderX.Get("Document No.") then begin
                    VehicleRegistrationNo := CustomerOrderHeaderX."Vehicle Registration No.";
                    ServiceAdvisor := CustomerOrderHeaderX."Service Advisor";
                    ServiceAdvisorsName := CustomerOrderHeaderX."Service Advisor's Name";
                end

            End;
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
        VehicleRegistrationNo: Code[20];
        ServiceAdvisor: Code[20];
        ServiceAdvisorsName: Text;
        CustomerOrderHeaderX: Record "Customer Order HeaderX";

}

