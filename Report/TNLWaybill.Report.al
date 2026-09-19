report 50210 "TNL Waybill"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLWaybill.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Sales Cr.Memo Header")
        {
            column(No_SalesCrMemoHeader; "No.")
            {
            }
            column(SelltoCustomerName_SalesCrMemoHeader; "Sell-to Customer Name")
            {
            }
            column(SelltoCustomerName2_SalesCrMemoHeader; "Sell-to Customer Name 2")
            {
            }
            column(SelltoAddress_SalesCrMemoHeader; "Sell-to Address")
            {
            }
            column(SelltoAddress2_SalesCrMemoHeader; "Sell-to Address 2")
            {
            }
            column(SelltoCity_SalesCrMemoHeader; "Sell-to City")
            {
            }
            column(SelltoCustomerNo_SalesCrMemoHeader; "Sell-to Customer No.")
            {
            }
            column(AppliestoDocNo_SalesCrMemoHeader; "Applies-to Doc. No.")
            {
            }
            column(YourReference_SalesCrMemoHeader; "Your Reference")
            {
            }
            column(PostingDate_SalesCrMemoHeader; "Posting Date")
            {
            }
            column(AmountIncludingVAT_SalesCrMemoHeader; "Amount Including VAT")
            {
            }
            column(Amount_SalesCrMemoHeader; Amount)
            {
            }
            dataitem(DataItem1000000011; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(LineAmount_SalesCrMemoLine; "Line Amount")
                {
                }
                column(Quantity_SalesCrMemoLine; Quantity)
                {
                }
                column(UnitPrice_SalesCrMemoLine; "Unit Price")
                {
                }
                column(No_SalesCrMemoLine; "No.")
                {
                }
                column(Description_SalesCrMemoLine; Description)
                {
                }
                column(LineDiscount_SalesCrMemoLine; "Line Discount %")
                {
                }
            }
            dataitem(DataItem1000000020; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE("Document Type" = CONST("Sales Return Receipt"),
                                          "Entry Type" = CONST(Sale),
                                          Positive = CONST(true));
                column(SerialNo_ItemLedgerEntry; "Serial No.")
                {
                }
                column(ExteriorColourName_ItemLedgerEntry; "Exterior Colour Name")
                {
                }
                column(EngineNo_ItemLedgerEntry; "Engine No.")
                {
                }
                column(KeyNo_ItemLedgerEntry; "Key No.")
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

    var
        CustAddr: array[8] of Text[50];
        GPC: Codeunit 50004;
        SalesPerson: Record 13;
}

