report 50312 "Job Instruction"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/JobInstruction.rdl';

    dataset
    {
        dataitem(DataItem7672; "Customer Order Table.")
        {
            DataItemTableView = SORTING("Customer Order Form No.");
            RequestFilterFields = "Customer Order Form No.";
            column(Customer_Order_Table___Customer_Order_Form_No__; "Customer Order Form No.")
            {
            }
            column(ReceptionDate_CustomerOrderTable; "Reception Date")
            {
            }
            column(ReceptionTime_CustomerOrderTable; "Reception Time")
            {
            }
            column(ReceptionType_CustomerOrderTable; "Reception Type")
            {
            }
            column(CourtesyVehicle_CustomerOrderTable; "Courtesy Vehicle")
            {
            }
            column(DeliveryType_CustomerOrderTable; "Delivery Type")
            {
            }
            column(CustomerNo_CustomerOrderTable; "Customer No.")
            {
            }
            column(CustomerName_CustomerOrderTable; "Customer Name")
            {
            }
            column(Address_CustomerOrderTable; Address)
            {
            }
            column(TelephoneNo_CustomerOrderTable; "Telephone No.")
            {
            }
            column(Address2_CustomerOrderTable; Address2)
            {
            }
            column(CustomerOrderFormDate_CustomerOrderTable; "Customer Order Form Date")
            {
            }
            column(ConfirmationDate_CustomerOrderTable; "Confirmation Date")
            {
            }
            column(ConfirmationTime_CustomerOrderTable; "Confirmation Time")
            {
            }
            column(ConfirmationStaffName_CustomerOrderTable; "Confirmation Staff Name")
            {
            }
            column(PartsOrderedDate_CustomerOrderTable; "Parts Ordered Date")
            {
            }
            column(PartsOrderedTime_CustomerOrderTable; "Parts Ordered Time")
            {
            }
            column(PartsOrderedStaffName_CustomerOrderTable; "Parts Ordered Staff Name")
            {
            }
            column(PartsArrivedDate_CustomerOrderTable; "Parts Arrived Date")
            {
            }
            column(PartsArrivedTime_CustomerOrderTable; "Parts Arrived Time")
            {
            }
            column(PartsArrivedStaffName_CustomerOrderTable; "Parts Arrived Staff Name")
            {
            }
            column(ModelNo_CustomerOrderTable; "Model No")
            {
            }
            column(ModelName_CustomerOrderTable; "Model Name")
            {
            }
            column(VehicleRegistrationNo_CustomerOrderTable; "Vehicle Registration No.")
            {
            }
            column(ContactTelephoneNo_CustomerOrderTable; "Contact Telephone No.")
            {
            }
            column(ContactTelephoneNoType_CustomerOrderTable; "Contact Telephone No. Type")
            {
            }
            column(AvailableTimeFrom_CustomerOrderTable; "Available Time From")
            {
            }
            column(AvailableTimeTo_CustomerOrderTable; "Available Time To")
            {
            }
            column(VehicleDrivenBy_CustomerOrderTable; "Vehicle Driven By")
            {
            }
            column(VehicleDrivenByType_CustomerOrderTable; "Vehicle Driven By Type")
            {
            }
            column(IfOtherType_CustomerOrderTable; "If Other Type")
            {
            }
            column(OdometerReadingAtAppointmen_CustomerOrderTable; "Odometer Reading At Appointmen")
            {
            }
            column(VehicleRegisteredDate_CustomerOrderTable; "Vehicle Registered Date")
            {
            }
            column(FrameNoVIN_CustomerOrderTable; "Frame No./VIN")
            {
            }
            column(EngineNo_CustomerOrderTable; "(Engine No)")
            {
            }
            column(Email_CustomerOrderTable; "E-mail")
            {
            }
            column(CurrentServiceDueDate_CustomerOrderTable; "Current Service Due Date")
            {
            }
            column(CurrentServiceKilometre_CustomerOrderTable; "Current Service Kilometre")
            {
            }
            column(JobType_CustomerOrderTable; "Job Type")
            {
            }
            column(OdometerReading_CustomerOrderTable; "Odometer Reading")
            {
            }
            column(ServiceHistory_CustomerOrderTable; "Service History")
            {
            }
            column(SSCSCInformation_CustomerOrderTable; "SSC/SC Information")
            {
            }
            column(CustomersRequests_CustomerOrderTable; "Customer's Requests")
            {
            }
            column(Maintenance_CustomerOrderTable; Maintenance)
            {
            }
            column(GeneralRepair_CustomerOrderTable; "General Repair")
            {
            }
            column(Internal_CustomerOrderTable; Internal)
            {
            }
            column(Warranty_CustomerOrderTable; Warranty)
            {
            }
            column(CustomerWaiting_CustomerOrderTable; "Customer Waiting")
            {
            }
            column(RepeatRepair_CustomerOrderTable; "Repeat Repair")
            {
            }
            column(JobDetails_CustomerOrderTable; "Job Details")
            {
            }
            column(AppointmentDate_CustomerOrderTable; "Appointment Date")
            {
            }
            column(AppointmentTime_CustomerOrderTable; "Appointment Time")
            {
            }
            column(AppointmentStaffName_CustomerOrderTable; "Appointment Staff Name")
            {
            }
            column(EstimatedJobTime_CustomerOrderTable; "Estimated Job Time")
            {
            }
            column(TimeChanged_CustomerOrderTable; "Time Changed")
            {
            }
            column(ModelYear_CustomerOrderTable; "Model Year")
            {
            }
            column(CostChanged_CustomerOrderTable; "Cost Changed")
            {
            }
            column(AppointmentOffering1Date_CustomerOrderTable; "Appointment Offering 1 Date")
            {
            }
            column(AppointmentOffering1Time_CustomerOrderTable; "Appointment Offering 1 Time")
            {
            }
            column(AppointmentOffering2Date_CustomerOrderTable; "Appointment Offering 2 Date")
            {
            }
            column(AppointmentOffering2Time_CustomerOrderTable; "Appointment Offering 2 Time")
            {
            }
            column(Quantity1_CustomerOrderTable; Quantity1)
            {
            }
            column(Quantity2_CustomerOrderTable; Quantity2)
            {
            }
            column(Stock1_CustomerOrderTable; Stock1)
            {
            }
            column(Stock2_CustomerOrderTable; Stock2)
            {
            }
            column(ETA1_CustomerOrderTable; ETA1)
            {
            }
            column(ETA2_CustomerOrderTable; ETA2)
            {
            }
            column(WalkAroundCheck_CustomerOrderTable; "Walk Around Check")
            {
            }
            column(AdditionalJobConfirmation_CustomerOrderTable; "Additional Job Confirmation")
            {
            }
            column(CarWash_CustomerOrderTable; "Car Wash")
            {
            }
            column(Valuables_CustomerOrderTable; Valuables)
            {
            }
            column(PresentEstimatewExplanation_CustomerOrderTable; "Present Estimate w/Explanation")
            {
            }
            column(Memo_CustomerOrderTable; Memo)
            {
            }
            column(CourtesyItems_CustomerOrderTable; "Courtesy Items")
            {
            }
            column(PaymentMethod_CustomerOrderTable; "Payment Method")
            {
            }
            column(IfOtherMethod_CustomerOrderTable; "If Other Method")
            {
            }
            column(OdometerReadingAtReception_CustomerOrderTable; "Odometer Reading At Reception")
            {
            }
            column(WalkAroundReceptionDate_CustomerOrderTable; "Walk Around Reception Date")
            {
            }
            column(WalkAroundReceptionTime_CustomerOrderTable; "Walk Around Reception Time")
            {
            }
            column(ReceptionStaffName_CustomerOrderTable; "Reception Staff Name")
            {
            }
            column(CustomerSignature_CustomerOrderTable; "Customer Signature")
            {
            }
            column(ExpectedDeliveryDate_CustomerOrderTable; "Expected Delivery Date")
            {
            }
            column(ExpectedDeliveryTime_CustomerOrderTable; "Expected Delivery Time")
            {
            }
            column(IfOtherCustomersRequests_CustomerOrderTable; "If Other Customer's Requests")
            {
            }
            column(Estimation_CustomerOrderTable; Estimation)
            {
            }
            column(ReplacePartsKeep_CustomerOrderTable; "Replace Parts Keep")
            {
            }
            column(NoSeries_CustomerOrderTable; "No. Series")
            {
            }
            column(Maintenance2_CustomerOrderTable; Maintenance2)
            {
            }
            column(CustomerName2_CustomerOrderTable; "Customer Name2")
            {
            }
            column(CustomerAddress_CustomerOrderTable; "Customer Address")
            {
            }
            column(CustomerAddress2_CustomerOrderTable; "Customer Address2")
            {
            }
            column(CustomerTelephoneNo_CustomerOrderTable; "Customer Telephone No.")
            {
            }
            column(ModelName2_CustomerOrderTable; "Model Name2")
            {
            }
            column(VehicleRegistrationNo2_CustomerOrderTable; "Vehicle Registration No.2")
            {
            }
            column(UpdateCustomerRecord_CustomerOrderTable; "Update Customer Record")
            {
            }
            column(SeatCover_CustomerOrderTable; "Seat Cover")
            {
            }
            column(FloorMat_CustomerOrderTable; "Floor Mat")
            {
            }
            column(JobNo1_CustomerOrderTable; "Job No.1")
            {
            }
            column(JobNo2_CustomerOrderTable; "Job No.2")
            {
            }
            column(JobNo3_CustomerOrderTable; "Job No.3")
            {
            }
            column(Odometer1_CustomerOrderTable; Odometer1)
            {
            }
            column(Odometer2_CustomerOrderTable; Odometer2)
            {
            }
            column(Odometer3_CustomerOrderTable; Odometer3)
            {
            }
            column(Date1_CustomerOrderTable; Date1)
            {
            }
            column(Date2_CustomerOrderTable; Date2)
            {
            }
            column(Date3_CustomerOrderTable; Date3)
            {
            }
            column(ItemNo_CustomerOrderTable; "Item No.")
            {
            }
            column(Description_CustomerOrderTable; Description)
            {
            }
            column(Quantity_CustomerOrderTable; Quantity)
            {
            }
            column(Stock_CustomerOrderTable; Stock)
            {
            }
            column(EDA_CustomerOrderTable; EDA)
            {
            }
            column(Cheque_CustomerOrderTable; Cheque)
            {
            }
            column(Cash_CustomerOrderTable; Cash)
            {
            }
            column(JobDescription1_CustomerOrderTable; "Job Description1")
            {
            }
            column(JobDescription2_CustomerOrderTable; "Job Description2")
            {
            }
            column(JobDescription3_CustomerOrderTable; "Job Description3")
            {
            }
            column(Maintenance1_CustomerOrderTable; Maintenance1)
            {
            }
            column(JobTypeDescription_CustomerOrderTable; "Job Type Description")
            {
            }
            column(ContactHome_CustomerOrderTable; "Contact Home")
            {
            }
            column(ContactBusiness_CustomerOrderTable; "Contact Business")
            {
            }
            column(ContactMobile_CustomerOrderTable; "Contact Mobile")
            {
            }
            column(Home_CustomerOrderTable; Home)
            {
            }
            column(Business_CustomerOrderTable; Business)
            {
            }
            column(Mobile_CustomerOrderTable; Mobile)
            {
            }
            column(EstimateNo_CustomerOrderTable; "Estimate No.")
            {
            }
            column(TotalEstimation_CustomerOrderTable; "Total Estimation")
            {
            }
            column(LocationCode_CustomerOrderTable; "Location Code")
            {
            }
            column(FeedingLocation_CustomerOrderTable; "Feeding Location")
            {
            }
            column(EstimateFactor_CustomerOrderTable; "Estimate Factor")
            {
            }
            column(AddJobsEstimation_CustomerOrderTable; "Add. Jobs Estimation")
            {
            }
            column(Total_CustomerOrderTable; Total)
            {
            }
            column(ServiceLocation_CustomerOrderTable; "Service Location")
            {
            }
            column(CustomerType_CustomerOrderTable; "Customer Type")
            {
            }
            column(Other_CustomerOrderTable; Other)
            {
            }
            column(IfOtherDeliveryType_CustomerOrderTable; "If Other Delivery Type")
            {
            }
            column(JobInstructionNo_CustomerOrderTable; "Job Instruction No.")
            {
            }
            column(JobInstructionDate_CustomerOrderTable; "Job Instruction Date")
            {
            }
            column(EstimatedCompletionDate_CustomerOrderTable; "Estimated Completion Date")
            {
            }
            column(EstimatedCompletionTime_CustomerOrderTable; "Estimated Completion Time")
            {
            }
            column(KeyAssignedNo_CustomerOrderTable; "Key Assigned No.")
            {
            }
            column(StallNo_CustomerOrderTable; "Stall No.")
            {
            }
            column(JobStartDate_CustomerOrderTable; "Job Start Date")
            {
            }
            column(JobStartTime_CustomerOrderTable; "Job Start Time")
            {
            }
            column(CompletionChangedDate_CustomerOrderTable; "Completion Changed Date")
            {
            }
            column(CompletionChangedTime_CustomerOrderTable; "Completion Changed Time")
            {
            }
            column(DeliveryChangedDate_CustomerOrderTable; "Delivery Changed Date")
            {
            }
            column(DeliveryChangedTime_CustomerOrderTable; "Delivery Changed Time")
            {
            }
            column(CCDate_CustomerOrderTable; "CC Date")
            {
            }
            column(CCTime_CustomerOrderTable; "CC Time")
            {
            }
            column(CCStaffName_CustomerOrderTable; "CC Staff Name")
            {
            }
            column(JCDate_CustomerOrderTable; "JC Date")
            {
            }
            column(JCTime_CustomerOrderTable; "JC Time")
            {
            }
            column(ActualHoursClocked_CustomerOrderTable; "Actual Hours Clocked")
            {
            }
            column(OtherFindingsAdvice_CustomerOrderTable; "Other Findings/Advice")
            {
            }
            column(QCStaff_CustomerOrderTable; "QC Staff")
            {
            }
            column(PredCStaffName_CustomerOrderTable; "Pre-d C Staff Name")
            {
            }
            column(PredCConfirmedby_CustomerOrderTable; "Pre-d C Confirmed by")
            {
            }
            column(Cleanliness_CustomerOrderTable; Cleanliness)
            {
            }
            column(CleanlinessType_CustomerOrderTable; "Cleanliness Type")
            {
            }
            column(Cleanliness2_CustomerOrderTable; Cleanliness2)
            {
            }
            column(CourtesyItemsRemoval_CustomerOrderTable; "Courtesy Items Removal")
            {
            }
            column(CourtesyItemsRemoval2_CustomerOrderTable; "Courtesy Items Removal2")
            {
            }
            column(OuterMinorPSeatP_CustomerOrderTable; "Outer Minor P / Seat P")
            {
            }
            column(OuterMinorPSeatP2_CustomerOrderTable; "Outer Minor P / Seat P2")
            {
            }
            column(ClockAdjRadioSetting_CustomerOrderTable; "Clock Adj / Radio Setting")
            {
            }
            column(ClockAdjRadioSetting2_CustomerOrderTable; "Clock Adj / Radio Setting2")
            {
            }
            column(JobCNDate_CustomerOrderTable; "Job CN Date")
            {
            }
            column(JobCNTime_CustomerOrderTable; "Job CN Time")
            {
            }
            column(JobCNStaffName_CustomerOrderTable; "Job CN Staff Name")
            {
            }
            column(JobDetailsExplanation_CustomerOrderTable; "Job Details Explanation")
            {
            }
            column(FeeExplanation_CustomerOrderTable; "Fee Explanation")
            {
            }
            column(ResultsConfirmationwCust_CustomerOrderTable; "Results Confirmation w / Cust.")
            {
            }
            column(PSFUPlan_CustomerOrderTable; "P.S.F.U. (Plan)")
            {
            }
            column(Levelup_CustomerOrderTable; "Level-up")
            {
            }
            column(JREStaffCode_CustomerOrderTable; "JRE Staff Code")
            {
            }
            column(ActualDeliveryDate_CustomerOrderTable; "Actual Delivery Date")
            {
            }
            column(ActualDeliveryTime_CustomerOrderTable; "Actual Delivery Time")
            {
            }
            column(DeliveryCustomer_CustomerOrderTable; "Delivery Customer")
            {
            }
            column(IfOtherCustomer_CustomerOrderTable; "If Other Customer")
            {
            }
            column(DeliveryStaffName_CustomerOrderTable; "Delivery Staff Name")
            {
            }
            column(PSFUStaffName_CustomerOrderTable; "P.S.F.U. Staff Name")
            {
            }
            column(PSFUConfirmedby_CustomerOrderTable; "P.S.F.U. Confirmed by")
            {
            }
            column(JobType2_CustomerOrderTable; "Job Type2")
            {
            }
            column(PartsDesciption_CustomerOrderTable; "Parts Desciption")
            {
            }
            column(JobCategory_CustomerOrderTable; "Job Category")
            {
            }
            column(IfOtherJobCategory_CustomerOrderTable; "If Other Job Category")
            {
            }
            column(Fixed_CustomerOrderTable; Fixed)
            {
            }
            column(NoFixed_CustomerOrderTable; "No Fixed")
            {
            }
            column(PSFUPlanDate_CustomerOrderTable; "P.S.F.U. (Plan) Date")
            {
            }
            column(PSFUPlanTime_CustomerOrderTable; "P.S.F.U. (Plan) Time")
            {
            }
            column(PSFUOther_CustomerOrderTable; "P.S.F.U Other")
            {
            }
            column(PSFUActualDate_CustomerOrderTable; "P.S.F.U. (Actual) Date")
            {
            }
            column(PSFUActualTime_CustomerOrderTable; "P.S.F.U. (Actual) Time")
            {
            }
            column(CTHome_CustomerOrderTable; "CT Home")
            {
            }
            column(CTMobile_CustomerOrderTable; "CT Mobile")
            {
            }
            column(CTBusiness_CustomerOrderTable; "CT Business")
            {
            }
            column(ContactTelephone_CustomerOrderTable; "Contact Telephone")
            {
            }
            column(JIEmail_CustomerOrderTable; "JI E-mail")
            {
            }
            column(JIOther_CustomerOrderTable; "JI Other")
            {
            }
            column(JIOtherII_CustomerOrderTable; "JI Other II")
            {
            }
            column(JIEMail2_CustomerOrderTable; "JI EMail2")
            {
            }
            column(ServiceType_CustomerOrderTable; "Service Type")
            {
            }
            column(OtherPaymentType_CustomerOrderTable; "Other Payment Type")
            {
            }
            column(ReceptionDate2_CustomerOrderTable; "Reception Date2")
            {
            }
            column(ReceptionTime2_CustomerOrderTable; "Reception Time2")
            {
            }
            column(CustomerIntentionJobDetails_CustomerOrderTable; "Customer Intention/Job Details")
            {
            }
            column(CustomerandVehicleInfo_CustomerOrderTable; "Customer and Vehicle Info")
            {
            }
            column(Score_CustomerOrderTable; Score)
            {
            }
            column(AdjustVehReceptionDateTime_CustomerOrderTable; "Adjust Veh Reception DateTime")
            {
            }
            column(ConfirmContactInfoDriver_CustomerOrderTable; "Confirm Contact Info/Driver")
            {
            }
            column(EnterRecptnAppntmtDateTime_CustomerOrderTable; "Enter Recptn Appntmt DateTime")
            {
            }
            column(PrintCustomerandVehInfo_CustomerOrderTable; "Print Customer and Veh. Info")
            {
            }
            column(PrintEstimateI_CustomerOrderTable; "Print Estimate I")
            {
            }
            column(PartsReqCompletionDateTime_CustomerOrderTable; "Parts Req./Completion DateTime")
            {
            }
            column(RecptnConfirmPaymentMethod_CustomerOrderTable; "Recptn Confirm/Payment Method")
            {
            }
            column(PartsOrderingCompletionDate_CustomerOrderTable; "Parts Ordering/Completion Date")
            {
            }
            column(PreparationStatusPartsReq_CustomerOrderTable; "Preparation Status Parts Req.")
            {
            }
            column(ConfirmandEnterOdometer_CustomerOrderTable; "Confirm and Enter Odometer")
            {
            }
            column(ConductEntrerWalkaroundChec_CustomerOrderTable; "Conduct/Entrer Walkaround Chec")
            {
            }
            column(AddJobValuabesCourtesyIt_CustomerOrderTable; "Add Job, Valuabes/ Courtesy It")
            {
            }
            column(PresentEstimateIandXplain_CustomerOrderTable; "Present Estimate I and Xplain")
            {
            }
            column(EnterVehDeliveryDateTime_CustomerOrderTable; "Enter Veh Delivery DateTime")
            {
            }
            column(ReconfirmPaymentMethod_CustomerOrderTable; "Reconfirm Payment Method")
            {
            }
            column(ConfirmifCarwashisneeded_CustomerOrderTable; "Confirm if Car wash is needed")
            {
            }
            column(NecessityofreturninReplPar_CustomerOrderTable; "Necessity of returnin Repl Par")
            {
            }
            column(RecptnDetlCompletioDateTime_CustomerOrderTable; "Recptn Detl/Completio DateTime")
            {
            }
            column(ObtainCustomerSignature_CustomerOrderTable; "Obtain Customer Signature")
            {
            }
            column(TechnicianName_CustomerOrderTable; "Technician Name")
            {
            }
            column(Delivered_CustomerOrderTable; Delivered)
            {
            }
            column(ServiceAdvisor_CustomerOrderTable; "Service Advisor")
            {
            }
            column(CreateServiceOrder_CustomerOrderTable; "Create Service Order")
            {
            }
            column(ServiceOrderNo_CustomerOrderTable; "Service Order No.")
            {
            }
            column(PostServiceInvoice_CustomerOrderTable; "Post Service Invoice")
            {
            }
            column(Teams_CustomerOrderTable; Teams)
            {
            }
            column(Status_CustomerOrderTable; Status)
            {
            }
            column(JobOpened_CustomerOrderTable; "Job Opened")
            {
            }
            column(ServiceAdvisorsName_CustomerOrderTable; "Service Advisor's Name")
            {
            }
            column(Estimate_CustomerOrderTable; Estimate)
            {
            }
            column(AdditionalJobDetails_CustomerOrderTable; "Additional Job Details")
            {
            }
            column(NextJobType_CustomerOrderTable; "Next Job Type")
            {
            }
            column(NextServiceDate_CustomerOrderTable; "Next Service Date")
            {
            }
            column(Technician_CustomerOrderTable; Technician)
            {
            }
            column(QualityControlStaffCode_CustomerOrderTable; "Quality Control Staff Code")
            {
            }
            column(JobProgress_CustomerOrderTable; "Job Progress")
            {
            }
            column(JREStaffName_CustomerOrderTable; "JRE Staff Name")
            {
            }
            column(TotalAppointmentTime_CustomerOrderTable; "Total Appointment Time")
            {
            }
            column(TotalRemApptTime_CustomerOrderTable; "Total Rem Appt Time")
            {
            }
            column(TotalWalkinTime_CustomerOrderTable; "Total Walk in Time")
            {
            }
            column(TotalRemWITime_CustomerOrderTable; "Total Rem W/I Time")
            {
            }
            column(CustomerComplaint_CustomerOrderTable; "Customer Complaint")
            {
            }
            column(ServiceDuration_CustomerOrderTable; "Service Duration")
            {
            }
            column(DiagEst_CustomerOrderTable; "Diag/Est")
            {
            }
            column(BP_CustomerOrderTable; "B & P")
            {
            }
            column(PriorityClass_CustomerOrderTable; "Priority Class")
            {
            }
            column(Memo2_CustomerOrderTable; Memo2)
            {
            }
            column(Rescheduling_CustomerOrderTable; Rescheduling)
            {
            }
            column(NewCustomer_CustomerOrderTable; "New Customer")
            {
            }
            column(ForDeliveryPreparation_CustomerOrderTable; "For Delivery Preparation")
            {
            }
            column(ForInvoice_CustomerOrderTable; "For Invoice")
            {
            }
            column(ApptConfirmed_CustomerOrderTable; "Appt Confirmed")
            {
            }
            column(ForPartOrder_CustomerOrderTable; "For Part Order")
            {
            }
            column(ForPartArrival_CustomerOrderTable; "For Part Arrival")
            {
            }
            column(ForReception_CustomerOrderTable; "For Reception")
            {
            }
            column(ForProduction_CustomerOrderTable; "For Production")
            {
            }
            column(ForQualityControl_CustomerOrderTable; "For Quality Control")
            {
            }
            column(ForPayment_CustomerOrderTable; "For Payment")
            {
            }
            column(TransfertoTA_CustomerOrderTable; "Transfer to TA")
            {
            }
            column(TACode_CustomerOrderTable; "TA Code")
            {
            }
            column(TAName_CustomerOrderTable; "TA Name")
            {
            }
            column(ShortcutDimension1Code_CustomerOrderTable; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_CustomerOrderTable; "Shortcut Dimension 2 Code")
            {
            }
            column(RequestBatchName_CustomerOrderTable; "Request Batch Name")
            {
            }
            column(PartsArrived_CustomerOrderTable; "Parts Arrived")
            {
            }
            column(ForApptConfirmation_CustomerOrderTable; "For Appt Confirmation")
            {
            }
            column(SSCAvailable_CustomerOrderTable; "SSC Available")
            {
            }
            column(DateDiff_CustomerOrderTable; DateDiff)
            {
            }
            column(OrderLineUpdated_CustomerOrderTable; "Order Line Updated")
            {
            }
            column(EstReqBatchName_CustomerOrderTable; "Est. Req. Batch Name")
            {
            }
            column(FANo_CustomerOrderTable; "FA No.")
            {
            }
            column(LabourEstimate_CustomerOrderTable; "Labour Estimate")
            {
            }
            column(ItemEstimate_CustomerOrderTable; "Item Estimate")
            {
            }
            column(DateDelivered_CustomerOrderTable; "Date Delivered")
            {
            }
            column(TimeDelivered_CustomerOrderTable; "Time Delivered")
            {
            }
            column(VDS_CustomerOrderTable; VDS)
            {
            }
            column(VIS_CustomerOrderTable; VIS)
            {
            }
            column(VMI_CustomerOrderTable; VMI)
            {
            }
            column(CustomerOrderFormType_CustomerOrderTable; "Customer Order Form Type")
            {
            }
            column(ServiceReqCode_CustomerOrderTable; "Service Req. Code")
            {
            }
            column(VRIEstimateApproved_CustomerOrderTable; "VRI Estimate Approved")
            {
            }
            column(COFOrigin_CustomerOrderTable; "COF Origin")
            {
            }
            column(FuelLevel_CustomerOrderTable; "Fuel Level")
            {
            }
            column(NoVAT_CustomerOrderTable; "No VAT")
            {
            }
            dataitem(DataItem6850; "Customer Order Line")
            {
                DataItemLink = "Customer Order Form No." = FIELD("Customer Order Form No.");
                column(Customer_Order_Line__No__; "No.")
                {
                }
                column(Customer_Order_Line_Description; Description)
                {
                }
                column(Customer_Order_Line_Quantity; Quantity)
                {
                }
                column(Customer_Order_Line__Unit_Price_; "Unit Price")
                {
                }
                column(Customer_Order_Line_Amount; Amount)
                {
                }
                column(Customer_Order_Line_Results; Results)
                {
                }
                column(Customer_Order_Line_Stock; Stock)
                {
                }
                column(Customer_Order_Line_EDA; EDA)
                {
                }
                column(Customer_Order_Line__Additional_Jobs_; "Additional Jobs")
                {
                }
                column(Customer_Order_Line__No__Caption; FIELDCAPTION("No."))
                {
                }
                column(Customer_Order_Line_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Customer_Order_Line_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Customer_Order_Line__Unit_Price_Caption; FIELDCAPTION("Unit Price"))
                {
                }
                column(Customer_Order_Line_AmountCaption; FIELDCAPTION(Amount))
                {
                }
                column(Customer_Order_Line_ResultsCaption; FIELDCAPTION(Results))
                {
                }
                column(Customer_Order_Line_StockCaption; FIELDCAPTION(Stock))
                {
                }
                column(Customer_Order_Line_EDACaption; FIELDCAPTION(EDA))
                {
                }
                column(Additional_JobCaption; Additional_JobCaptionLbl)
                {
                }
                column(Customer_Order_Line_Customer_Order_Form_No_; "Customer Order Form No.")
                {
                }
                column(Customer_Order_Line_Line_No_; "Line No.")
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
        CustomerOrderLine: Record 50122;
        JOB_INSTRUCTIONCaptionLbl: Label 'JOB INSTRUCTION ';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DateCaptionLbl: Label 'Date';
        Odometer_ReadingCaptionLbl: Label 'Odometer Reading';
        DateCaption_Control1000000135Lbl: Label 'Date';
        Estimated_CompletionCaptionLbl: Label 'Estimated Completion';
        DeliveryCaptionLbl: Label 'Delivery';
        DateCaption_Control1000000161Lbl: Label 'Date';
        TimeCaptionLbl: Label 'Time';
        Staff_NameCaptionLbl: Label 'Staff Name';
        Customer_ContactCaptionLbl: Label 'Customer Contact';
        DateCaption_Control1000000096Lbl: Label 'Date';
        TimeCaption_Control1000000105Lbl: Label 'Time';
        DateCaption_Control1000000107Lbl: Label 'Date';
        TimeCaption_Control1000000109Lbl: Label 'Time';
        Completion_ChangedCaptionLbl: Label 'Completion Changed';
        Delivery_ChangedCaptionLbl: Label 'Delivery Changed';
        DateCaption_Control1000000141Lbl: Label 'Date';
        TimeCaption_Control1000000143Lbl: Label 'Time';
        DateCaption_Control1000000145Lbl: Label 'Date';
        TimeCaption_Control1000000147Lbl: Label 'Time';
        Job_TimeCaptionLbl: Label 'Job Time';
        Job_StartCaptionLbl: Label 'Job Start';
        Quality_Control_Staff_NameCaptionLbl: Label 'Quality Control Staff Name';
        Job_CompletionCaptionLbl: Label 'Job Completion';
        Staff_NameCaption_Control1000000210Lbl: Label 'Staff Name';
        Confirmed_byCaptionLbl: Label 'Confirmed by';
        Pre_delivery_ConfirmationCaptionLbl: Label 'Pre-delivery Confirmation';
        DateCaption_Control1000000217Lbl: Label 'Date';
        TimeCaption_Control1000000219Lbl: Label 'Time';
        Job_Completion_NotificationCaptionLbl: Label 'Job Completion Notification';
        Staff_NameCaption_Control1000000222Lbl: Label 'Staff Name';
        Job_Results_ExplanationCaptionLbl: Label 'Job Results Explanation';
        Staff_NameCaption_Control1000000252Lbl: Label 'Staff Name';
        DateCaption_Control1000000182Lbl: Label 'Date';
        TimeCaption_Control1000000188Lbl: Label 'Time';
        P_S_F_U___Plan_CaptionLbl: Label 'P.S.F.U. (Plan)';
        Contact_InfoCaptionLbl: Label 'Contact Info';
        HomeCaptionLbl: Label 'Home';
        MobileCaptionLbl: Label 'Mobile';
        BusinessCaptionLbl: Label 'Business';
        E_mailCaptionLbl: Label 'E-mail';
        OtherCaptionLbl: Label 'Other';
        PhoneCaptionLbl: Label 'Phone';
        DateCaption_Control1000000283Lbl: Label 'Date';
        TimeCaption_Control1000000285Lbl: Label 'Time';
        P_S_F_U___Actual_CaptionLbl: Label 'P.S.F.U. (Actual)';
        Vehicle_DeliveredCaptionLbl: Label 'Vehicle Delivered';
        DateCaption_Control1000000092Lbl: Label 'Date';
        TimeCaption_Control1000000170Lbl: Label 'Time';
        CustomerCaptionLbl: Label 'Customer';
        Staff_NameCaption_Control1000000180Lbl: Label 'Staff Name';
        CUSTLbl: Label 'THE EXPLANATION AND QUALITY OF THE SERVICE AND OR REPAIR TO THIS VEHICLE WAS SATISFACTORILY CONFIRMED BY THE UNDERSIGNED CUSTOMER DURING VEHICLE DELIVERY.';
        NameCaptionLbl: Label 'Customer Name: ________________________________________________________________';
        SignatureCaptionLbl: Label 'Signature: _____________________________________________';
        Date___TimeCaptionLbl: Label 'Date / Time: ________________________________________';
        Additional_JobCaptionLbl: Label 'Additional Job';
}

