report 50183 "Item Movement Monitor Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ItemMovementMonitorReport.rdl';

    dataset
    {
        dataitem(DataItem8129; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group", "Item Price Group");
            RequestFilterFields = "No.", "Inventory Posting Group", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(ExportToExcel; ExportToExcel)
            {
            }
            column(conzero; conzero)
            {
            }
            column(movedate; movedate)
            {
            }
            column(moveper; moveper)
            {
            }
            column(USERID; USERID)
            {
            }
            column(CALCDATE_moveper_movedate_; CALCDATE(moveper, movedate))
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item_Inventory; Inventory)
            {
            }
            column(Lastdate; Lastdate)
            {
            }
            column(LastsaleDate; LastsaleDate)
            {
            }
            column(lastpurchdate; lastpurchdate)
            {
            }
            column(costval; costval)
            {
            }
            column(Item__Unit_Cost_; "Unit Cost")
            {
            }
            column(Item_Item__Product_Code_; "Product Code")
            {
            }
            column(Item_Item__Product_Group_Code_; "Item Category Code")
            {
            }
            column(Item_Item__Model_Name_; "Model Name")
            {
            }
            column(Item_Item__Model_No__; "Model No.")
            {
            }
            column(TotalFor___FIELDCAPTION__Inventory_Posting_Group__; TotalFor + FIELDCAPTION("Inventory Posting Group"))
            {
            }
            column(Item_Inventory_Control1000000029; Inventory)
            {
            }
            column(costval_Control1000000033; costval)
            {
            }
            column(Item_Movement_AnalysisCaption; Item_Movement_AnalysisCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(CALCDATE_moveper_movedate_Caption; CALCDATE_moveper_movedate_CaptionLbl)
            {
            }
            column(lastpurchdateCaption; lastpurchdateCaptionLbl)
            {
            }
            column(LastsaleDateCaption; LastsaleDateCaptionLbl)
            {
            }
            column(LastdateCaption; LastdateCaptionLbl)
            {
            }
            column(Item_InventoryCaption; FIELDCAPTION(Inventory))
            {
            }
            column(Item_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Item__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(costvalCaption; costvalCaptionLbl)
            {
            }
            column(Item__Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
            {
            }
            column(Product_CodeCaption; Product_CodeCaptionLbl)
            {
            }
            column(Product_Group_CodeCaption; Product_Group_CodeCaptionLbl)
            {
            }
            column(Model_NameCaption; Model_NameCaptionLbl)
            {
            }
            column(Model_NoCaption; Model_NoCaptionLbl)
            {
            }
            column(Item__Inventory_Posting_Group_Caption; FIELDCAPTION("Inventory Posting Group"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                //ledgerrec.SETCURRENTKEY("Item No.","Posting Date");

                Lastdate := 0D;
                LastsaleDate := 0D;
                lastpurchdate := 0D;
                costval := 0;
                ledgerrec.SETRANGE(ledgerrec."Item No.", "No.");
                IF ledgerrec.FIND('+') THEN BEGIN
                    Lastdate := ledgerrec."Posting Date";
                    IF Lastdate > CALCDATE(moveper, movedate) THEN
                        CurrReport.SKIP;

                    ledgerrec.SETRANGE(ledgerrec."Entry Type", ledgerrec."Entry Type"::Sale);
                    IF ledgerrec.FIND('+') THEN
                        LastsaleDate := ledgerrec."Posting Date";
                    Lastdate := ledgerrec."Posting Date";
                    ledgerrec.SETRANGE(ledgerrec."Entry Type");
                    ledgerrec.SETRANGE(ledgerrec."Entry Type", ledgerrec."Entry Type"::Purchase);
                    IF ledgerrec.FIND('+') THEN
                        lastpurchdate := ledgerrec."Posting Date";
                END;
                ledgerrec.SETRANGE(ledgerrec."Entry Type");
                IF Inventory > 0 THEN
                    costval := Inventory * "Unit Cost"
                ELSE
                    IF NOT conzero THEN CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Inventory Posting Group");
                IF movedate = 0D THEN
                    movedate := TODAY;
                ledgerrec.SETCURRENTKEY("Item No.", "Posting Date", "Entry Type");
                //CurrReport.CREATETOTALS(costval);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Movement End Date"; moveper)
                {
                    ApplicationArea = All;
                }
                field("Movement Last Considered"; movedate)
                {
                    ApplicationArea = All;
                }
                field("Show Zero Inventory"; conzero)
                {
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        ledgerrec: Record 32;
        Lastdate: Date;
        LastsaleDate: Date;
        lastpurchdate: Date;
        moveper: DateFormula;
        movedate: Date;
        costval: Decimal;
        ExportToExcel: Boolean;
        "==============": Integer;
        EXc: Integer;
        EXr: Integer;
        gFontSize: Integer;

        Bold: Boolean;
        Italic: Boolean;
        Underline: Boolean;
        NR: Integer;
        conzero: Boolean;
        Item_Movement_AnalysisCaptionLbl: Label 'Item Movement Analysis';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CALCDATE_moveper_movedate_CaptionLbl: Label 'Stock That Has Not Moved since  ';
        lastpurchdateCaptionLbl: Label 'Last Date  Purchased';
        LastsaleDateCaptionLbl: Label 'Last Date Sold';
        LastdateCaptionLbl: Label 'Last Date Moved';
        costvalCaptionLbl: Label 'Stock Value';
        Product_CodeCaptionLbl: Label 'Product Code';
        Product_Group_CodeCaptionLbl: Label 'Product Group Code';
        Model_NameCaptionLbl: Label 'Model Name';
        Model_NoCaptionLbl: Label 'Model No';
}

