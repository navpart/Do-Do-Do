namespace AL_TNL.AL_TNL;

using Microsoft.Inventory.Item;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Purchases.History;
using Microsoft.Inventory.Setup;
using Microsoft.Sales.Setup;

report 51020 "Item Price Update"
{
    ApplicationArea = All;
    Caption = 'Item Price Update';
    UsageCategory = Lists;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = where("Inventory Posting Group" = filter('<>N_CARS'));
            RequestFilterFields = "No.", "Item Price Group";
            column(No; "No.")
            {
            }

            trigger OnPreDataItem()
            begin
                // Load setup records once for performance
                SalesSetup.GET;
                //InvtSetup.GET;
                GLSetup.Get();

                // Validate setup before processing
                if (SalesSetup."Spare Parts Fixed Cost Markup%" = 0) or (SalesSetup."Spare Parts Fixed Cost Markup%" < 1) then
                    ERROR('Markup Percentage for Spare Part is incorrect or not setup. Contact your System Administrator');

                if (SalesSetup."SP Fixed Exch. Rate USD" = 0) or (SalesSetup."SP Fixed Exch. Rate USD" < 1) then
                    ERROR('The fixed Exchange Rate for Spare Part pricing is incorrect or not setup. Contact your System Administrator');

                if (SalesSetup."SP Fixed Exch. Rate JPY" = 0) or (SalesSetup."SP Fixed Exch. Rate JPY" < 1) then
                    ERROR('The fixed Exchange Rate for Spare Part pricing is incorrect or not setup. Contact your System Administrator');

                if (SalesSetup."SP Fixed Exch. Rate CNY" = 0) or (SalesSetup."SP Fixed Exch. Rate CNY" < 1) then
                    ERROR('The fixed Exchange Rate for Spare Part pricing is incorrect or not setup. Contact your System Administrator');

                if (SalesSetup."SP Fixed Exch. Rate ZAR" = 0) or (SalesSetup."SP Fixed Exch. Rate ZAR" < 1) then
                    ERROR('The fixed Exchange Rate for Spare Part pricing is incorrect or not setup. Contact your System Administrator');
            end;

            trigger OnAfterGetRecord()
            begin
                // Process item pricing - directly query last purchase invoice line
                PurchInvLine.RESET();
                PurchInvLine.SETCURRENTKEY("Document No.", "Line No.");
                PurchInvLine.SETRANGE("No.", "No.");
                PurchInvLine.SETFILTER("Direct Unit Cost", '>0');
                if PurchInvLine.FINDLAST then begin
                    if PurchInvHeader.GET(PurchInvLine."Document No.") then begin
                        // Calculate based on currency
                        if (PurchInvHeader."Currency Code" = 'USD') or
                           (PurchInvHeader."Currency Code" = 'JPY') or
                           (PurchInvHeader."Currency Code" = 'CNY') or
                           (PurchInvHeader."Currency Code" = 'ZAR') then begin
                            case PurchInvHeader."Currency Code" of
                                'USD':
                                    FixedExchRate := SalesSetup."SP Fixed Exch. Rate USD";
                                'JPY':
                                    FixedExchRate := SalesSetup."SP Fixed Exch. Rate JPY";
                                'CNY':
                                    FixedExchRate := SalesSetup."SP Fixed Exch. Rate CNY";
                                'ZAR':
                                    FixedExchRate := SalesSetup."SP Fixed Exch. Rate ZAR";
                            end;
                            "Fixed Cost" := (1 + SalesSetup."Spare Parts Fixed Cost Markup%" / 100) * FixedExchRate * PurchInvLine."Direct Unit Cost";
                            "FOB (FIXED)" := FixedExchRate * PurchInvLine."Direct Unit Cost";
                        end else begin
                            "Fixed Cost" := (1 + SalesSetup."Spare Parts Fixed Cost Markup%" / 100) * PurchInvLine."Direct Unit Cost";
                            "FOB (FIXED)" := PurchInvLine."Direct Unit Cost";
                        end;
                    end;
                end;

                // Update prices from fixed price tables if no purchase invoice found
                if not PurchInvLine.FINDFIRST then begin
                    if FixedPrice.GET("No.") then begin
                        "Fixed Cost" := (1.35) * SalesSetup."SP Fixed Exch. Rate USD" * FixedPrice."Unit Cost";
                        "FOB (FIXED)" := SalesSetup."SP Fixed Exch. Rate USD" * FixedPrice."Unit Cost";
                    end;
                end;

                // Update TNL Profit % and Unit Price
                if ("Inventory Posting Group" = 'N_PARTS') or ("Inventory Posting Group" = 'ACCESSORY') or ("Inventory Posting Group" = 'ACCESORIES') then begin
                    if "Item Price Group" <> '' then
                        if PriceGrp.GET("Item Price Group") then
                            "TNL Profit %" := PriceGrp."Profit % On Cost B4 Discount";

                    if "TNL Profit %" < 100 then
                        "Unit Price" :=
                            ROUND("Fixed Cost" * (1 + ("TNL Profit %" / 100)) * (1 + CalcVAT),
                                GLSetup."Unit-Amount Rounding Precision");
                end;

                VALIDATE("Last Direct Cost");

                // Calculate profit and price based on calculation method
                case "Price/Profit Calculation" of
                    "Price/Profit Calculation"::"Profit=Price-Cost":
                        if "Unit Price" <> 0 then
                            if "Unit Cost" = 0 then
                                "Profit %" := 0
                            else
                                "Profit %" :=
                                    ROUND(
                                        100 * (1 - "Unit Cost" /
                                        ("Unit Price" / (1 + CalcVAT))), 0.00001)
                        else
                            "Profit %" := 0;
                    "Price/Profit Calculation"::"Price=Cost+Profit":
                        if "Profit %" < 100 then begin
                            if ("Inventory Posting Group" = 'N_PARTS') or ("Inventory Posting Group" = 'ACCESORIES') then begin
                                "Unit Price" :=
                                    ROUND("Fixed Cost" * (1 + ("TNL Profit %" / 100)) * (1 + CalcVAT),
                                        GLSetup."Unit-Amount Rounding Precision");
                            end else begin
                                "Unit Price" :=
                                    ROUND(
                                        ("Unit Cost" / (1 - "Profit %" / 100)) *
                                        (1 + CalcVAT),
                                        GLSetup."Unit-Amount Rounding Precision");
                            end;
                        end;
                end;

                Validate("Price/Profit Calculation");

                // Single modify at the end for performance
                Modify();

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        //InvtSetup: Record "Inventory Setup";
        PurchInvHeader: Record "Purch. Inv. Header";
        FixedExchRate: Decimal;
        PurchInvLine: Record "Purch. Inv. Line";
        FixedPrice: Record "Fixed Price2";
        //FixedPrice2: Record "Fixed Price3";
        GLSetup: Record "General Ledger Setup";
        PriceGrp: Record "Item Price Group";
}
