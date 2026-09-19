report 50438 "TNL Picking List- Pre-Owned"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLPickingListPreOwned.rdl';

    dataset
    {
        dataitem(DataItem6640; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER('>Quote&<Credit Memo'));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            column(TOTAL_Caption; TOTAL_CaptionLbl)
            {
            }
            column(Marketing_ManagerCaption; Marketing_ManagerCaptionLbl)
            {
            }
            column(Operation_Logistics_ManagerCaption; Operation_Logistics_ManagerCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(CustomerAddr_1_; CustomerAddr[1])
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem(Counter; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(DataItem2844; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"),
                                   "Document No." = FIELD("No.");
                    DataItemLinkReference = "DataItem6640";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                        WHERE(Type = CONST(Item),
                                              "Qty. to Ship" = FILTER('>0'));
                    column(CompanyData_Name; CompanyData.Name)
                    {
                    }
                    column(CompanyData_Address; CompanyData.Address)
                    {
                    }
                    column(CompanyData__Address_2_; CompanyData."Address 2")
                    {
                    }
                    column(CustomerAddr_2_; CustomerAddr[2])
                    {
                    }
                    column(CompanyData_City; CompanyData.City)
                    {
                    }
                    column(Colour_SalesLine; Colour)
                    {
                    }
                    column(No_SalesLine; "No.")
                    {
                    }
                    column(CustomerAddr_3_; CustomerAddr[3])
                    {
                    }
                    column(YearofProduction_SalesLine; "Year of Production")
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                    }
                    column(Description_SalesLine; Description)
                    {
                    }
                    column(EstimatedMileage_SalesLine; "Estimated Mileage")
                    {
                    }
                    column(CompanyData__Address_4_; CompanyData."Address 4")
                    {
                    }
                    column(CustomerAddr_4_; CustomerAddr[4])
                    {
                    }
                    column(CustomerAddr_5_; CustomerAddr[5])
                    {
                    }
                    column(Tel_____CompanyData__Internation_phone_; 'Tel.: ' + CompanyData."Internation phone")
                    {
                    }
                    column(CustomerAddr_6_; CustomerAddr[6])
                    {
                    }
                    column(CompanyData__Phone_No__; CompanyData."Phone No.")
                    {
                    }
                    column(CompanyData__Phone_No__2_; CompanyData."Phone No. 2")
                    {
                    }
                    column(Fax____CompanyData__Fax_No__; 'Fax: ' + CompanyData."Fax No.")
                    {
                    }
                    column(Reg__No_____CompanyData__Registration_No__; 'Reg. No.: ' + CompanyData."Registration No.")
                    {
                    }
                    column(Vat_No_____CompanyData__VAT_Reg__No__; 'Vat No.: ' + CompanyData."VAT Reg. No.")
                    {
                    }
                    column(Sales_Header___No__; "No.")
                    {
                    }
                    column(Sales_Header___Shipment_Date_; "Shipment Date")
                    {
                    }
                    column(Bill_to_Customer_No________Shortcut_Dimension_1_Code_______Shortcut_Dimension_2_Code_; "Bill-to Customer No." + '-' + "Shortcut Dimension 1 Code" + '-' + "Shortcut Dimension 2 Code")
                    {
                    }
                    column(Sales_Header___Your_Reference_; ReferenceTxt)
                    {
                    }

                    column(SalesPerson_Name; SalesPerson.Name)
                    {
                    }
                    column(Order_No_Caption; Order_No_CaptionLbl)
                    {
                    }
                    column(Date_Caption; Date_CaptionLbl)
                    {
                    }
                    column(Customer_No_Caption; Customer_No_CaptionLbl)
                    {
                    }
                    column(Toyota__Nigeria__LimitedCaption; Toyota__Nigeria__LimitedCaptionLbl)
                    {
                    }
                    column(Plot_2__Block_GCaption; Plot_2__Block_GCaptionLbl)
                    {
                    }
                    column(Isolo_Express_Road__IsoloCaption; Isolo_Express_Road__IsoloCaptionLbl)
                    {
                    }
                    column(P__O__Box_14504__Lagos__NigeriaCaption; P__O__Box_14504__Lagos__NigeriaCaptionLbl)
                    {
                    }
                    column(Tel__4528320__4527912Caption; Tel__4528320__4527912CaptionLbl)
                    {
                    }
                    column(Fax__4524637Caption; Fax__4524637CaptionLbl)
                    {
                    }
                    column(Reg_No___RC_281837Caption; Reg_No___RC_281837CaptionLbl)
                    {
                    }
                    column(VAT_No___IKV_080021482Caption; VAT_No___IKV_080021482CaptionLbl)
                    {
                    }
                    column(Page_No_Caption; Page_No_CaptionLbl)
                    {
                    }
                    column(Product_No_Caption; Product_No_CaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(LocationCaption; LocationCaptionLbl)
                    {
                    }
                    column(ColourCaption; ColourCaptionLbl)
                    {
                    }
                    column(Chassis_No_Caption; Chassis_No_CaptionLbl)
                    {
                    }
                    column(QtyCaption; QtyCaptionLbl)
                    {
                    }
                    column(PICKING_LISTCaption; PICKING_LISTCaptionLbl)
                    {
                    }
                    column(Sales_Person_Caption; Sales_Person_CaptionLbl)
                    {
                    }
                    column(Sales_Line_Document_Type; "Document Type")
                    {
                    }
                    column(Sales_Line_Document_No_; "Document No.")
                    {
                    }
                    column(Sales_Line_Line_No_; "Line No.")
                    {
                    }
                    dataitem(DataItem4003; "Reservation Entry")
                    {
                        DataItemLink = "Source ID" = FIELD("Document No."),
                                       "Source Ref. No." = FIELD("Line No.");
                        column(Reservation_Entry__Serial_No__; "Serial No.")
                        {
                        }
                        column(Reservation_Entry__Reservation_Entry___Exterior_Colour_Name_; "Exterior Colour Name")
                        {
                        }
                        column(Reservation_Entry__Reservation_Entry___Location_Code_; "Location Code")
                        {
                        }
                        column(Reservation_Entry__Item_No__; "Item No.")
                        {
                        }
                        column(ABS__Quantity__Base___; ABS("Quantity (Base)"))
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(Sales_Line__Description; Description)
                        {
                        }
                        column(Reservation_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Reservation_Entry_Positive; Positive)
                        {
                        }
                        column(Reservation_Entry_Source_ID; "Source ID")
                        {
                        }
                        column(Reservation_Entry_Source_Ref__No_; "Source Ref. No.")
                        {
                        }
                        column(ColourName; ColourName)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            ItemLedgEntry.SETCURRENTKEY("Serial No.");
                            ItemLedgEntry.SETRANGE("Serial No.", "Serial No.");
                            IF ItemLedgEntry.FINDFIRST THEN BEGIN
                                ColourName := ItemLedgEntry."Exterior Colour Name";
                                "Exterior Colour Code" := ItemLedgEntry."Exterior Colour Name";
                            END;
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF "Amount Including VAT" - Amount <> 0 THEN
                            VATLiable := VATLiable + Amount;
                        TotalGross := TotalGross + "Amount Including VAT";
                        TotalNet := TotalNet + Amount;

                        IF itemRec.GET("No.") THEN
                            binlocvar := itemRec."Shelf No."
                        ELSE
                            binlocvar := '';

                        IF SKU.GET("Location Code", "No.", "Variant Code") THEN BEGIN
                            IF ColourRec.GET(SKU."Product Group Code", SKU.Colour) THEN
                                ColourTxt := ColourRec.Description
                            ELSE
                                ColourTxt := '';
                        END;

                        /*
                        IF ColourRec.GET("Product Group Code",Colour) THEN
                          ColourTxt := ColourRec.Description
                        ELSE
                          ColourTxt := '';
                        */

                    end;

                    trigger OnPreDataItem()
                    begin
                        VATLiable := 0;
                        TotalGross := 0;
                        TotalNet := 0;
                        MoreLines := FIND('+');
                        WHILE (MoreLines) AND
                              (Description = '') AND
                              ("No." = '') AND
                              (Quantity = 0) AND
                              (Amount = 0)
                        DO
                            MoreLines := NEXT(-1) <> 0;
                        IF MoreLines THEN
                            SETRANGE("Line No.", 0, "Line No.")
                        ELSE
                            CurrReport.BREAK;

                        // CurrReport.CREATETOTALS("Qty. to Ship");
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    PrintBottom := FALSE;
                    IF CopyNo = NoLoops THEN BEGIN
                        CurrReport.BREAK;
                    END ELSE
                        CopyNo := CopyNo + 1;
                    IF CopyNo = 1 THEN /*Original*/
                        CLEAR(CopyTxt)
                    ELSE
                        CopyTxt := 'COPY';

                end;

                trigger OnPreDataItem()
                begin
                   NoLoops := 1 + ABS(NoCopies);
                    IF NoLoops <= 0 THEN
                        NoLoops := 1;
                    CopyNo := 0;
                end;
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
                CustomerAddr[3] := "Bill-to Address";
                CustomerAddr[4] := "Bill-to Address 2";
                CustomerAddr[5] := "Del.Add. 3";
                CustomerAddr[6] := "P.O.Box";
                CustomerAddr[7] := "Bill-to City";
                CustomerAddr[8] := "Bill-to Contact";

                COMPRESSARRAY(CustomerAddr);
                PrintBottom := FALSE;
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

    trigger OnPreReport()
    begin
        CompanyData.GET;
    end;

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
        TotalNet: Decimal;
        VATLiable: Decimal;
        TotalGross: Decimal;
        Delivery: Record 10;
        Payment: Record 3;
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
        ColourRec: Record 50067;
        ColourTxt: Text[30];
        SKU: Record 5700;
        TOTAL_CaptionLbl: Label 'TOTAL:';
        Marketing_ManagerCaptionLbl: Label 'Marketing Manager';
        Operation_Logistics_ManagerCaptionLbl: Label 'Operation/Logistics Manager';
        Order_No_CaptionLbl: Label 'Order No:';
        Date_CaptionLbl: Label 'Date:';
        Customer_No_CaptionLbl: Label 'Customer No:';
        Toyota__Nigeria__LimitedCaptionLbl: Label 'Toyota (Nigeria) Limited';
        Plot_2__Block_GCaptionLbl: Label 'Plot 2, Block G';
        Isolo_Express_Road__IsoloCaptionLbl: Label 'Isolo Express Road, Isolo';
        P__O__Box_14504__Lagos__NigeriaCaptionLbl: Label 'P. O. Box 14504, Lagos, Nigeria';
        Tel__4528320__4527912CaptionLbl: Label 'Tel: 4528320, 4527912';
        Fax__4524637CaptionLbl: Label 'Fax: 4524637';
        Reg_No___RC_281837CaptionLbl: Label 'Reg.No.: RC 281837';
        VAT_No___IKV_080021482CaptionLbl: Label 'VAT No.: IKV 080021482';
        Page_No_CaptionLbl: Label 'Page No.';
        Product_No_CaptionLbl: Label 'Product No.';
        DescriptionCaptionLbl: Label 'Description';
        LocationCaptionLbl: Label 'Location';
        ColourCaptionLbl: Label 'Colour';
        Chassis_No_CaptionLbl: Label 'Chassis No.';
        QtyCaptionLbl: Label 'Qty';
        PICKING_LISTCaptionLbl: Label 'PICKING LIST';
        Sales_Person_CaptionLbl: Label 'Sales Person:';
        CustomerDetails: array[8] of Text;
        ItemLedgEntry: Record 32;
        ColourName: Text;
}

