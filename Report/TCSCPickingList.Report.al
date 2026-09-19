report 50041 "TCSC Picking List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TCSCPickingList.rdl';
    Caption = 'Transfer Order';

    dataset
    {
        dataitem(TransHeaderData; "Transfer Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Transfer-from Code", "Transfer-to Code";
            RequestFilterHeading = 'Transfer Order';
            column(No_TransferHdr; "No.")
            {
            }
            column(COF_Number; "COF No.")
            {
            }
            column(Reception_Date; "Reception Date")
            {
            }
            column(VehicleNo_TransferHeader; "Vehicle No.")
            {
            }
            column(ModelName_TransferHeader; "Model Name")
            {
            }
            column(ServiceAdvisorName_TransferHeader; "Service Advisor Name")
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CopyCaption; STRSUBSTNO(Text001, CopyText))
                    {
                    }
                    column(TransferToAddr1; TransferToAddr[1])
                    {
                    }
                    column(TransferFromAddr1; TransferFromAddr[1])
                    {
                    }
                    column(TransferToAddr2; TransferToAddr[2])
                    {
                    }
                    column(TransferFromAddr2; TransferFromAddr[2])
                    {
                    }
                    column(TransferToAddr3; TransferToAddr[3])
                    {
                    }
                    column(TransferFromAddr3; TransferFromAddr[3])
                    {
                    }
                    column(TransferToAddr4; TransferToAddr[4])
                    {
                    }
                    column(TransferFromAddr4; TransferFromAddr[4])
                    {
                    }
                    column(TransferToAddr5; TransferToAddr[5])
                    {
                    }
                    column(TransferToAddr6; TransferToAddr[6])
                    {
                    }
                    column(InTransitCode_TransHdr; TransHeaderData."In-Transit Code")
                    {
                        IncludeCaption = true;
                    }
                    column(PostingDate_TransHdr; FORMAT(TransHeaderData."Posting Date", 0, 4))
                    {
                    }
                    column(COF_No; TransHeaderData."COF No.")
                    {
                    }
                    column(TransferToAddr7; TransferToAddr[7])
                    {
                    }
                    column(TransferToAddr8; TransferToAddr[8])
                    {
                    }
                    column(TransferFromAddr5; TransferFromAddr[5])
                    {
                    }
                    column(TransferFromAddr6; TransferFromAddr[6])
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text002, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ShptMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    dataitem(DataItem9370; "Transfer Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = TransHeaderData;
                        DataItemTableView = SORTING("Document No.", "Line No.")
                                            WHERE("Derived From Line No." = CONST(0));
                        column(ItemNo_TransLine; "Item No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Desc_TransLine; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(Qty_TransLine; Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(UOM_TransLine; "Unit of Measure")
                        {
                            IncludeCaption = true;
                        }
                        column(VariantCode_TransferLine; "Variant Code")
                        {
                        }
                        column(Qty_TransLineShipped; "Quantity Shipped")
                        {
                            IncludeCaption = true;
                        }
                        column(QtyReceived_TransLine; "Quantity Received")
                        {
                            IncludeCaption = true;
                        }
                        column(TransFromBinCode_TransLine; "Transfer-from Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(TransToBinCode_TransLine; "Transfer-To Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(LineNo_TransLine; "Line No.")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            DimSetEntry2.SETRANGE("Dimension Set ID", "Dimension Set ID");
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text000;
                        OutputNo += 1;
                    END;
                    //CurrReport.PAGENO := 1;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");
                FormatAddr.TransferHeaderTransferFrom(TransferFromAddr, TransHeaderData);
                FormatAddr.TransferHeaderTransferTo(TransferToAddr, TransHeaderData);

                IF NOT ShipmentMethod.GET("Shipment Method Code") THEN
                    ShipmentMethod.INIT;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = All;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        PostingDateCaption = 'Posting Date';
        ShptMethodDescCaption = 'Shipment Method';
    }

    var
        Text000: Label 'COPY';
        Text001: Label 'Transfer Order %1';
        Text002: Label 'Page %1';
        ShipmentMethod: Record 10;
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        FormatAddr: Codeunit 365;
        TransferFromAddr: array[8] of Text[50];
        TransferToAddr: array[8] of Text[50];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        OutputNo: Integer;
        HdrDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
}

