page 50026 "Kodawari External"
{
    Caption = 'Kodawari External';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control104; "Headline RC Serv. Dispatcher")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1901851508; "Service Adviser Activities")
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
            ToolTip = 'Manage payslip, service processes, view KPIs, and access your service items and customers.';
            action(MyPaySlips)
            {
                ApplicationArea = CostAccounting;
                Caption = 'My Payslips';
                RunObject = Page "My payslip";
                ToolTip = '';
            }
            action("Cash Receip&t")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'POS Receipt';
                Image = CashReceiptJournal;
                RunObject = Page "POS Receipt List";
                ToolTip = 'Post POS receipt entries to the general ledger.';
            }
            action(MaintenanceReminder)
            {
                ApplicationArea = All;
                Caption = 'Maintenance Reminder Today';
                Image = Item;
                RunObject = Page "Maintenance Reminder Today";
                ToolTip = 'View or edit detailed information for maintenance reminders.';
            }
            action(ServiceItem)
            {
                ApplicationArea = All;
                Caption = 'Service Items';
                Image = Item;
                RunObject = Page "Service Item List";
                ToolTip = 'View or edit detailed information for the service items.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'TCSC Items';
                Image = Item;
                RunObject = Page "Item List TCSC";
                RunPageView = WHERE("Location Filter" = FILTER('120ISO'));
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(TCSCCustomers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'TCSC Customer';
                Image = "Report";
                RunObject = page "Customer List";
                RunPageView = WHERE("Location Code" = FILTER('120ISO'));
                ToolTip = 'View TCSC customers.';
            }
            action(PostedServiceInvoiceLines)
            {
                ApplicationArea = Location;
                Caption = 'Posted Service Invoice Lines';
                RunObject = Page "Posted Service Invoice Lines";
                ToolTip = 'View posted service invoice lines.';
            }
            action("Transfer Orders")
            {
                ApplicationArea = Location;
                Caption = 'Transfer Orders';
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(Complaints)
            {
                ApplicationArea = All;
                Caption = 'Customer Complaints';
                Image = "Report";
                RunObject = Page "Complaint List";
                ToolTip = 'View customer complaints.';
            }
        }
        area(sections)
        {
            group(Action76)
            {
                Caption = 'Sales';
                Image = Sales;
                ToolTip = 'Make quotes to customers. Manage customers and view transaction history.';

                action("Sales Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quotes';
                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }
                action("Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TCSC Sales Orders';
                    RunObject = Page "Sales Order List TCSC";
                    ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
                }

                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Sales Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Sales Return Receipts';
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted sales return receipts.';
                }
                action("Posted Sales Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("ServiceCost")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Cost';
                    Image = PostedShipment;
                    RunObject = Page "Service Costs";
                    ToolTip = 'Open the list to see the service costs.';
                }


            }

            group("Local Parts Purchase")
            {
                Caption = 'Local Parts Purchase';
                action(LPP)
                {
                    Caption = 'LPP';
                    RunObject = Page 70193;
                    ApplicationArea = Basic, Suite;
                }
                action("HOD Part Approval")
                {
                    Caption = 'HOD Part Approval';
                    RunObject = Page 70194;
                    ApplicationArea = Basic, Suite;
                }
                action("Compliance Check")
                {
                    Caption = 'Compliance Check';
                    RunObject = Page 70195;
                    ApplicationArea = Basic, Suite;
                }
                action("HOD Audit")
                {
                    Caption = 'HOD Audit';
                    RunObject = Page 70196;
                    ApplicationArea = Basic, Suite;
                }
                action("HOD Procurement Approval")
                {
                    Caption = 'HOD Procurement Approval';
                    RunObject = Page 70197;
                    ApplicationArea = Basic, Suite;
                }
                action(GM)
                {
                    Caption = 'GM';
                    RunObject = Page 70198;
                    ApplicationArea = Basic, Suite;
                }
                action(MD)
                {
                    Caption = 'MD';
                    RunObject = Page 70199;
                    ApplicationArea = Basic, Suite;
                }
                action("MD Isolo")
                {
                    Caption = 'MD Isolo';
                    RunObject = Page 70217;
                    ApplicationArea = Basic, Suite;
                }
                action("Departmental Float")
                {
                    Caption = 'Departmental Float';
                    RunObject = Page 70201;
                    ApplicationArea = Basic, Suite;
                }
                action("Generate LPO")
                {
                    Caption = 'Generate LPO';
                    RunObject = Page 70204;
                    ApplicationArea = Basic, Suite;
                }
                action("Print LPP LPO")
                {
                    Caption = 'Print LPP LPO';
                    RunObject = Page 70206;
                    ApplicationArea = Basic, Suite;
                }
                action("Payment Approved")
                {
                    Caption = 'Payment Approved';
                    RunObject = Page 70202;
                    ApplicationArea = Basic, Suite;
                }
                action("Payment Voucher")
                {
                    Caption = 'Payment Voucher';
                    RunObject = Page 70203;
                    ApplicationArea = Basic, Suite;
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
                    RunObject = Page "Advance Payment";

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
                    Caption = 'Balance/Full Payment- GM';
                    RunObject = Page "Bal/Full Payment Capex-GM";

                }
                action("BalFullPaymtApprovalMDCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Balance/Full Payment- MD';
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
                    Caption = 'Closed Capex';
                    RunObject = Page "Closed Capex";

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
                action("ApprovedLeave")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Leave';
                    Image = CalculateCalendar;
                    RunObject = Page "Approved Leave List";
                    ToolTip = 'View approved leavesl.';
                }

                action("HODAdmin")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HOD HR/Admin';
                    Image = CalculateCalendar;
                    RunObject = Page "HOD HR/ADMIN LIST";
                    ToolTip = 'View leaves for HOD/Admin approval.';
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

                action(WarrantyCoupon)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Warranty Coupon';
                    Image = ListPage;
                    RunObject = page "Warranty Coupon4";
                    ToolTip = 'View warranty coupons.';
                }
                action(Takata)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Takata Calls';
                    Image = "Report";
                    RunObject = page "Pending Takata Customer List";
                    ToolTip = 'View pending Takata customer calls.';
                }
                action(ProsCustomers)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Prospective Customers';
                    Image = "Report";
                    RunObject = page "Prospective Customer";
                    ToolTip = 'View prospective Customers.';
                }
                action(KIVCustomers)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'KIV Customer';
                    Image = "Report";
                    RunObject = page "KIV Customer";
                    ToolTip = 'View KIV Customer.';
                }
                action(NotReach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Not Reachable Customers';
                    Image = "Report";
                    RunObject = page "Not Reachable Customer";
                    ToolTip = 'View not reachable customers.';
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
                action(PostedSaleShipmentLines)
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Sales Shipment Lines';
                    RunObject = Page "Posted Sales Shipment Lines";
                    //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
                }

                action(PostedSalesCredit)
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Sales Cr. Memo';
                    RunObject = Page "Posted Sales Credit Memos";
                    //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
                }
                action(PostedSalesInvoice)
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
                }
                action(PostedTransferRcpt)
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Tranfer Receipt Lines';
                    RunObject = Page "Posted Transfer Receipt Lines";
                    //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
                }
                action(PostedTransferShipment)
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Tranfer Shipment Lines';
                    RunObject = Page "Posted Transfer Shipment Lines";
                    //ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
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
