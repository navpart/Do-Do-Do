report 50237 "Warranty Picking List."
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/WarrantyPickingList.rdl';

    dataset
    {
        dataitem(DataItem7515; "Warranty Claim Header")
        {
            DataItemTableView = SORTING("Claim No.");
            RequestFilterFields = "Claim No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Warranty_Claim_Header__Claim_No__; "Claim No.")
            {
            }
            column(Warranty_Claim_Header__Dealer_Code_; "Dealer Code")
            {
            }
            column(Warranty_Claim_Header__Dealer_Name_; "Dealer Name")
            {
            }
            column(Warranty_Claim_Header__Owners_Name_; "Owners Name")
            {
            }
            column(Warranty_Claim_Header__Process_Date_; "Process Date")
            {
            }
            column(Warranty_Claim_Header__Vehicle_Identification_No__; "Vehicle Identification No.")
            {
            }
            column(Warranty_Claim_Header__Vehicle_Engine_No__; "Vehicle Engine No.")
            {
            }
            column(Warranty_Claim_Header__Vehicle_Model_; "Vehicle Model")
            {
            }
            column(Warranty_Claim_Header__Model_Year_; "Model Year")
            {
            }
            column(Warranty_Claim_Header__Delivery_Date_; "Delivery Date")
            {
            }
            column(Warranty_Claim_Header__Odometer_Reading_; "Odometer Reading")
            {
            }
            column(Warranty_Claim_Header__Under_Warranty_; "Under Warranty")
            {
            }
            column(Warranty_Claim_Header__Warranty_Expired_; "Warranty Expired")
            {
            }
            column(Warranty_Claim_Header__Warranty_Expired_Date_; "Warranty Expired Date")
            {
            }
            column(Warranty_Claim_Header__Claim_Approved_by_TNL_; "Claim Approved by TNL")
            {
            }
            column(Warranty_Claim_Header__Total_Material_Claim_cost_; "Total Material Claim cost")
            {
            }
            column(Warranty_Claim_Header__Total_Labour_Claim_; "Total Labour Claim")
            {
            }
            column(Warranty_Claim_Header__Date_Approved_by_TNL_; "Date Approved by TNL")
            {
            }
            column(Warranty_Claim_Header__TWC_No__; "TWC No.")
            {
            }
            column(Warranty_Claim_Header__Claim_Refund_by_TMC_; "Claim Refund by TMC")
            {
            }
            column(Warranty_Claim_Header__Labour_Charge_accepted_by_TMC_; "Labour Charge accepted by TMC")
            {
            }
            column(Warranty_Claim_Header__Replace_Dealer_Material_Claim_; "Replace Dealer Material Claim")
            {
            }
            column(Warranty_Claim_Header__Refund_Dealer_Labour_Claim_; "Refund Dealer Labour Claim")
            {
            }
            column(Warranty_Picking_ListCaption; Warranty_Picking_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Warranty_Claim_Header__Claim_No__Caption; FIELDCAPTION("Claim No."))
            {
            }
            column(Warranty_Claim_Header__Dealer_Code_Caption; FIELDCAPTION("Dealer Code"))
            {
            }
            column(Warranty_Claim_Header__Dealer_Name_Caption; FIELDCAPTION("Dealer Name"))
            {
            }
            column(Warranty_Claim_Header__Owners_Name_Caption; FIELDCAPTION("Owners Name"))
            {
            }
            column(Warranty_Claim_Header__Process_Date_Caption; FIELDCAPTION("Process Date"))
            {
            }
            column(Warranty_Claim_Header__Vehicle_Identification_No__Caption; FIELDCAPTION("Vehicle Identification No."))
            {
            }
            column(Warranty_Claim_Header__Vehicle_Engine_No__Caption; FIELDCAPTION("Vehicle Engine No."))
            {
            }
            column(Warranty_Claim_Header__Vehicle_Model_Caption; FIELDCAPTION("Vehicle Model"))
            {
            }
            column(Warranty_Claim_Header__Model_Year_Caption; FIELDCAPTION("Model Year"))
            {
            }
            column(Warranty_Claim_Header__Delivery_Date_Caption; FIELDCAPTION("Delivery Date"))
            {
            }
            column(Warranty_Claim_Header__Odometer_Reading_Caption; FIELDCAPTION("Odometer Reading"))
            {
            }
            column(Warranty_Claim_Header__Under_Warranty_Caption; FIELDCAPTION("Under Warranty"))
            {
            }
            column(Warranty_Claim_Header__Warranty_Expired_Caption; FIELDCAPTION("Warranty Expired"))
            {
            }
            column(Warranty_Claim_Header__Warranty_Expired_Date_Caption; FIELDCAPTION("Warranty Expired Date"))
            {
            }
            column(Warranty_Claim_Header__Claim_Approved_by_TNL_Caption; FIELDCAPTION("Claim Approved by TNL"))
            {
            }
            column(Warranty_Claim_Header__Total_Material_Claim_cost_Caption; FIELDCAPTION("Total Material Claim cost"))
            {
            }
            column(Warranty_Claim_Header__Total_Labour_Claim_Caption; FIELDCAPTION("Total Labour Claim"))
            {
            }
            column(Warranty_Claim_Header__Date_Approved_by_TNL_Caption; FIELDCAPTION("Date Approved by TNL"))
            {
            }
            column(Warranty_Claim_Header__TWC_No__Caption; FIELDCAPTION("TWC No."))
            {
            }
            column(Warranty_Claim_Header__Claim_Refund_by_TMC_Caption; FIELDCAPTION("Claim Refund by TMC"))
            {
            }
            column(Warranty_Claim_Header__Labour_Charge_accepted_by_TMC_Caption; FIELDCAPTION("Labour Charge accepted by TMC"))
            {
            }
            column(Warranty_Claim_Header__Replace_Dealer_Material_Claim_Caption; FIELDCAPTION("Replace Dealer Material Claim"))
            {
            }
            column(Warranty_Claim_Header__Refund_Dealer_Labour_Claim_Caption; FIELDCAPTION("Refund Dealer Labour Claim"))
            {
            }
            dataitem(DataItem5081; "Warranty Claim Detail")
            {
                DataItemLink = "Claim No." = FIELD("Claim No.");
                column(Warranty_Claim_Detail__Claim_Type_; "Claim Type")
                {
                }
                column(Warranty_Claim_Detail__No__; "No.")
                {
                }
                column(Warranty_Claim_Detail_Description; Description)
                {
                }
                column(Warranty_Claim_Detail_Quantity; Quantity)
                {
                }
                column(Warranty_Claim_Detail__Variant_Code_; "Variant Code")
                {
                }
                column(Warranty_Claim_Detail_Location; Location)
                {
                }
                column(Warranty_Claim_Detail__Shelf_No__; "Shelf No.")
                {
                }
                column(Warranty_Claim_Detail__Issue_to_Dealer_Date_; "Issue to Dealer Date")
                {
                }
                column(Warranty_Claim_Detail__Claim_Type_Caption; FIELDCAPTION("Claim Type"))
                {
                }
                column(Part_No_Caption; Part_No_CaptionLbl)
                {
                }
                column(Warranty_Claim_Detail_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Warranty_Claim_Detail_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Warranty_Claim_Detail__Variant_Code_Caption; FIELDCAPTION("Variant Code"))
                {
                }
                column(Warranty_Claim_Detail_LocationCaption; FIELDCAPTION(Location))
                {
                }
                column(Warranty_Claim_Detail__Shelf_No__Caption; FIELDCAPTION("Shelf No."))
                {
                }
                column(Warranty_Claim_Detail__Issue_to_Dealer_Date_Caption; FIELDCAPTION("Issue to Dealer Date"))
                {
                }
                column(Manager_s_Approval_________________Caption; Manager_s_Approval_________________CaptionLbl)
                {
                }
                column(Storemanager_Approval_______Caption; Storemanager_Approval_______CaptionLbl)
                {
                }
                column(Received_by_______________________________Caption; Received_by_______________________________CaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1000000079; EmptyStringCaption_Control1000000079Lbl)
                {
                }
                column(EmptyStringCaption_Control1000000080; EmptyStringCaption_Control1000000080Lbl)
                {
                }
                column(Warranty_Claim_Detail_Claim_No_; "Claim No.")
                {
                }
                column(Warranty_Claim_Detail_Vehicle_identification_Number; "Vehicle identification Number")
                {
                }
                column(Warranty_Claim_Detail_Line_No_; "Line No.")
                {
                }
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

    var
        Warranty_Picking_ListCaptionLbl: Label 'Warranty Picking List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Part_No_CaptionLbl: Label 'Part No.';
        Manager_s_Approval_________________CaptionLbl: Label 'Manager''s Approval: ...............';
        Storemanager_Approval_______CaptionLbl: Label 'Storemanager Approval: .....';
        Received_by_______________________________CaptionLbl: Label 'Received by ..............................';
        EmptyStringCaptionLbl: Label '_________________________';
        EmptyStringCaption_Control1000000079Lbl: Label '_________________________';
        EmptyStringCaption_Control1000000080Lbl: Label '_________________________';
}

