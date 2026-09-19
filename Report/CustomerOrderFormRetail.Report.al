report 50310 "Customer Order Form Retail"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerOrderFormRetail.rdl';

    dataset
    {
        dataitem(CustomerOderX; "Customer Order HeaderX")
        {
            column(CustomerOrderFormNo_CustomerOrderTable; "No.")
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
            column(Address2_CustomerOrderHeaderX; Address2)
            {
            }
            column(CustomerOrderFormDate_CustomerOrderTable; Date)
            {
            }
            column(ConfirmationDate_CustomerOrderTable; "Confirmation Date")
            {
            }
            column(ConfirmationTime_CustomerOrderTable; "Confirmation Time")
            {
            }
            column(ConfirmationStaffName_CustomerOrderTable; COPYSTR("Confirmation Staff Name", 15, 10))
            {
            }
            column(PartsOrderedDate_CustomerOrderTable; "Parts Ordered Date")
            {
            }
            column(PartsOrderedTime_CustomerOrderTable; "Parts Ordered Time")
            {
            }
            column(PartsOrderedStaffName_CustomerOrderTable; COPYSTR("Parts Ordered Staff Name", 15, 10))
            {
            }
            column(PartsArrivedDate_CustomerOrderTable; "Parts Arrived Date")
            {
            }
            column(PartsArrivedTime_CustomerOrderTable; "Parts Arrived Time")
            {
            }
            column(PartsArrivedStaffName_CustomerOrderTable; COPYSTR("Parts Arrived Staff Name", 15, 10))
            {
            }
            column(ModelNo_CustomerOrderTable; "Model No.")
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
            column(IfOtherType_CustomerOrderTable; "Completed Reason")
            {
            }
            column(OdometerReadingAtAppointmen_CustomerOrderTable; "Odometer At Appointment")
            {
            }
            column(VehicleRegisteredDate_CustomerOrderTable; "Vehicle Registered Date")
            {
            }
            column(TelephoneNo_CustomerOrderHeader; "Telephone No.")
            {
            }
            column(FrameNoVIN_CustomerOrderTable; "Frame No./VIN")
            {
            }
            column(EngineNo_CustomerOrderTable; "Engine No.")
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
            column(JobType_CustomerOrderTable; "Operation Code")
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
            column(CustomersRequests_CustomerOrderTable; Appointment)
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
            column(EstimatedJobTime; "Estimated Job Time")
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
            column(OdometerReadingAtReception_CustomerOrderTable; "Odometer At Reception")
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
            column(JobTypeDescription_CustomerOrderTable; "Operation Code Description")
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
            column(QCStaff_CustomerOrderTable; "QC Staff Code")
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
            column(Status_CustomerOrderTable; Status2)
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
            column(NextJobType_CustomerOrderTable; "Next Operation Code")
            {
            }
            column(NextServiceDate_CustomerOrderTable; "Next Service Date")
            {
            }
            column(Technician_CustomerOrderTable; Technician)
            {
            }
            column(QualityControlStaffCode_CustomerOrderTable; "QC Staff Name")
            {
            }
            column(JobProgress_CustomerOrderTable; "Job Progress")
            {
            }
            column(JREStaffName_CustomerOrderTable; "JRE Staff Name")
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
            column(CustomerOrderFormType_CustomerOrderTable; "Customer Order Type")
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
            column(TelephoneNo_CustomerOrderTable; "Telephone No.")
            {
            }
            column(Address2_CustomerOrderTable; Address2)
            {
            }
            dataitem(CustomerOrderLineX; "Customer Order LineX")
            {
                DataItemLink = "Document No."=FIELD("No.");
                column(CustomerOrderFormNo_CustomerOrderLine; "Document No.")
                {
                }
                column(No_CustomerOrderLine; "No.")
                {
                }
                column(Description_CustomerOrderLine; Description)
                {
                }
                column(Quantity_CustomerOrderLine; "Quantity Received")
                {
                }
                column(Stock_CustomerOrderLine; Stock)
                {
                }
                column(EDA_CustomerOrderLine; EDA)
                {
                }
                column(LineNo_CustomerOrderLine; "Line No.")
                {
                }
                column(OperationCode_CustomerOrderLine; "Operation Code")
                {
                }
                column(LineType_CustomerOrderLine; Type)
                {
                }
                column(AdditionalJobs_CustomerOrderLine; "Additional Jobs")
                {
                }
                column(UnitPrice_CustomerOrderLine; "Unit Price")
                {
                }
                column(Amount_CustomerOrderLine; Amount)
                {
                }
                column(EstimateFactor_CustomerOrderLine; "Estimate Factor")
                {
                }
                column(LocationCode_CustomerOrderLine; "Location Code")
                {
                }
                column(Variant_CustomerOrderLine; "Variant Code")
                {
                }
                column(AvailableQuantity_CustomerOrderLine; "Quantity Available")
                {
                }
                column(StockStatus_CustomerOrderLine; "Stock Status")
                {
                }
                column(FeedingLocation_CustomerOrderLine; "Feeding Location")
                {
                }
                column(Difference_CustomerOrderLine; Difference)
                {
                }
                column(Results_CustomerOrderLine; Results)
                {
                }
                column(UnitCost_CustomerOrderLine; "Unit Cost")
                {
                }
                column(CostAmount_CustomerOrderLine; "Cost Amount")
                {
                }
                column(VatAmount_CustomerOrderLine; "VAT Amount")
                {
                }
                column(AmountIncVAT_CustomerOrderLine; "Amount Inc. VAT")
                {
                }
                column(PartCollected_CustomerOrderLine; "Part Collected")
                {
                }
                column(ETA_CustomerOrderLine; ETA)
                {
                }
                column(DurationinHrs_CustomerOrderLine; "Duration in Hrs")
                {
                }
                column(DealerHourlyRate_CustomerOrderLine; "Dealer Hourly Rate")
                {
                }
                column(FlatRate_CustomerOrderLine; "Flat Rate")
                {
                }
                column(FRAmount_CustomerOrderLine; "FR Amount")
                {
                }
                column(FRVATAmount_CustomerOrderLine; "FR VAT Amount")
                {
                }
                column(FRAmountIncVAT_CustomerOrderLine; "FR Amount Inc VAT")
                {
                }
                column(Confirmed_CustomerOrderLine; Confirmed)
                {
                }
                column(Confirmedby_CustomerOrderLine; "Confirmed by")
                {
                }
                column(BinShelfNo_CustomerOrderLine; "Bin/Shelf No.")
                {
                }
                column(ModelNo_CustomerOrderLine; "Model No.")
                {
                }
                column(ModelDescription_CustomerOrderLine; "Model Description")
                {
                }
                column(JobType_CustomerOrderLine; "Job Type")
                {
                }
                column(PRRaised_CustomerOrderLine; "PR Raised")
                {
                }
                column(OnPartOrder_CustomerOrderLine; "On Part Order")
                {
                }
                column(CustomerClass_CustomerOrderLine; "Customer Class")
                {
                }
                column(ForSublet_CustomerOrderLine; "For Sublet")
                {
                }
                column(SubletOrderNo_CustomerOrderLine; "Sublet Order No.")
                {
                }
                column(SubletLineNo_CustomerOrderLine; "Sublet Line No.")
                {
                }
                column(Subletto_CustomerOrderLine; "Sublet To")
                {
                }
                column(SubletCode_CustomerOrderLine; "Sublet Code")
                {
                }
                column(UnitofMeasure_CustomerOrderLine; "Unit of Measure")
                {
                }
                column(SSCInfo; SSCInfo)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ServCamp.SETRANGE(VDS, VDS);
                ServCamp.SETRANGE(VMI, VMI);
                ServCamp.SETFILTER("Range From", '<=%1', VIS);
                ServCamp.SETFILTER("Range To", '>=%1', VIS);
                ServCamp.SETFILTER("SSC/SC Date From", '<=%1', TODAY);
                ServCamp.SETFILTER("SSC/SC Date To", '>=%1', TODAY);
                ServCamp.SETRANGE("SCSC Status", ServCamp."SCSC Status"::Active);
                ServCamp.SETRANGE(Applied, FALSE);
                IF ServCamp.FINDFIRST THEN
                    SSCInfo := 'Applicable'
                ELSE
                    SSCInfo := 'Not Applicable';
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
        SSCInfo: Text[30];
        ServCamp: Record 50046;
}

