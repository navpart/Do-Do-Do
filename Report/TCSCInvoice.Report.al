report 50281 "TCSC Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TCSCInvoice.rdl';
    Permissions = TableData 7190 = rimd;

    dataset
    {
        dataitem(ServiceInvHeader; "Service Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Service Invoice';
            column(No_ServiceInvHeader; "No.")
            {
            }
            column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            {
            }
            column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo3.Picture)
                    {
                    }
                    column(ReportTitleCopyText; STRSUBSTNO(Text004, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BillToCustNo_ServInvHeader; ServiceInvHeader."Bill-to Customer No.")
                    {
                    }
                    column(BillToCustNo_ServInvHeaderCaption; ServiceInvHeader.FIELDCAPTION("Bill-to Customer No."))
                    {
                    }
                    column(PostingDate_ServInvHeader; FORMAT(ServiceInvHeader."Posting Date"))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_ServInvHeader; ServiceInvHeader."VAT Registration No.")
                    {
                    }
                    column(DueDate_ServInvHeader; FORMAT(ServiceInvHeader."Due Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_ServiceInvHeader; ServiceInvHeader."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YorRef_ServInvHeader; ServiceInvHeader."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(OrderNo_ServInvHeader; ServiceInvHeader."Order No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocDate_ServInvHeader; FORMAT(ServiceInvHeader."Document Date", 0, 4))
                    {
                    }
                    column(PricesInclVAT_ServInvHeader; ServiceInvHeader."Prices Including VAT")
                    {
                    }
                    column(PricesInclVAT_ServInvHeaderCaption; ServiceInvHeader.FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text005, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVAT1_ServInvHeader; FORMAT(ServiceInvHeader."Prices Including VAT"))
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoFaxNoCaption; CompanyInfoFaxNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegistrationNoCaption; CompanyInfoVATRegistrationNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankAccountNoCaption; CompanyInfoBankAccountNoCaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(ServiceInvoiceHeaderDueDateCaption; ServiceInvoiceHeaderDueDateCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(ServiceInvoiceHeaderPostingDateCaption; ServiceInvoiceHeaderPostingDateCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = ServiceInvHeader;
                        DataItemTableView = SORTING(Number);
                        column(DimText; DimText)
                        {
                        }
                        column(Number_IntegerLine; Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            DimText := DimTxtArr[Number];
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                            FindDimTxt(ServiceInvHeader."Dimension Set ID");
                            SETRANGE(Number, 1, DimTxtArrLength);
                        end;
                    }
                    dataitem(SalesInvLine; "Service Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = ServiceInvHeader;
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(TypeInt; TypeInt)
                        {
                        }
                        column(BaseDisc_ServInvHeader; ServiceInvHeader."VAT Base Discount %")
                        {
                        }
                        column(TotalLineAmount; TotalLineAmount)
                        {
                        }
                        column(TotalAmount; TotalAmount)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                        }
                        column(TotalInvDiscAmount; TotalInvDiscAmount)
                        {
                        }
                        column(LineNo_ServInvLine; "Line No.")
                        {
                        }
                        column(LineAmt_ServInvLine; "Line Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Description_ServInvLine; Description)
                        {
                        }
                        column(No_ServInvLine; "No.")
                        {
                        }
                        column(Quantity_ServInvLine; Quantity)
                        {
                        }
                        column(UOM_ServInvLine; "Unit of Measure")
                        {
                        }
                        column(No_ServInvLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Description_ServInvLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(Quantity_ServInvLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_ServInvLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(UnitPrice_ServInvLine; "Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(LineDisc_ServInvLine; "Line Discount %")
                        {
                        }
                        column(VATIdentifier_ServInvLine; "VAT Identifier")
                        {
                        }
                        column(VATIdentifier_ServInvLineCaption; FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(PostedShipmentDate; FORMAT(PostedShipmentDate))
                        {
                        }
                        column(InvDiscountAmount; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_ServInvLine; Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVATAmount; ServiceInvHeader."Amount Including VAT" - ServiceInvHeader.Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_ServInvLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(LineAmtInvDiscAmtAmtInclVAT; -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT"))
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(ServiceInvoiceLineLineDiscountCaption; ServiceInvoiceLineLineDiscountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(LineAmountInvDiscountAmountAmountIncludingVATCaption; LineAmountInvDiscountAmountAmountIncludingVATCaptionLbl)
                        {
                        }
                        dataitem("Service Shipment Buffer"; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(ServShptBufferPostingDate; FORMAT(ServiceShipmentBuffer."Posting Date"))
                            {
                            }
                            column(ServShptBufferQuantity; ServiceShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(ShipmentCaption; ShipmentCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN
                                    ServiceShipmentBuffer.FIND('-')
                                ELSE
                                    ServiceShipmentBuffer.NEXT;
                            end;

                            trigger OnPreDataItem()
                            begin
                                ServiceShipmentBuffer.SETRANGE("Document No.", SalesInvLine."Document No.");
                                ServiceShipmentBuffer.SETRANGE("Line No.", SalesInvLine."Line No.");

                                SETRANGE(Number, 1, ServiceShipmentBuffer.COUNT);
                            end;
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number <= DimTxtArrLength THEN
                                    DimText := DimTxtArr[Number]
                                ELSE
                                    DimText := FORMAT(SalesInvLine.Type) + ' ' + AccNo;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                FindDimTxt(SalesInvLine."Dimension Set ID");
                                IF IsServiceContractLine THEN
                                    SETRANGE(Number, 1, DimTxtArrLength + 1)
                                ELSE
                                    SETRANGE(Number, 1, DimTxtArrLength);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            PostedShipmentDate := 0D;
                            IF Quantity <> 0 THEN
                                PostedShipmentDate := FindPostedShipmentDate;

                            IsServiceContractLine := (Type = Type::"G/L Account") AND ("Service Item No." <> '') AND ("Contract No." <> '');
                            IF IsServiceContractLine THEN BEGIN
                                AccNo := "No.";
                                "No." := "Service Item No.";
                            END;

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                            VATAmountLine.InsertLine;

                            TotalLineAmount += "Line Amount";
                            TotalAmount += Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalInvDiscAmount += "Inv. Discount Amount";
                            TypeInt := Type.AsInteger();
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DELETEALL;
                            ServiceShipmentBuffer.RESET;
                            ServiceShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            //CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount");

                            TotalLineAmount := 0;
                            TotalAmount := 0;
                            TotalAmountInclVAT := 0;
                            TotalInvDiscAmount := 0;
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = SalesInvLine.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmount; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLineVATCaption; VATAmountLineVATCaptionLbl)
                        {
                        }
                        column(VATAmountLineVATBaseControl108Caption; VATAmountLineVATBaseControl108CaptionLbl)
                        {
                        }
                        column(VATAmountLineVATAmountControl109Caption; VATAmountLineVATAmountControl109CaptionLbl)
                        {
                        }
                        column(VATAmountSpecificationCaption; VATAmountSpecificationCaptionLbl)
                        {
                        }
                        column(VATAmountLineVATIdentifierCaption; VATAmountLineVATIdentifierCaptionLbl)
                        {
                        }
                        column(VATAmountLineInvDiscBaseAmountControl141Caption; VATAmountLineInvDiscBaseAmountControl141CaptionLbl)
                        {
                        }
                        column(VATAmountLineLineAmountControl140Caption; VATAmountLineLineAmountControl140CaptionLbl)
                        {
                        }
                        column(VATAmountLineVATBaseControl116Caption; VATAmountLineVATBaseControl116CaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF VATAmountLine.GetTotalVATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            /* CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount"); */
                        end;
                    }
                    dataitem(VATClauseEntryCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATClauseCode; VATAmountLine."VAT Clause Code")
                        {
                        }
                        column(VATClauseDescription; VATClause.Description)
                        {
                        }
                        column(VATClauseDescription2; VATClause."Description 2")
                        {
                        }
                        column(VATClauseAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = ServiceInvHeader."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATClausesCaption; VATClausesCap)
                        {
                        }
                        column(VATClauseVATIdentifierCaption; VATAmountLineVATIdentifierCaptionLbl)
                        {
                        }
                        column(VATClauseVATAmtCaption; VATAmountLineVATAmountControl109CaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            IF NOT VATClause.GET(VATAmountLine."VAT Clause Code") THEN
                                CurrReport.SKIP;
                            VATClause.TranslateDescription(ServiceInvHeader."Language Code");
                        end;

                        trigger OnPreDataItem()
                        begin
                            CLEAR(VATClause);
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            //CurrReport.CREATETOTALS(VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(PaymentTermsDescription; PaymentTerms.Description)
                        {
                        }
                        column(PaymentTermsDescriptionCaption; PaymentTermsDescriptionCaptionLbl)
                        {
                        }
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(CustNo_ServInvHeader; ServiceInvHeader."Customer No.")
                        {
                        }
                        column(CustNo_ServInvHeaderCaption; ServiceInvHeader.FIELDCAPTION("Customer No."))
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(LineFee; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            ORDER(Ascending)
                                            WHERE(Number = FILTER(1 ..));
                        column(LineFeeCaptionLbl; TempLineFeeNoteOnReportHist.ReportText)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF NOT DisplayAdditionalFeeNote THEN
                                CurrReport.BREAK;
                            IF Number = 1 THEN BEGIN
                                IF NOT TempLineFeeNoteOnReportHist.FINDSET THEN
                                    CurrReport.BREAK
                            END ELSE
                                IF TempLineFeeNoteOnReportHist.NEXT = 0 THEN
                                    CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;
                    //CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        ServiceInvCountPrinted.RUN(ServiceInvHeader);
                end;

                trigger OnPreDataItem()
                begin
                  NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                END;
                //FormatAddr.ServiceInvBillTo(CustAddr, ServiceInvHeader);
                ServiceFormatAddress.ServiceInvBillTo(CustAddr, ServiceInvHeader);
                Cust.GET("Bill-to Customer No.");

                GetLineFeeNoteOnReportHist("No.");

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE
                    PaymentTerms.GET("Payment Terms Code");

                //FormatAddr.ServiceInvShipTo(ShipToAddr,"Service Invoice Header");
                ShowShippingAddr := "Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;
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
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        Caption = 'Show Additional Fee Note';
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
    }

    trigger OnInitReport()
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        ServiceSetup.GET;

        CASE ServiceSetup."Logo Position on Documents" OF
            ServiceSetup."Logo Position on Documents"::"No Logo":
                ;
            ServiceSetup."Logo Position on Documents"::Left:
                BEGIN
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                END;
            ServiceSetup."Logo Position on Documents"::Center:
                BEGIN
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                END;
            ServiceSetup."Logo Position on Documents"::Right:
                BEGIN
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                END;
        END;
    end;

    var
        ServiceFormatAddress: Codeunit "Service Format Address";

        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Service - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record 98;
        PaymentTerms: Record 3;
        SalesPurchPerson: Record 13;
        CompanyInfo: Record 79;
        CompanyInfo1: Record 79;
        CompanyInfo2: Record 79;
        CompanyInfo3: Record 79;
        ServiceSetup: Record 5911;
        Cust: Record 18;
        DimSetEntry: Record 480;
#pragma warning disable AL0432
        VATAmountLine: Record 290 temporary;
#pragma warning restore AL0432
        VATClause: Record 560;
        RespCenter: Record 5714;
        LanguageVar: Record 8;
        ServiceShipmentBuffer: Record 5909 temporary;
        TempLineFeeNoteOnReportHist: Record 1053 temporary;
        ServiceInvCountPrinted: Codeunit 5902;
        FormatAddr: Codeunit 365;
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        OutputNo: Integer;
        TypeInt: Integer;
        DimText: Text[120];
        ShowInternalInfo: Boolean;
        TotalLineAmount: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        DimTxtArrLength: Integer;
        DimTxtArr: array[500] of Text[50];
        IsServiceContractLine: Boolean;
        AccNo: Code[20];
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoFaxNoCaptionLbl: Label 'Fax No.';
        CompanyInfoVATRegistrationNoCaptionLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccountNoCaptionLbl: Label 'Account No.';
        AmountCaptionLbl: Label 'Amount';
        ServiceInvoiceHeaderDueDateCaptionLbl: Label 'Due Date';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        ServiceInvoiceHeaderPostingDateCaptionLbl: Label 'Posting Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        ServiceInvoiceLineLineDiscountCaptionLbl: Label 'Disc. %';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        SubtotalCaptionLbl: Label 'Subtotal';
        LineAmountInvDiscountAmountAmountIncludingVATCaptionLbl: Label 'Payment Discount on VAT';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATClausesCap: Label 'VAT Clause';
        VATAmountLineVATCaptionLbl: Label 'VAT %';
        VATAmountLineVATBaseControl108CaptionLbl: Label 'VAT Base';
        VATAmountLineVATAmountControl109CaptionLbl: Label 'VAT Amount';
        VATAmountSpecificationCaptionLbl: Label 'VAT Amount Specification';
        VATAmountLineVATIdentifierCaptionLbl: Label 'VAT Identifier';
        VATAmountLineInvDiscBaseAmountControl141CaptionLbl: Label 'Inv. Disc. Base Amount';
        VATAmountLineLineAmountControl140CaptionLbl: Label 'Line Amount';
        VATAmountLineVATBaseControl116CaptionLbl: Label 'Total';
        PaymentTermsDescriptionCaptionLbl: Label 'Payment Terms';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        DisplayAdditionalFeeNote: Boolean;

    procedure FindPostedShipmentDate(): Date
    var
        ServiceShipmentHeader: Record 5990;
        ServiceShipmentBuffer2: Record 5909 temporary;
    begin
        NextEntryNo := 1;
        IF SalesInvLine."Shipment No." <> '' THEN
            IF ServiceShipmentHeader.GET(SalesInvLine."Shipment No.") THEN
                EXIT(ServiceShipmentHeader."Posting Date");

        IF ServiceInvHeader."Order No." = '' THEN
            EXIT(ServiceInvHeader."Posting Date");

        CASE SalesInvLine.Type OF
            SalesInvLine.Type::Item:
                GenerateBufferFromValueEntry(SalesInvLine);
            SalesInvLine.Type::"G/L Account", SalesInvLine.Type::Resource,
          SalesInvLine.Type::Cost:
                GenerateBufferFromShipment(SalesInvLine);
            SalesInvLine.Type::" ":
                EXIT(0D);
        END;

        ServiceShipmentBuffer.RESET;
        ServiceShipmentBuffer.SETRANGE("Document No.", SalesInvLine."Document No.");
        ServiceShipmentBuffer.SETRANGE("Line No.", SalesInvLine."Line No.");
        IF ServiceShipmentBuffer.FIND('-') THEN BEGIN
            ServiceShipmentBuffer2 := ServiceShipmentBuffer;
            IF ServiceShipmentBuffer.NEXT = 0 THEN BEGIN
                ServiceShipmentBuffer.GET(
                  ServiceShipmentBuffer2."Document No.", ServiceShipmentBuffer2."Line No.", ServiceShipmentBuffer2."Entry No.");
                ServiceShipmentBuffer.DELETE;
                EXIT(ServiceShipmentBuffer2."Posting Date");
            END;
            ServiceShipmentBuffer.CALCSUMS(Quantity);
            IF ServiceShipmentBuffer.Quantity <> SalesInvLine.Quantity THEN BEGIN
                ServiceShipmentBuffer.DELETEALL;
                EXIT(ServiceInvHeader."Posting Date");
            END;
        END ELSE
            EXIT(ServiceInvHeader."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(ServiceInvoiceLine2: Record 5993)
    var
        ValueEntry: Record 5802;
        ItemLedgerEntry: Record 32;
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := ServiceInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", ServiceInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", ServiceInvHeader."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF ServiceInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / ServiceInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      ServiceInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(ServiceInvoiceLine: Record 5993)
    var
        ServiceInvoiceHeader: Record 5992;
        ServiceInvoiceLine2: Record 5993;
        ServiceShipmentHeader: Record 5990;
        ServiceShipmentLine: Record 5991;
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        ServiceInvoiceHeader.SETCURRENTKEY("Order No.");
        ServiceInvoiceHeader.SETFILTER("No.", '..%1', ServiceInvHeader."No.");
        ServiceInvoiceHeader.SETRANGE("Order No.", ServiceInvHeader."Order No.");
        IF ServiceInvoiceHeader.FIND('-') THEN
            REPEAT
                ServiceInvoiceLine2.SETRANGE("Document No.", ServiceInvoiceHeader."No.");
                ServiceInvoiceLine2.SETRANGE("Line No.", ServiceInvoiceLine."Line No.");
                ServiceInvoiceLine2.SETRANGE(Type, ServiceInvoiceLine.Type);
                ServiceInvoiceLine2.SETRANGE("No.", ServiceInvoiceLine."No.");
                ServiceInvoiceLine2.SETRANGE("Unit of Measure Code", ServiceInvoiceLine."Unit of Measure Code");
                IF ServiceInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + ServiceInvoiceLine2.Quantity;
                    UNTIL ServiceInvoiceLine2.NEXT = 0;
            UNTIL ServiceInvoiceHeader.NEXT = 0;

        ServiceShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        ServiceShipmentLine.SETRANGE("Order No.", ServiceInvHeader."Order No.");
        ServiceShipmentLine.SETRANGE("Order Line No.", ServiceInvoiceLine."Line No.");
        ServiceShipmentLine.SETRANGE("Line No.", ServiceInvoiceLine."Line No.");
        ServiceShipmentLine.SETRANGE(Type, ServiceInvoiceLine.Type);
        ServiceShipmentLine.SETRANGE("No.", ServiceInvoiceLine."No.");
        ServiceShipmentLine.SETRANGE("Unit of Measure Code", ServiceInvoiceLine."Unit of Measure Code");
        ServiceShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF ServiceShipmentLine.FIND('-') THEN
            REPEAT
                IF ABS(ServiceShipmentLine.Quantity) <= ABS(TotalQuantity - ServiceInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - ServiceShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(ServiceShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        ServiceShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      ServiceShipmentLine.Quantity - (TotalQuantity - ServiceInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - ServiceShipmentLine.Quantity;
                    ServiceInvoiceLine.Quantity := ServiceInvoiceLine.Quantity - Quantity;

                    IF ServiceShipmentHeader.GET(ServiceShipmentLine."Document No.") THEN
                        AddBufferEntry(
                          ServiceInvoiceLine,
                          Quantity,
                          ServiceShipmentHeader."Posting Date");
                END;
            UNTIL (ServiceShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure AddBufferEntry(ServiceInvoiceLine: Record 5993; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        ServiceShipmentBuffer.SETRANGE("Document No.", ServiceInvoiceLine."Document No.");
        ServiceShipmentBuffer.SETRANGE("Line No.", ServiceInvoiceLine."Line No.");
        ServiceShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF ServiceShipmentBuffer.FIND('-') THEN BEGIN
            ServiceShipmentBuffer.Quantity := ServiceShipmentBuffer.Quantity + QtyOnShipment;
            ServiceShipmentBuffer.MODIFY;
            EXIT;
        END;

        ServiceShipmentBuffer."Document No." := ServiceInvoiceLine."Document No.";
        ServiceShipmentBuffer."Line No." := ServiceInvoiceLine."Line No.";
        ServiceShipmentBuffer."Entry No." := NextEntryNo;
        ServiceShipmentBuffer.Type := ServiceInvoiceLine.Type;
        ServiceShipmentBuffer."No." := ServiceInvoiceLine."No.";
        ServiceShipmentBuffer.Quantity := QtyOnShipment;
        ServiceShipmentBuffer."Posting Date" := PostingDate;
        ServiceShipmentBuffer.INSERT;
        NextEntryNo := NextEntryNo + 1
    end;

    procedure FindDimTxt(DimSetID: Integer)
    var
        Separation: Text[5];
        i: Integer;
        TxtToAdd: Text[120];
        StartNewLine: Boolean;
    begin
        DimSetEntry.SETRANGE("Dimension Set ID", DimSetID);
        DimTxtArrLength := 0;
        FOR i := 1 TO ARRAYLEN(DimTxtArr) DO
            DimTxtArr[i] := '';
        IF NOT DimSetEntry.FINDSET THEN
            EXIT;
        Separation := '; ';
        REPEAT
            TxtToAdd := DimSetEntry."Dimension Code" + ' - ' + DimSetEntry."Dimension Value Code";
            IF DimTxtArrLength = 0 THEN
                StartNewLine := TRUE
            ELSE
                StartNewLine := STRLEN(DimTxtArr[DimTxtArrLength]) + STRLEN(Separation) + STRLEN(TxtToAdd) > MAXSTRLEN(DimTxtArr[1]);
            IF StartNewLine THEN BEGIN
                DimTxtArrLength += 1;
                DimTxtArr[DimTxtArrLength] := TxtToAdd
            END ELSE
                DimTxtArr[DimTxtArrLength] := DimTxtArr[DimTxtArrLength] + Separation + TxtToAdd;
        UNTIL DimSetEntry.NEXT = 0;
    end;

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
    var
        LineFeeNoteOnReportHist: Record 1053;
        CustLedgerEntry: Record 21;
        Customer: Record 18;
    begin
        TempLineFeeNoteOnReportHist.DELETEALL;
        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Document No.", SalesInvoiceHeaderNo);
        IF NOT CustLedgerEntry.FINDFIRST THEN
            EXIT;

        IF NOT Customer.GET(ServiceInvHeader."Bill-to Customer No.") THEN
            EXIT;

        LineFeeNoteOnReportHist.SETRANGE("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SETRANGE("Language Code", Customer."Language Code");
        IF LineFeeNoteOnReportHist.FINDSET THEN BEGIN
            REPEAT
                TempLineFeeNoteOnReportHist.INIT;
                TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
                TempLineFeeNoteOnReportHist.INSERT;
            UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END ELSE BEGIN
            //LineFeeNoteOnReportHist.SETRANGE("Language Code", Language.GetUserLanguage);
            IF LineFeeNoteOnReportHist.FINDSET THEN
                REPEAT
                    TempLineFeeNoteOnReportHist.INIT;
                    TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
                    TempLineFeeNoteOnReportHist.INSERT;
                UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END;
    end;
}

