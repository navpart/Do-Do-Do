report 50194 "Sales Timestamp Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/SalesTimestampReport.rdl';
    Caption = 'Sales Timestamp Report';
    ApplicationArea = All;
    UsageCategory = Lists;

    dataset
    {
        dataitem(DataItem1; "Sales Invoice Header")
        {
            DataItemTableView = WHERE("Online Order" = CONST(true),
                                      "Order No." = FILTER('TSOV*'));
            RequestFilterFields = "Order Date", "Sell-to Customer No.";

            column(SelltoCustomerNo_SalesHeader; "Sell-to Customer No.")
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(BilltoName_SalesHeader; "Bill-to Name")
            {
            }
            column(OrderDate_SalesHeader; "Order Date")
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }
            column(FinanceApprvStatus_SalesHeader; "Finance Apprv Status")
            {
            }
            column(FinanceSendto_SalesHeader; "Finance Send to")
            {
            }
            column(MarketingSendTo_SalesHeader; "Marketing Send To")
            {
            }
            column(MarketingApprvStatus_SalesHeader; "Marketing Apprv Status")
            {
            }
            column(LogisticsSendto_SalesHeader; "Logistics Send to")
            {
            }
            column(LogisticsApprvStatus_SalesHeader; "Logistics Apprv Status")
            {
            }
            column(LogisticsSentTime_SalesHeader; "Logistics Sent Time")
            {
            }
            column(LogisticsApprovedTime_SalesHeader; "Logistics Approved Time")
            {
            }
            column(LogisticSentTime_SalesHeader; "Logistic Sent Time")
            {
            }
            column(FinanceApprovedTime_SalesHeader; "Finance Approved Time")
            {
            }
            column(MarketingApprovedTime_SalesHeader; "Marketing Approved Time")
            {
            }
            column(OrderNo_SalesInvoiceHeader; "Order No.")
            {
            }
            column(SalesTime_SalesInvoiceHeader; "Sales Time")
            {
            }
            column(Calc2; Calc2Text)
            {
            }
            column(Calc3; Calc3Text)
            {
            }
            column(Calc4; Calc4Text)
            {
            }
            dataitem(DataItem18; "Vehicle Online Order")
            {
                DataItemLink = "TNL Sales Order No." = FIELD("Order No.");
                column(OrderNo_VehicleOnlineOrder; "Order No.")
                {
                }
                column(DealerOrderDate_VehicleOnlineOrder; "Dealer Order Date")
                {
                }
                column(FADConfirmationDateTime_VehicleOnlineOrder; "FAD Confirmation DateTime")
                {
                }
                column(Calc1; Calc1Text)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF ("FAD Confirmation DateTime" <> 0DT) AND ("Dealer Order Date" <> 0DT) THEN BEGIN
                        Calc1 := ("FAD Confirmation DateTime" - "Dealer Order Date");
                        Calc1Text := FormatDuration(Calc1);
                    END ELSE
                        Calc1Text := '';
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF ("Logistics Approved Time" <> 0DT) AND ("Sent Time" <> 0DT) THEN BEGIN
                    Calc2 := "Logistics Approved Time" - "Sent Time";
                    Calc2Text := FormatDuration(Calc2);
                END ELSE
                    Calc2Text := '';

                IF ("Finance Approved Time" <> 0DT) AND ("Logistics Approved Time" <> 0DT) THEN BEGIN
                    Calc3 := "Finance Approved Time" - "Logistics Approved Time";
                    Calc3Text := FormatDuration(Calc3);
                END ELSE
                    Calc3Text := '';

                IF ("Marketing Approved Time" <> 0DT) AND ("Finance Approved Time" <> 0DT) THEN BEGIN
                    Calc4 := "Marketing Approved Time" - "Finance Approved Time";
                    Calc4Text := FormatDuration(Calc4);
                END ELSE
                    Calc4Text := '';
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

    trigger OnInitReport()
    begin

    end;

    var
        Calc1: Duration;
        Calc2: Duration;
        Calc3: Duration;
        Calc4: Duration;
        Calc1Text: Text[50];
        Calc2Text: Text[50];
        Calc3Text: Text[50];
        Calc4Text: Text[50];
        VehicleOnlineOrder: Record 70049;
        SalesInvoiceHeader: Record 112;

    local procedure FormatDuration(DurationValue: Duration): Text[50]
    var
        Hours: Integer;
        Minutes: Integer;
        HourText: Text[20];
        MinuteText: Text[20];
    begin
        IF DurationValue = 0 THEN
            EXIT('');

        Hours := DurationValue DIV 3600000;
        Minutes := (DurationValue MOD 3600000) DIV 60000;

        IF Hours = 1 THEN
            HourText := '1 hour'
        ELSE
            HourText := FORMAT(Hours) + ' hours';

        IF Minutes = 1 THEN
            MinuteText := '1 minute'
        ELSE
            MinuteText := FORMAT(Minutes) + ' minutes';

        EXIT(HourText + ', ' + MinuteText);
    end;


}

