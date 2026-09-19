report 50621 "Details of Order Recieved"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/DetailsofOrderRecieved.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Sales Shipment Header")
        {
            DataItemTableView = WHERE("Shortcut Dimension 1 Code" = FILTER('05PARTS'));
            column(SelltoCustomerName_SalesShipmentHeader; "Sell-to Customer Name")
            {
            }
            column(OrderNo_SalesShipmentHeader; "Order No.")
            {
            }
            column(TrackerNo_SalesShipmentHeader; "Tracker No.")
            {
            }
            column(OrderType_SalesShipmentHeader; "Order Type")
            {
            }
            dataitem(DataItem1000000001; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(No_SalesShipmentLine; "No.")
                {
                }
                column(LocationCode_SalesShipmentLine; "Location Code")
                {
                }
                column(Description_SalesShipmentLine; Description)
                {
                }
                column(Quantity_SalesShipmentLine; Quantity)
                {
                }
                column(UnitPrice_SalesShipmentLine; "Unit Price")
                {
                }
                column(QuantityInvoiced_SalesShipmentLine; "Quantity Invoiced")
                {
                }
                column(QuantityDemanded_SalesShipmentLine; "Quantity Demanded")
                {
                }
                column(Startdate; Startdate)
                {
                }
                column(Enddate; Enddate)
                {
                }
                column(PostingDate_SalesShipmentLine; "Posting Date")
                {
                }
                column(OrderNo_SalesShipmentLine; "Order No.")
                {
                }
                column(COMPANYNAME; COMPANYNAME)
                {
                }
                column(TNLinvoiceNo; TNLinvoiceNo)
                {
                }
                column(TNLinvoicedate; TNLinvoicedate)
                {
                }
                column(No_ofDays; No_ofDays)
                {
                }
                column(TNLOrderDate; TNLOrderDate)
                {
                }
                column(TnlOrderNo; TnlOrderNo)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                SETCURRENTKEY("Posting Date");
                SETRANGE("Posting Date", Startdate, Enddate);
                SETRANGE("Posting Date", Startdate, Enddate);
                TnlNo := 0;
                No_ofDays := 0;
                OrderNo := 0;

                SalesInvoiceHeader.SETCURRENTKEY("Order No.");
                SalesInvoiceHeader.SETRANGE("Posting Date", Startdate, Enddate);
                SalesInvoiceHeader.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");

                SalesInvoiceHeader.SETRANGE("Order No.", "Order No.");
                IF SalesInvoiceHeader.FINDFIRST THEN BEGIN
                    TNLinvoiceNo := SalesInvoiceHeader."No.";
                    TNLinvoicedate := SalesInvoiceHeader."Posting Date";
                    TNLOrderDate := SalesInvoiceHeader."Document Date";
                    TnlOrderNo := SalesInvoiceHeader."Order No.";
                    TnlNo := (DATE2DMY(TNLinvoicedate, 1));
                END;

                SalesHeader.SETRANGE("Posting Date", Startdate, Enddate);
                SalesHeader.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
                SalesHeader.SETRANGE("No.", "Order No.");
                IF SalesHeader.FINDFIRST THEN BEGIN
                    Orderdate := SalesHeader."Order Date";
                    OrderNo := (DATE2DMY(Orderdate, 1))
                END;
                No_ofDays := TnlNo - OrderNo;


                // SalesShipmentLine.SETCURRENTKEY("Document No.","Line No.");
                // SalesShipmentLine.SETRANGE("Document No.","No.");
                // SalesShipmentLine.SETRANGE("Posting Date",Startdate,Enddate);
                // SalesShipmentLine.SETRANGE("Line No.");
                // IF SalesShipmentLine.FIND('-') THEN BEGIN
                //  REPEAT
                //    Custname := "Sell-to Customer Name";
                //    Locationcode := SalesShipmentLine."Location Code";
                //    Partno := SalesShipmentLine."No.";
                //    Description := SalesShipmentLine.Description;
                //    Quantitydemand := SalesShipmentLine."Quantity Demanded";
                //    Quantitysupplied := SalesShipmentLine."Quantity Invoiced";
                //    ValueDemanded := SalesShipmentLine."Unit Price"*Quantitydemand;
                //    ValueSupplied := SalesShipmentLine."Unit Price"*Quantitysupplied;
                //  UNTIL SalesShipmentLine.NEXT =0;
                // END;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(Startdate; Startdate)
                {
                    Caption = 'Start Date';
                    ApplicationArea = All;
                }
                field(Enddate; Enddate)
                {
                    Caption = 'End Date';
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SalesShipmentLine: Record 111;
        SalesLine: Record 37;
        CustLedgerEntry: Record 21;
        Startdate: Date;
        Enddate: Date;
        Custname: Text;
        Locationcode: Code[10];
        Partno: Code[10];
        Description: Text;
        Quantitydemand: Decimal;
        Quantitysupplied: Decimal;
        ValueDemanded: Decimal;
        ValueSupplied: Decimal;
        SalesInvoiceHeader: Record 112;
        TNLinvoiceNo: Code[10];
        TNLinvoicedate: Date;
        SalesHeader: Record 36;
        No_ofDays: Integer;
        Orderdate: Date;
        TnlNo: Integer;
        OrderNo: Integer;
        TNLOrderDate: Date;
        TnlOrderNo: Code[10];
}

