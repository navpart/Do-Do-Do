report 50606 "Parts Sales Way bill!"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartsSalesWaybill.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Sales Shipment Header")
        {
            column(SelltoCustomerNo_SalesShipmentHeader; "Sell-to Customer No.")
            {
            }
            column(No_SalesShipmentHeader; "No.")
            {
            }
            column(BilltoCustomerNo_SalesShipmentHeader; "Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesShipmentHeader; "Bill-to Name")
            {
            }
            column(BilltoName2_SalesShipmentHeader; "Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesShipmentHeader; "Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesShipmentHeader; "Bill-to Address 2")
            {
            }
            column(BilltoCity_SalesShipmentHeader; "Bill-to City")
            {
            }
            column(BilltoContact_SalesShipmentHeader; "Bill-to Contact")
            {
            }
            column(YourReference_SalesShipmentHeader; "Your Reference")
            {
            }
            column(ShiptoCode_SalesShipmentHeader; "Ship-to Code")
            {
            }
            column(ShiptoName_SalesShipmentHeader; "Ship-to Name")
            {
            }
            column(ShiptoName2_SalesShipmentHeader; "Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesShipmentHeader; "Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesShipmentHeader; "Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesShipmentHeader; "Ship-to City")
            {
            }
            column(ShiptoContact_SalesShipmentHeader; "Ship-to Contact")
            {
            }
            column(OrderDate_SalesShipmentHeader; "Order Date")
            {
            }
            column(PostingDate_SalesShipmentHeader; "Posting Date")
            {
            }
            column(ShipmentDate_SalesShipmentHeader; "Shipment Date")
            {
            }
            column(PostingDescription_SalesShipmentHeader; "Posting Description")
            {
            }
            column(PaymentTermsCode_SalesShipmentHeader; "Payment Terms Code")
            {
            }
            column(DueDate_SalesShipmentHeader; "Due Date")
            {
            }
            column(PaymentDiscount_SalesShipmentHeader; "Payment Discount %")
            {
            }
            column(SalesPerson_Name; SalesPerson.Name)
            {
            }
            column(SalespersonCode_SalesShipmentHeader; "Salesperson Code")
            {
            }
            column(PmtDiscountDate_SalesShipmentHeader; "Pmt. Discount Date")
            {
            }
            column(ShipmentMethodCode_SalesShipmentHeader; "Shipment Method Code")
            {
            }
            column(OrderNo_SalesShipmentHeader; "Order No.")
            {
            }
            column(LocationCode_SalesShipmentHeader; "Location Code")
            {
            }
            column(ShortcutDimension2Code_SalesShipmentHeader; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension1Code_SalesShipmentHeader; "Shortcut Dimension 1 Code")
            {
            }
            column(PostingTime_SalesShipmentHeader; Posting_Time)
            {
            }
            dataitem(DataItem1000000029; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                column(SelltoCustomerNo_SalesShipmentLine; "Sell-to Customer No.")
                {
                }
                column(DocumentNo_SalesShipmentLine; "Document No.")
                {
                }
                column(LineNo_SalesShipmentLine; "Line No.")
                {
                }
                column(Quantity_SalesShipmentLine; Quantity)
                {
                }
                column(Type_SalesShipmentLine; Type)
                {
                }
                column(QtyShippedNotInvoiced_SalesShipmentLine; "Qty. Shipped Not Invoiced")
                {
                }
                column(No_SalesShipmentLine; "No.")
                {
                }
                column(PostingGroup_SalesShipmentLine; "Posting Group")
                {
                }
                column(LocationCode_SalesShipmentLine; "Location Code")
                {
                }
                column(ShipmentDate_SalesShipmentLine; "Shipment Date")
                {
                }
                column(Description_SalesShipmentLine; Description)
                {
                }
                column(Description2_SalesShipmentLine; "Description 2")
                {
                }
                column(UnitofMeasure_SalesShipmentLine; "Unit of Measure")
                {
                }
                dataitem(DataItem1000000046; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Source No." = FIELD("Sell-to Customer No."),
                                   "Item No." = FIELD("No."),
                                   "Document Line No." = FIELD("Line No.");
                    column(SerialNo_ItemLedgerEntry; "Serial No.")
                    {
                    }
                    column(EngineNo_ItemLedgerEntry; "Engine No.")
                    {
                    }
                    column(KeyNo_ItemLedgerEntry; "Key No.")
                    {
                    }
                    column(ExteriorColourName_ItemLedgerEntry; "Exterior Colour Name")
                    {
                    }
                    column(InventoryPostingGroup_ItemLedgerEntry; "Inventory Posting Group")
                    {
                    }
                    column(Quantity_ItemLedgerEntry; Quantity)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin

                //CurrReport.PAGENO := 1;
                PrintBottom := FALSE;
                IF "Salesperson Code" = '' THEN BEGIN
                    CLEAR(SalesPerson);
                    CLEAR(SalesPersonTxt);
                END
                ELSE BEGIN
                    IF SalesPerson.GET("Salesperson Code") THEN;
                    SalesPersonTxt := 'Salesperson :';
                END;

                IF "Your Reference" = '' THEN
                    CLEAR(ReferenceTxt)
                ELSE
                    ReferenceTxt := 'Reference';

                IF "Shipment Date" = 0D THEN
                    CLEAR(ShipmentTxt)
                ELSE
                    ShipmentTxt := 'Shipment Date';


                CustomerAddr[1] := "Bill-to Name";
                CustomerAddr[2] := "Bill-to Name 2";
                CustomerAddr[3] := COPYSTR("Bill-to Address", 1, 30);
                CustomerAddr[4] := COPYSTR("Bill-to Address 2", 1, 30);

                COMPRESSARRAY(CustomerAddr);
                PrintBottom := FALSE;

                IF DepRec.GET("Shortcut Dimension 1 Code") THEN;
            end;

            trigger OnPreDataItem()
            begin
                PrintPiclist.RUN;
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
        binlocvar: Code[20];
        itemRec: Record 27;
        "VehicleNo.": Code[20];
        NoPr: Boolean;
        i: Integer;
        AmT: array[15] of Text[4];
        AmT1: array[15] of Text[4];
        AmT2: array[15] of Text[4];
        AmT3: array[15] of Text[4];
        DepRec: Record 11;
        TotalNet: Decimal;
        VATLiable: Decimal;
        TotalGross: Decimal;
        Delivery: Record 10;
        Payment: Record 3;
        N_PARTS: Text[20];
        CustomerAddr: array[8] of Text[50];
        SalesPerson: Record 13;
        OrderNoTxt: Text[20];
        SalesPersonTxt: Text[20];
        ReferenceTxt: Text[15];
        CompanyData: Record 79;
        PrintBottom: Boolean;
        MoreLines: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        CopyTxt: Text[20];
        Customer: Record 18;
        PrintPiclist: Codeunit 229;
        ShipmentTxt: Text[20];
        Library: Codeunit 50003;
        ValidDate: Date;
}

