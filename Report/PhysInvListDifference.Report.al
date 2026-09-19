report 50099 "Phys. Inv. List Difference"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PhysInvListDifference.rdl';
    Caption = 'Phys. Inv. List Difference Report';

    dataset
    {
        dataitem(ItemJnlBatchData; "Item Journal Batch")
        {
            RequestFilterFields = "Journal Template Name", Name;
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }

            column(Item_Journal_Batch__TABLECAPTION_______Item_Journal_Batch__GETFILTERS; ItemJnlBatchData.TABLECAPTION + ': ' + ItemJnlBatchData.GETFILTERS)
            {
            }
            column(Item_Journal_Line__TABLECAPTION__________ItemJnlLineFilter; ItemJnlLineData.TABLECAPTION + ': ' + ItemJnlLineFilter)
            {
            }
            column(Phys__Inventory_ListCaption; Phys__Inventory_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_Journal_Line__Posting_Date_Caption; ItemJnlLineData.FIELDCAPTION("Posting Date"))
            {
            }
            column(Item_Journal_Line__Item_No__Caption; ItemJnlLineData.FIELDCAPTION("Item No."))
            {
            }
            column(Item_Journal_Line_DescriptionCaption; ItemJnlLineData.FIELDCAPTION(Description))
            {
            }
            column(Item_Journal_Line__Shortcut_Dimension_1_Code_Caption; CAPTIONCLASSTRANSLATE('1,1,1'))
            {
            }
            column(Item_Journal_Line__Shelf_No__Caption; ItemJnlLineData.FIELDCAPTION("Shelf No."))
            {
            }
            column(Item_Journal_Line__Location_Code_Caption; ItemJnlLineData.FIELDCAPTION("Location Code"))
            {
            }
            column(Item_Journal_Line__Qty___Calculated__Caption; ItemJnlLineData.FIELDCAPTION("Qty. (Calculated)"))
            {
            }
            column(Qty___Phys__Inventory_Caption; Qty___Phys__Inventory_CaptionLbl)
            {
            }
            column(DifferenceCaption; DifferenceCaptionLbl)
            {
            }
            column(Item_Journal_Line_AmountCaption; ItemJnlLineData.FIELDCAPTION(Amount))
            {
            }
            column(Item_Journal_Line__Unit_Amount_Caption; ItemJnlLineData.FIELDCAPTION("Unit Amount"))
            {
            }
            column(Item_Journal_Batch_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Item_Journal_Batch_Name; Name)
            {
            }
            dataitem(ItemJnlLineData; "Item Journal Line")
            {
                DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"),
                               "Journal Batch Name" = FIELD(Name);
                DataItemTableView = SORTING("Bin Code", "Item No.", "Variant Code", "Posting Date");
                RequestFilterFields = "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Location Code";
                column(Item_Journal_Line__Posting_Date_; "Posting Date")
                {
                }
                column(Item_Journal_Line__Item_No__; "Item No.")
                {
                }
                column(Item_Journal_Line_Description; Description)
                {
                }
                column(Item_Journal_Line__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
                {
                }
                column(Item_Journal_Line__Shelf_No__; "Shelf No.")
                {
                }
                column(Item_Journal_Line__Location_Code_; "Location Code")
                {
                }
                column(Item_Journal_Line__Qty___Calculated__; "Qty. (Calculated)")
                {
                }
                column(Diff; Diff)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Item_Journal_Line__Qty___Phys__Inventory__; "Qty. (Phys. Inventory)")
                {
                }
                column(Item_Journal_Line_Amount; Amount)
                {
                }
                column(Item_Journal_Line__Unit_Amount_; "Unit Amount")
                {
                }
                column(Item_Journal_Line__Posting_Date__Control23; "Posting Date")
                {
                }
                column(Item_Journal_Line__Location_Code__Control26; "Location Code")
                {
                }
                column(Item_Journal_Line__Shelf_No___Control27; "Shelf No.")
                {
                }
                column(Item_Journal_Line__Shortcut_Dimension_1_Code__Control28; "Shortcut Dimension 1 Code")
                {
                }
                column(Item_Journal_Line_Description_Control29; Description)
                {
                }
                column(Item_Journal_Line__Item_No___Control30; "Item No.")
                {
                }
                column(Diff_Control1000000002; Diff)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Item_Journal_Line__Qty___Phys__Inventory___Control1000000004; "Qty. (Phys. Inventory)")
                {
                }
                column(Item_Journal_Line_Amount_Control1000000018; Amount)
                {
                }
                column(Item_Journal_Line__Unit_Amount__Control1000000019; "Unit Amount")
                {
                }
                column(Item_Journal_Line__Posting_Date__Control1000000005; "Posting Date")
                {
                }
                column(Item_Journal_Line__Location_Code__Control1000000006; "Location Code")
                {
                }
                column(Item_Journal_Line__Shelf_No___Control1000000007; "Shelf No.")
                {
                }
                column(Item_Journal_Line__Shortcut_Dimension_1_Code__Control1000000008; "Shortcut Dimension 1 Code")
                {
                }
                column(Item_Journal_Line_Description_Control1000000009; Description)
                {
                }
                column(Item_Journal_Line__Item_No___Control1000000010; "Item No.")
                {
                }
                column(Item_Journal_Line_Amount_Control1000000020; Amount)
                {
                }
                column(Item_Journal_Line__Unit_Amount__Control1000000021; "Unit Amount")
                {
                }
                column(Item_Journal_Line_Amount_Control1000000029; Amount)
                {
                }
                column(Item_Journal_Line__Unit_Amount__Control1000000030; "Unit Amount")
                {
                }
                column(Item_Journal_Line_Journal_Template_Name; "Journal Template Name")
                {
                }
                column(Item_Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                {
                }
                column(Item_Journal_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Diff := "Qty. (Calculated)" - "Qty. (Phys. Inventory)";
                end;
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

    trigger OnPreReport()
    begin
        ItemJnlLineFilter := ItemJnlLineData.GETFILTERS;
    end;

    var
        ItemJnlLineFilter: Text[250];
        ShowQtyCalculated: Boolean;
        Diff: Decimal;
        ShowZeroDifference: Boolean;
        SecondCheckList: Boolean;
        Phys__Inventory_ListCaptionLbl: Label 'Phys. Inventory List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Qty___Phys__Inventory_CaptionLbl: Label 'Qty. (Phys. Inventory)';
        DifferenceCaptionLbl: Label 'Difference';
}

