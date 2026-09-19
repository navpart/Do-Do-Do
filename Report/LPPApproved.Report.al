report 50075 "LPP Approved"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LPPApproved.rdl';

    dataset
    {
        dataitem(DataItem1; "Local Part Purchase Register")
        {
            RequestFilterFields = "LPP No.";
            column(LPPNo_LocalPartPurchaseRegister; "LPP No.")
            {
            }
            column(RequesterCode_LocalPartPurchaseRegister; "Requester Code")
            {
            }
            column(RequesterName_LocalPartPurchaseRegister; "Requester Name")
            {
            }
            column(DepartmentCode1_LocalPartPurchaseRegister; "Department Code")
            {
            }
            column(RequesterDepartment_LocalPartPurchaseRegister; "Requester Department")
            {
            }
            column(Date_LocalPartPurchaseRegister; Date)
            {
            }
            column(SuppliersAddress_LocalPartPurchaseRegister; "Supplier's Address")
            {
            }
            column(SuppliersName_LocalPartPurchaseRegister; "Supplier's Name")
            {
            }
            column(ProfomaInvoiceNo_LocalPartPurchaseRegister; "Profoma Invoice No:")
            {
            }
            column(Justificationforpurchase_LocalPartPurchaseRegister; "Justification for purchase")
            {
            }
            column(TotalPurchaseValue_LocalPartPurchaseRegister; "Total Purchase Value")
            {
            }
            column(HODCode_LocalPartPurchaseRegister; "HOD Code")
            {
            }
            column(HODName_LocalPartPurchaseRegister; "HOD Name")
            {
            }
            column(Approved1_LocalPartPurchaseRegister; Approved1)
            {
            }
            column(Approved2_LocalPartPurchaseRegister; Approved2)
            {
            }
            column(OnHold1_LocalPartPurchaseRegister; "On-Hold1")
            {
            }
            column(OnHold2_LocalPartPurchaseRegister; "On-Hold2")
            {
            }
            column(Rejected1_LocalPartPurchaseRegister; Rejected1)
            {
            }
            column(Rejected2_LocalPartPurchaseRegister; Rejected2)
            {
            }
            column(Comment1_LocalPartPurchaseRegister; Comment1)
            {
            }
            column(Comment2_LocalPartPurchaseRegister; Comment2)
            {
            }
            column(NoSeries_LocalPartPurchaseRegister; "No. Series")
            {
            }
            column(UserID_LocalPartPurchaseRegister; "User ID")
            {
            }
            column(SendTo_LocalPartPurchaseRegister; "Send To")
            {
            }
            column(Send_LocalPartPurchaseRegister; Send)
            {
            }
            column(SentBy_LocalPartPurchaseRegister; "Sent By")
            {
            }
            column(Approved3_LocalPartPurchaseRegister; Approved3)
            {
            }
            column(Rejected3_LocalPartPurchaseRegister; Rejected3)
            {
            }
            column(OnHold3_LocalPartPurchaseRegister; "On-Hold3")
            {
            }
            column(Comment3_LocalPartPurchaseRegister; Comment3)
            {
            }
            column(HeadofDepartment_LocalPartPurchaseRegister; "Head of Department")
            {
            }
            column(NameHOD_LocalPartPurchaseRegister; "Name HOD")
            {
            }
            column(HeadofAudit_LocalPartPurchaseRegister; "Head of Audit")
            {
            }
            column(NameHeadofAudit_LocalPartPurchaseRegister; "Name Head of Audit")
            {
            }
            column(ManagingDirector_LocalPartPurchaseRegister; "Managing Director")
            {
            }
            column(NameMD_LocalPartPurchaseRegister; "Name MD")
            {
            }
            column(GeneralManager_LocalPartPurchaseRegister; "General Manager")
            {
            }
            column(NameGM_LocalPartPurchaseRegister; "Name GM")
            {
            }
            column(HODsPartProcurementAppr_LocalPartPurchaseRegister; "HOD's Part Procurement Appr.")
            {
            }
            column(HODsPartApprName_LocalPartPurchaseRegister; "HOD's Part  Appr. Name")
            {
            }
            column(Compliancecheck_LocalPartPurchaseRegister; "Compliance check")
            {
            }
            column(ConfirmedBy_LocalPartPurchaseRegister; "Confirmed By")
            {
            }
            column(DateTime_LocalPartPurchaseRegister; DateTime)
            {
            }
            column(TimeDate1_LocalPartPurchaseRegister; TimeDate1)
            {
            }
            column(TimeDate2_LocalPartPurchaseRegister; TimeDate2)
            {
            }
            column(TimeDate3_LocalPartPurchaseRegister; TimeDate3)
            {
            }
            column(TimeDate4_LocalPartPurchaseRegister; TimeDate4)
            {
            }
            column(TimeDate5_LocalPartPurchaseRegister; TimeDate5)
            {
            }
            column(TimeDate6_LocalPartPurchaseRegister; TimeDate6)
            {
            }
            column(HODVisible_LocalPartPurchaseRegister; HODVisible)
            {
            }
            column(GMVisible_LocalPartPurchaseRegister; GMVisible)
            {
            }
            column(MDVisible_LocalPartPurchaseRegister; MDVisible)
            {
            }
            column(SendEditable_LocalPartPurchaseRegister; SendEditable)
            {
            }
            column(HoDPartApproval_LocalPartPurchaseRegister; HoDPartApproval)
            {
            }
            column(HoDAuditApproval_LocalPartPurchaseRegister; HoDAuditApproval)
            {
            }
            column(ComplianceCheck1_LocalPartPurchaseRegister; ComplianceCheck)
            {
            }
            column(ProcurementApproval_LocalPartPurchaseRegister; "Procurement Approval")
            {
            }
            column(GenaratePayment_LocalPartPurchaseRegister; GenaratePayment)
            {
            }
            column(GenarateLPO_LocalPartPurchaseRegister; "Genarate LPO")
            {
            }
            column(Float_LocalPartPurchaseRegister; Float)
            {
            }
            column(ProcurementApproved_LocalPartPurchaseRegister; "Procurement Approved")
            {
            }
            column(Closed_LocalPartPurchaseRegister; Closed)
            {
            }
            column(TimeDate7_LocalPartPurchaseRegister; TimeDate7)
            {
            }
            column(HODPayment_LocalPartPurchaseRegister; "HOD Payment")
            {
            }
            column(NameHODPayment_LocalPartPurchaseRegister; "Name HOD Payment")
            {
            }
            column(VoucherRaised_LocalPartPurchaseRegister; "Voucher Raised")
            {
            }
            column(GMApproval_LocalPartPurchaseRegister; "GM Approval")
            {
            }
            column(MDApproval_LocalPartPurchaseRegister; "MD Approval")
            {
            }
            column(OrderType_LocalPartPurchaseRegister; "Order Type")
            {
            }
            column(Rejected_LocalPartPurchaseRegister; Rejected)
            {
            }
            column(TCOFNo_LocalPartPurchaseRegister; "TCOF No.")
            {
            }
            column(RFQNo_LocalPartPurchaseRegister; "RFQ No.")
            {
            }
            column(SuppliersCode_LocalPartPurchaseRegister; "Suppliers Code")
            {
            }
            dataitem(DataItem75; "LPP Line")
            {
                DataItemLink = "Document No." = FIELD("LPP No.");
                column(QuantityAvailable2_LPPLine; "Quantity Available")
                {
                }
                column(LineNo_LPPLine; "Line No")
                {
                }
                column(DocumentNo_LPPLine; "Document No.")
                {
                }
                column(OrderType_LPPLine; "Order Type")
                {
                }
                column(ItemNo_LPPLine; "Item No")
                {
                }
                column(ItemName_LPPLine; "Item Name")
                {
                }
                column(Quantity_LPPLine; Quantity)
                {
                }
                column(UnitCost_LPPLine; "Unit Cost")
                {
                }
                column(Amount_LPPLine; Amount)
                {
                }
                column(IncomingDocumentEntryNo_LPPLine; "Incoming Document Entry No.")
                {
                }
                column(Preferred_LPPLine; Preferred)
                {
                }
                column(Authorisation_LPPLine; Authorisation)
                {
                }
                column(TotalLineItem_LPPLine; "Total Line Item")
                {
                }
                column(TotalUnit_LPPLine; "Total Unit")
                {
                }
                column(TotalAmount_LPPLine; "Total Amount")
                {
                }
                column(Description_LPPLine; Description)
                {
                }
                column(QuantityAvailable_LPPLine; "Quantity Available")
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
}

