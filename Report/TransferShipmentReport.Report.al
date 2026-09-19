report 50019 "Transfer Shipment Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TransferShipmentReport.rdl';

    dataset
    {
        dataitem(TransShipmtHeader; "Transfer Shipment Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Transfer-from Code", "Transfer-to Code";
            RequestFilterHeading = 'posted Transfer Shipment';
            column(TransfertoCode_TransferShipmentHeader; "Transfer-to Code")
            {
            }
            column(TransfertoName_TransferShipmentHeader; "Transfer-to Name")
            {
            }
            column(TransfertoName2_TransferShipmentHeader; "Transfer-to Name 2")
            {
            }
            column(TransfertoAddress_TransferShipmentHeader; "Transfer-to Address")
            {
            }
            column(TransfertoAddress2_TransferShipmentHeader; "Transfer-to Address 2")
            {
            }
            column(TransfertoPostCode_TransferShipmentHeader; "Transfer-to Post Code")
            {
            }
            column(TransfertoCity_TransferShipmentHeader; "Transfer-to City")
            {
            }
            column(TransfertoCounty_TransferShipmentHeader; "Transfer-to County")
            {
            }
            column(TrsftoCountryRegionCode_TransferShipmentHeader; "Trsf.-to Country/Region Code")
            {
            }
            column(TransferOrderDate_TransferShipmentHeader; "Transfer Order Date")
            {
            }
            column(TransferfromCode_TransferShipmentHeader; "Transfer-from Code")
            {
            }
            column(TransferfromName_TransferShipmentHeader; "Transfer-from Name")
            {
            }
            column(TransferfromName2_TransferShipmentHeader; "Transfer-from Name 2")
            {
            }
            column(TransferfromAddress_TransferShipmentHeader; "Transfer-from Address")
            {
            }
            column(TransferfromAddress2_TransferShipmentHeader; "Transfer-from Address 2")
            {
            }
            column(TransferfromPostCode_TransferShipmentHeader; "Transfer-from Post Code")
            {
            }
            column(TransferfromCity_TransferShipmentHeader; "Transfer-from City")
            {
            }
            column(Reason_TransferShipmentHeader; Reason)
            {
            }
            column(ExternalDocumentNo_TransferShipmentHeader; "External Document No.")
            {
            }
            column(PostingDate_TransferShipmentHeader; "Posting Date")
            {
            }
            column(VehicleNo_TransferShipmentHeader; "Vehicle No.")
            {
            }
            column(TransferfromCounty_TransferShipmentHeader; "Transfer-from County")
            {
            }
            column(No_TransferShipmentHeader; "No.")
            {
            }
            column(DealerNo_TransferShipmentHeader; "Dealer No.")
            {
            }
            dataitem(DataItem1000000019; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(VariantCode_TransferShipmentLine; "Variant Code")
                {
                }
                column(Description_TransferShipmentLine; Description)
                {
                }
                column(ItemNo_TransferShipmentLine; "Item No.")
                {
                }
                column(Quantity_TransferShipmentLine; Quantity)
                {
                }
                column(InventoryPostingGroup_TransferShipmentLine; "Inventory Posting Group")
                {
                }
                dataitem(DataItem1000000031; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    DataItemTableView = WHERE("Location Code" = FILTER('TRANSIT'));
                    column(SerialNo_ItemLedgerEntry; "Serial No.")
                    {
                    }
                    column(EngineNo_ItemLedgerEntry; "Engine No.")
                    {
                    }
                    column(ExteriorColourName_ItemLedgerEntry; "Exterior Colour Name")
                    {
                    }
                }

                trigger OnPreDataItem()
                begin

                    MoreLines := FIND('+');
                    WHILE MoreLines AND (Description = '') AND ("Item No." = '') AND (Quantity = 0) DO
                        MoreLines := NEXT(-1) <> 0;
                    IF NOT MoreLines THEN
                        CurrReport.BREAK;
                    SETRANGE("Line No.", 0, "Line No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin


                FormatAddr.TransferShptTransferFrom(TransferFromAddr, TransShipmtHeader);
                FormatAddr.TransferShptTransferTo(TransferToAddr, TransShipmtHeader);

                IF NOT ShipmentMethod.GET("Shipment Method Code") THEN
                    ShipmentMethod.INIT;
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
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        FormatAddr: Codeunit 365;
        TransferFromAddr: array[8] of Text[50];
        TransferToAddr: array[8] of Text[50];
        Text000: Label 'COPY';
        Text001: Label 'Transfer Order %1';
        Text002: Label 'Page %1';
        HdrDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        OutputNo: Integer;
        Headertext: Text[30];
        TotalQty: Decimal;
        ShipmentMethod: Record 10;
        IntemLedger: Record 32;
}

