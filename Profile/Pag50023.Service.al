page 50023 "Service"
{
    Caption = 'Service';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control104; "Headline RC Serv. Dispatcher")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1901851508; "VRI Activities")
            {
                ApplicationArea = All;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control14; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control1907692008; "My Customers")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1; "Trailing Sales Orders Chart")
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Control4; "My Job Queue")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1905989608; "My Items")
            {
                AccessByPermission = TableData "My Item" = R;
                ApplicationArea = Basic, Suite;
            }
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control21; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = R;
                ApplicationArea = Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(embedding)
        {
            ToolTip = 'Manage payslip, sales processes, view KPIs, and access your favorite items and customers.';
            action(MyPaySlips)
            {
                ApplicationArea = CostAccounting;
                Caption = 'My Payslips';
                RunObject = Page "My payslip";
                ToolTip = '';
            }
            action(VRIList)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vehicle Receipt Inspection';
                Image = "Order";
                RunObject = Page "VRI List";
            }
            action(SalesOrders)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action(SalesOrdersShptNotInv)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Shipped Not Invoiced';
                RunObject = Page "Sales Order List";
                RunPageView = where("Shipped Not Invoiced" = const(true));
                ToolTip = 'View sales documents that are shipped but not yet invoiced.';
            }
            action(SalesOrdersComplShtNotInv)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Completely Shipped Not Invoiced';
                RunObject = Page "Sales Order List";
                RunPageView = where("Completely Shipped" = const(true),
                                    "Shipped Not Invoiced" = const(true));
                ToolTip = 'View sales documents that are fully shipped but not fully invoiced.';
            }

            action(ServiceItem)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Service Items';
                Image = Item;
                RunObject = Page "Service Item List";
                ToolTip = 'View or edit detailed information for the service items.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action("Item Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                    Recurring = const(false));
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }

            action("Transfer Orders")
            {
                ApplicationArea = Location;
                Caption = 'Transfer Orders';
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PostedServiceInvoice)
            {
                ApplicationArea = Location;
                Caption = 'Posted Service Invoices';
                RunObject = Page "Posted Service Invoices";
                //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PostedSaleShipments)
            {
                ApplicationArea = Location;
                Caption = 'Posted Sales Shipments';
                RunObject = Page "Posted Sales Shipments";
                //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PostedSalesInvoice)
            {
                ApplicationArea = Location;
                Caption = 'Posted Sales Invoices';
                RunObject = Page "Posted Sales Invoices";
                //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PostedSalesCredit)
            {
                ApplicationArea = Location;
                Caption = 'Posted Sales Cr. Memo';
                RunObject = Page "Posted Sales Credit Memos";
                //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PostedTransferRcpt)
            {
                ApplicationArea = Location;
                Caption = 'Posted Tranfer Receipt';
                RunObject = Page "Posted Transfer Receipts";
                //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }





        }
        area(sections)
        {


            group(WarrantyProcess)
            {
                Caption = 'Warranty Process';
                action("WarrantyCoupon")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Warranty Coupon';
                    RunObject = Page "Warranty Couporn";
                }

                action("DirectWarrantyCoupon")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Direct Warranty Coupon';
                    RunObject = Page "Direct Warranty Page";
                }

                action("WarrantyDataUploaded")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Warranty Data Uploaded';
                    RunObject = Page "Warranty Data Uploaded";
                }
            }

            group(MaintReminderApp)
            {
                Caption = 'Maintenance Reminder/Appointments';
                action(NewServApp)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'New Service Appointment';
                    Image = Job;
                    RunObject = Page "New Service Appointment";
                    ToolTip = 'Create new service appointments.';
                }

                action(TodayServiceApp)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Todays Service Appointment';
                    Image = Job;
                    RunObject = Page "Today's Service Appointment";
                    ToolTip = 'Review todays service appointments.';
                }
                action(BookedSericeAppt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Booked Service Appointment';
                    Image = Job;
                    RunObject = Page "Booked Service Appointment";
                    ToolTip = 'Review booked service appointments.';
                }

                action(EstimatePreparation)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Estimate Preparation';
                    Image = Job;
                    RunObject = Page "Kodawari Estimate List";
                    ToolTip = 'Process estimates for jobs.';
                }

            }

            group(AppointmentPrep)
            {
                Caption = 'Appointments';
                action(OpenJob)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Appointment Preparation';
                    Image = Job;
                    RunObject = Page "Appointment Preparation List";
                    ToolTip = 'Review all appointments.';
                }

                action(GenRepairEstimate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Repair/Estimate';
                    Image = Job;
                    RunObject = Page "General Repairs/Estimate List";
                    ToolTip = 'Review general repair/estimate.';
                }

                action(EstimatePrep)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Estimate Preparation';
                    Image = Job;
                    RunObject = Page "Kodawari Estimate List";
                    ToolTip = 'Review estimates.';
                }
            }

            group(ReceptionArea)
            {
                Caption = 'Reception';
                action(JobWalkIn)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Job Entry Walk-In';
                    Image = Job;
                    RunObject = Page "Job Entry Walk In List";
                    ToolTip = 'Review all job entry walk-in.';
                }

                action(CustOrderAppWI)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Order Appt/Walk-in';
                    Image = Job;
                    RunObject = Page "Customer Order Pg Appt/WI List";
                    ToolTip = 'View all orders for appointments or walk-in.';
                }
                action(GenRepairsEstimate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Repairs/Estimate';
                    Image = Job;
                    RunObject = Page "General Repairs/Estimate List";
                    ToolTip = 'View all general repairs/estimates.';
                }

                action(DiagnosticsQuest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Diagnostic Questionnaire';
                    Image = Job;
                    RunObject = Page "Diagnostic Quest. List";
                    ToolTip = 'View all diagnostic questionnaires.';
                }

            }

            group(ProductionArea)
            {
                Caption = 'Production';
                action(JobInstrction)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Job Instruction';
                    Image = Job;
                    RunObject = Page "Job Instruction List.";
                    ToolTip = 'View all job instructions.';
                }

                action(LabourOperation)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Labour and Operations';
                    Image = Job;
                    RunObject = Page "Labour and Operations List";
                    ToolTip = 'View all job instructions.';
                }

            }

            group(Delivery)
            {
                Caption = 'Delivery';

                action(DeliveryPage)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Delivery';
                    Image = Job;
                    RunObject = Page "Delivery List";
                    ToolTip = 'View all jobs for delivery.';
                }
                action(CompletedJobs)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed Jobs';
                    Image = Job;
                    RunObject = Page "Completed Job Instruction List";
                    ToolTip = 'View all completed jobs.';
                }


            }

            group(Paymentprocess)
            {
                Caption = 'Payment Process';
                action("IOU Request")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IOU Request';
                    Image = Payment;
                    RunObject = Page "IOU Register List";
                    ToolTip = 'Raise IOU for payment.';
                }
                action("IOU Approved")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IOU Approved';
                    Image = Payment;
                    RunObject = Page "IOU Approved List";
                    ToolTip = 'View approved IOUs.';
                }
                action("IOU Treated")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IOU Treated';
                    Image = Payment;
                    RunObject = Page "IOU Request";
                    ToolTip = 'View treated IOUs.';

                }
                action("Retirement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IOU Retirement';
                    Image = Payment;
                    RunObject = Page "Retirement List";
                    ToolTip = 'View treated IOUs.';
                }
                action("ApprovedRetirement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved IOU Retirement';
                    Image = Payment;
                    RunObject = Page "Approved IOU Retirement List";
                    ToolTip = 'View treated IOUs.';
                }
                action("PostedIOURetirement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted IOU Retirement';
                    Image = Payment;
                    RunObject = Page "Posted IOU Retirement List";
                    ToolTip = 'View treated IOUs.';
                }

                action("Journal Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Journal Voucher';
                    Image = Journals;
                    RunObject = Page "Journal Voucher List";
                    ToolTip = 'Post journal entries to the general ledger.';
                }

                action("Posted Journal Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Journal Voucher';
                    Image = Journals;
                    RunObject = Page "Posted Journal Voucher List";
                    ToolTip = 'View posted journal entries in the general ledger.';
                }
            }


            group(OpexMgt)
            {
                Caption = 'Opex Management';
                action("Opex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Opex';
                    RunObject = Page "Opex List";

                }

                action("HODApproval")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'HOD Approvals';
                    RunObject = Page "Head of Dept. Appr.";

                }
                action("ApprovedOpex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Approved Opex';
                    RunObject = Page "Move to LPO Opex";

                }
                action("AdvancePayment")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Advance Payment';
                    RunObject = Page "Advance Paymt Appr.";

                }
                action("ComplianceCheck")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Compliance Check';
                    RunObject = Page "Compliance Check";

                }
                action("AwaitingBalancePayment")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Awaiting Balance Payment';
                    RunObject = Page "Awaiting balance Pay. Appr.";

                }
                action("BalancePaymtApprval")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance Payment Approval';
                    RunObject = Page "Awaiting balance Pay. Appr.";

                }
                action(LPO)
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Local Purchase Order';
                    RunObject = Page "LPO List";

                }
                action("PaymtVoucherOpex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Payment Voucher';
                    RunObject = Page "Payment Vouncher";

                }

                action("GeneralManager")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'General Manager';
                    RunObject = Page "Gen. Manager Appr.";

                }
                action("ManagingDirector")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Managing Director';
                    RunObject = Page "Managing Dir. Appr.";

                }
                action("HeadAudit")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Head of Audit';
                    RunObject = Page "Head of Audit Appr.";

                }
                action("AdvancePaymtApproved")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Advance Payment Approved';
                    RunObject = Page "Advance Paymt Appr.";

                }
                action("BalFullPaymtApproval")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment Approval';
                    RunObject = Page "Full  Payment Appr.";

                }
                action("BalFullPaymtApproved")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment Approved';
                    RunObject = Page "Balance Payment";

                }
                action("BalFullPaymtGM")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment (GM)';
                    RunObject = Page "Balance/full Payment Opex-GM";

                }
                action("BalFullPaymtMD")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment (MD)';
                    RunObject = Page "Balance/Full Payment Opex-MD";

                }
                action("ClosedOpex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Closed';
                    RunObject = Page "Closed Opex";

                }

            }

            group(CapexMgt)
            {
                Caption = 'Capex Management';
                action("Capex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Capex';
                    RunObject = Page "Capex List";

                }
                action("LPOCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Local Purchase Order';
                    RunObject = Page "LPO List-Capex";

                }

                action("HODApprovalCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'HOD of Approvals';
                    RunObject = Page "Head of Dept. Appr.-Capex";

                }
                action("HODofAuditCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Head of Audit';
                    RunObject = Page "Head of Audit Appr.-Capex";

                }
                action("GMApprovalCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'GM Approvals';
                    RunObject = Page "Gen. Manager Appr.-Capex";

                }
                action("MDApprovalCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'MD Approvals';
                    RunObject = Page "Managing Dir. Appr.-Capex";

                }
                action("AdvancePaymtApprovalCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Advance Payment Approvals';
                    RunObject = Page "Advance Paymt Appr.-Capex";

                }
                action("BalFullPaymtApprovalCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Full Payment Approvals';
                    RunObject = Page "Full  Payment Appr.-Capex";

                }
                action("BalFullPaymtApprovalGMCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment -GM';
                    RunObject = Page "Bal/Full Payment Capex-GM";

                }
                action("BalFullPaymtApprovalMDCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment -MD';
                    RunObject = Page "Bal/Full Payment Capex-MD";

                }
                action("ApprovedCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Approved Capex';
                    RunObject = Page "Move to LPO -Capex";

                }
                action("PaymentVoucher")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Payment Voucher';
                    RunObject = Page "Payment Vouncher-Capex";

                }
                action("ComplianceCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Compliance Check';
                    RunObject = Page "Compliance Check-Capex";

                }
                action("AdvancePaymtCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Advance Payment';
                    RunObject = Page "Advance Payment-Capex";

                }
                action("AwaitingBalanceCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Awaiting Balance Payment';
                    RunObject = Page "Awaiting Bal. Pay. Appr.-Capex";

                }
                action("BalancePaymentCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance Payment';
                    RunObject = Page "Balance Payment-Capex";

                }
                action("ClosedCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Closed';
                    RunObject = Page "Closed Capex";

                }

            }
            group("Parts Operation")
            {
                Caption = 'Parts Operation';
                Image = ExecuteBatch;
                action("Pending Purchase Requests")
                {
                    Caption = 'Pending Purchase Requests';
                    RunObject = Page 50347;
                    ApplicationArea = CostAccounting;
                }
                action("Pending Estimate Requests")
                {
                    Caption = 'Pending Estimate Requests';
                    RunObject = Page 50323;
                    ApplicationArea = CostAccounting;

                }
                action("Bulk Issue")
                {
                    Caption = 'Bulk Issue';
                    RunObject = Page 50476;
                    ApplicationArea = CostAccounting;
                }
                action("Parts Order")
                {
                    Caption = 'Parts Order';
                    RunObject = Page "Service List";
                    RunPageView = where("Document Type" = filter(Order));
                    ApplicationArea = All;
                }
                action("Sales Order")
                {
                    Caption = 'Sales Order';
                    RunObject = Page 70070;
                    ApplicationArea = CostAccounting;
                }
            }

            group(Administration)
            {
                Caption = 'Administration';
                Image = Setup;
                action(Resource)
                {
                    Caption = 'Resource';
                    RunObject = Page 77;
                    ApplicationArea = CostAccounting;
                }
                action("Service Menu Setup")
                {
                    Caption = 'Service Menu Setup';
                    RunObject = Page 50236;
                    ApplicationArea = CostAccounting;
                }
                action("SSC/SC Setup")
                {
                    Caption = 'SSC/SC Setup';
                    RunObject = Page 70080;
                    ApplicationArea = CostAccounting;
                }
                action("Flat Rate Setup")
                {
                    Caption = 'Flat Rate Setup';
                    RunObject = Page "Service Costs List";
                    ApplicationArea = All;
                }
                action("DTC Setup")
                {
                    Caption = 'DTC Setup';
                    RunObject = Page 50361;
                    ApplicationArea = CostAccounting;
                }
                action("Service Item")
                {
                    Caption = 'Service Item';
                    RunObject = Page "Service Item List";
                    ApplicationArea = CostAccounting;
                }
                action("Service Mgt. Setup")
                {
                    Caption = 'Service Mgt. Setup';
                    ApplicationArea = CostAccounting;
                }
                action("VRI Administrator")
                {
                    Caption = 'VRI Administrator';
                    RunObject = Page 50324;
                    ApplicationArea = CostAccounting;
                }
                action("Takata Customer")
                {
                    Caption = 'Takata Customer';
                    RunObject = Page 70504;
                    ApplicationArea = CostAccounting;
                }
                action("Warranty Claim")
                {
                    Caption = 'Warranty Claim';
                    RunObject = Page 50163;
                    ApplicationArea = CostAccounting;
                }
            }

            group(LeaveRequest1)
            {
                Caption = 'Leave Request';
                action("LeaveRequest")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Request';
                    Image = CalculateCalendar;
                    RunObject = Page "Leave Request List";
                    ToolTip = 'Request for leave.';
                }

                action("LeaveApproval")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Approval';
                    Image = CalculateCalendar;
                    RunObject = Page "Approval Leave List";
                    ToolTip = 'View leaves awaiting approval.';
                }

            }

            group(PoolCars)
            {
                Caption = 'Pool Cars';

                action("New Request")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'New Request';
                    Image = RedoFluent;
                    RunObject = Page "Pool Car Request List";
                    ToolTip = 'Make a new request for pool car.';

                }

                action("ApprovedPoolCar")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Requests';
                    Image = RedoFluent;
                    RunObject = Page "Approved Pool Car Request List";
                    ToolTip = 'Make a new request for pool car.';

                }
                action("PoolCarAllocation")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Allocation';
                    Image = RedoFluent;
                    RunObject = Page "Pool Car Allocation List";
                    ToolTip = 'Make a new request for pool car.';

                }
                action("ClosedPoolCar")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Closed Requests';
                    Image = RedoFluent;
                    RunObject = Page "Close Pool Car List";
                    ToolTip = 'Closed requests.';

                }

            }
            group("Warranty Coupon")
            {

                Caption = 'Warranty Coupon';
                Image = FiledPosted;
                ToolTip = 'View the warranty register.';
                action(Warranty)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Warranty Coupon';
                    Image = PostedOrder;
                    RunObject = Page "Warranty Coupon2";
                    ToolTip = 'Open the warranty coupon list.';
                }

            }

            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action(Action32)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action(Action34)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted return receipts.';
                }
                action(Action40)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("Sales Quote Archive")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quote Archives';
                    RunObject = page "Sales Quote Archives";
                }





            }
        }
        area(processing)
        {

            group(Reports)
            {
                Caption = 'Reports';
                group(Customer)
                {
                    Caption = 'Customer';
                    Image = Customer;
                    action("Customer - &Order Summary")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - &Order Summary';
                        Image = "Report";
                        RunObject = Report "Customer - Order Summary";
                        ToolTip = 'View the quantity not yet shipped for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
                    }
                    action("Customer - &Top 10 List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - &Top 10 List';
                        Image = "Report";
                        //RunObject = Report "Customer - Top 10 List";
                        ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
                    }
                    action("Customer/&Item Sales")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer/&Item Sales';
                        Image = "Report";
                        RunObject = Report "Customer/Item Sales";
                        ToolTip = 'View a list of item sales for each customer during a selected time period. The report contains information on quantity, sales amount, profit, and possible discounts. It can be used, for example, to analyze a company''s customer groups.';
                    }
                }
                group(Action31)
                {
                    Caption = 'Sales';
                    Image = Sales;

                    action("Salesperson - Sales &Statistics")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Salesperson - Sales &Statistics';
                        Image = "Report";
                        RunObject = Report "Salesperson - Sales Statistics";
                        ToolTip = 'View amounts for sales, profit, invoice discount, and payment discount, as well as profit percentage, for each salesperson for a selected period. The report also shows the adjusted profit and adjusted profit percentage, which reflect any changes to the original costs of the items in the sales.';
                    }

                }
            }
            group(History)
            {
                Caption = 'History';
                action("Navi&gate")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Find entries...';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ShortCutKey = 'Ctrl+Alt+Q';
                    ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
        }
    }
}
