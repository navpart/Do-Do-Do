page 50018 Operations
{
    Caption = 'Operations';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control104; "Headline RC Team Member")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1901851508; "SO Processor Activities")
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                ApplicationArea = Basic, Suite;
            }
            /* part("Intercompany Activities"; "Intercompany Activities")
            {
                ApplicationArea = Intercompany;
            } */

            part(PurchAgent; "Purchase Agent Activities")
            {
                ApplicationArea = Basic, Suite;
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
            action("VRI In Progress")
            {
                Caption = 'VRI In Progress';
                RunObject = Page 50397;
                ApplicationArea = Basic, Suite;
            }
            action("Transfer Order")
            {
                Caption = 'Transfer Order';
                Image = Document;
                RunObject = Page 5742;
                ApplicationArea = Basic, Suite;
            }
            action("Model List")
            {
                Caption = 'Model List';
                RunObject = Page 50037;
                ApplicationArea = Basic, Suite;
            }
            action("Purchase Order")
            {
                Caption = 'Purchase Order';
                Image = Document;
                RunObject = Page 9307;
                ApplicationArea = Basic, Suite;
            }
            action("Item &Tracing")
            {
                Caption = 'Item &Tracing';
                Image = ItemTracing;
                RunObject = Page 6520;
                ApplicationArea = Basic, Suite;
            }
            action("Colour Code")
            {
                Caption = 'Colour Code';
                RunObject = Page 70170;
                ApplicationArea = Basic, Suite;
            }
            action("Estimate List")
            {
                Caption = 'Estimate List';
                RunObject = Page 70081;
                ApplicationArea = Basic, Suite;
            }
            action("Completed Job Instruction List")
            {
                Caption = 'Completed Job Instruction List';
                RunObject = Page 70076;
                ApplicationArea = Basic, Suite;
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
            action(SalesJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Sales),
                                    Recurring = const(false));
                ToolTip = 'Post any sales-related transaction directly to a customer, bank, or general ledger account instead of using dedicated documents. You can post all types of financial sales transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a sales journal.';
            }
            action(CashReceiptJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
                ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
            }
            action("Transfer Orders")
            {
                ApplicationArea = Location;
                Caption = 'Transfer Orders';
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
        }
        area(sections)
        {
            group(Action76)
            {
                Caption = 'VRI';
                Image = Sales;
                ToolTip = 'Check list of vehicle receipt inspection.';
                action(Action61)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VRI List';
                    Image = Item;
                    RunObject = Page "VRI List";
                    ToolTip = 'Check list of vehicle receipt inspection.';
                }
                action(VRIMissing)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VRI Missing';
                    Image = Item;
                    RunObject = Page "VRI Missing";
                    ToolTip = 'Check list of vehicle receipt inspection.';
                }
                action(LogisticsVRI)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Logistics VRI';
                    Image = Item;
                    RunObject = Page "Logistics List";
                    ToolTip = 'Check list of logistics inspection.';
                }

                action(ISPVFolder)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'ISPV Folder';
                    Image = Item;
                    RunObject = Page "ISPV Folder";
                    ToolTip = 'Check list of logistics inspection.';
                }
            }
            group("Dealer Visit")
            {
                action(OnlineAllocation)
                {
                    ApplicationArea = All;
                    Caption = 'Online Allocation';
                    RunObject = page "Allocation List";
                    ToolTip = '';
                }
                action(VehicleOnlineOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Online Order';
                    RunObject = page "Vehicle Online Order List";
                    ToolTip = '';
                }
                action(OnlineSalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Online Sales Order';
                    RunObject = page "Online Sales Order List";
                    RunPageView = where("Online Order" = const(true));
                    ToolTip = '';
                }
                action(ItemToPick)
                {
                    ApplicationArea = All;
                    Caption = 'Item to Pick';
                    RunObject = page "Item Picked";
                    ToolTip = '';
                }
                action(SecuritySalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Security Sales Order';
                    RunObject = page "Security Sales Order List";
                    ToolTip = '';
                }
                action(AuditorsList)
                {
                    ApplicationArea = All;
                    Caption = 'Auditors';
                    RunObject = page "Sales Shipment Audit List";
                    ToolTip = '';
                }
            }

            group(Action62)
            {
                Caption = 'Inventory';
                ToolTip = 'Manage physical or service-type items that you trade in by setting up item cards with rules for pricing, costing, planning, reservation, and tracking. Set up storage places or warehouses and how to transfer between such locations. Count, adjust, reclassify, or revalue inventory.';
                action(Action93)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                    ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
                }

                action(Action96)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = where("Template Type" = const(Item),
                                        Recurring = const(false));
                    ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
                }
                action("Item Charges")
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Charges';
                    RunObject = Page "Item Charges";
                    ToolTip = 'View or edit the codes for item charges that you can assign to purchase and sales transactions to include any added costs, such as freight, physical handling, and insurance that you incur when purchasing or selling items. This is important to ensure correct inventory valuation. For purchases, the landed cost of a purchased item consists of the vendor''s purchase price and all additional direct item charges that can be assigned to individual receipts or return shipments. For sales, knowing the cost of shipping sold items can be as vital to your company as knowing the landed cost of purchased items.';
                }
                action("Item Attributes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Attributes';
                    RunObject = Page "Item Attributes";
                    ToolTip = 'Assign item attribute values to your items to enable rich searching and sorting options. When customers inquire about an item, either in correspondence or in an integrated web shop, they can then ask or search according to characteristics, such as height and model year. You can also assign item attributes to item categories, which then apply to the items that use the item categories in question.';
                }
                action("Item Tracking")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item Tracking';
                    RunObject = Page "Avail. - Item Tracking Lines";
                    ToolTip = 'Assign serial numbers and lot numbers to any outbound or inbound document for quality assurance, recall actions, and to control expiration dates and warranties. Use the Item Tracing window to trace items with serial or lot numbers backwards and forward in their supply chain';
                }
                action("Item Reclassification Journals")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Item Reclassification Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = where("Template Type" = const(Transfer),
                                        Recurring = const(false));
                    ToolTip = 'Change information on item ledger entries, such as dimensions, location codes, bin codes, and serial or lot numbers.';
                }
                action("Phys. Inventory Journals")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Phys. Inventory Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = where("Template Type" = const("Phys. Inventory"),
                                        Recurring = const(false));
                    ToolTip = 'Select how you want to maintain an up-to-date record of your inventory at different locations.';
                }
                action("Assembly Orders")
                {
                    ApplicationArea = Assembly;
                    Caption = 'Assembly Orders';
                    RunObject = Page "Assembly Orders";
                    ToolTip = 'Combine components in simple processes without the need of manufacturing functionality. Sell assembled items by building the item to order or by picking from stock.';
                }
                action("Drop Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Drop Shipments';
                    RunObject = Page "Sales Lines";
                    RunPageView = where("Drop Shipment" = const(true));
                    ToolTip = 'Minimize delivery time and inventory cost by having items shipped from your vendor directly to your customer. This simply requires that you mark the sales order for drop shipment and then create a linked purchase order with the customer specified as the recipient. ';
                }
                action(Locations)
                {
                    ApplicationArea = Location;
                    Caption = 'Locations';
                    RunObject = Page "Location List";
                    ToolTip = 'Manage the different places or warehouses where you receive, process, or ship inventory to increase customer service and keep inventory costs low.';
                }

                action("Colour List")
                {
                    Caption = 'Colour List';
                    RunObject = Page 50131;
                    ApplicationArea = Basic, Suite;
                }
                action(Vendors)
                {
                    Caption = 'Vendors';
                    Image = Vendor;
                    RunObject = Page 27;
                    ApplicationArea = Basic, Suite;
                }
                action("Warranty Coupon")
                {
                    Caption = 'Warranty Coupon';
                    RunObject = Page 70018;
                    ApplicationArea = Basic, Suite;
                }
                action("Periodic Maintenance")
                {
                    Caption = 'Periodic Maintenance';
                    RunObject = Page 50282;
                    ApplicationArea = Basic, Suite;
                }
                action("Stock/Inventory")
                {
                    Caption = 'Stock/Inventory';
                    RunObject = Page 50283;
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Stores)
            {
                Caption = 'Stores';
                action("Store Requisition")
                {
                    Caption = 'Store Requisition';
                    RunObject = Page 50207;
                    ApplicationArea = Basic, Suite;
                }
                action("PostedStoreRequisition")
                {
                    Caption = 'Posted Store Requisition';
                    RunObject = Page 50208;
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
                    Caption = 'Awaiting Balance Payment';
                    RunObject = Page "Balance Payment-Capex";

                }
                action("ClosedCapex")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Awaiting Balance Payment';
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
                action("Sales Order Archive")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Order Archives';
                    RunObject = page "Sales Order Archives";
                }
                action("Sales Return Order Archives")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Return Order Archives';
                    RunObject = page "Sales Return List Archive";
                }
                action("Blanket Sales Order Archives")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Blanket Sales Order Archives';
                    RunObject = page "Blanket Sales Order Archives";
                }
                action(Action54)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action(Action86)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Opens the list of posted purchase credit memos.';
                }
                action(Action87)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Opens the list of posted purchase return shipments.';
                }
                action(Action53)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Transfer Shipments")
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Transfer Shipments';
                    RunObject = Page "Posted Transfer Shipments";
                    ToolTip = 'Open the list of posted transfer shipments.';
                }
                action("Posted Transfer Receipts")
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Transfer Receipts';
                    RunObject = Page "Posted Transfer Receipts";
                    ToolTip = 'Open the list of posted transfer receipts.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Issued Reminders';
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'Opens the list of issued reminders.';
                }
                action("Issued Finance Charge Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Issued Finance Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'Opens the list of issued finance charge memos.';
                }
            }

            group("Branch Pool Car Repair")
            {
                Caption = 'Branch Pool Car Repair';
                action("TNL Work Order (Mgr)")
                {
                    Caption = 'TNL Work Order (Mgr)';
                    RunObject = Page 50620;
                    ApplicationArea = Basic, Suite;
                }
                action("Approvals Request (Adim)")
                {
                    Caption = 'Approvals Request (Adim)';
                    RunObject = Page 50126;
                    ApplicationArea = Basic, Suite;
                }
                action("Send Estimate Requests (Mgr)")
                {
                    Caption = 'Send Estimate Requests (Mgr)';
                    RunObject = Page 50148;
                    ApplicationArea = Basic, Suite;
                }
                action("Awaitng Estimate Confirmations (Admin)")
                {
                    Caption = 'Awaitng Estimate Confirmations (Admin)';
                    RunObject = Page 50127;
                    ApplicationArea = Basic, Suite;
                }
                action("Approved Estimate (Mgr)")
                {
                    Caption = 'Approved Estimate (Mgr)';
                    RunObject = Page 50135;
                    ApplicationArea = Basic, Suite;
                }
                action("Awaiting Invoices (Admin)")
                {
                    Caption = 'Awaiting Invoices (Admin)';
                    RunObject = Page 50142;
                    ApplicationArea = Basic, Suite;
                }
                action("Awaitig Payment Approvals (Admin)")
                {
                    Caption = 'Awaitig Payment Approvals (Admin)';
                    RunObject = Page 50145;
                    ApplicationArea = Basic, Suite;
                }
                action("Awaiting Checks (Mgr)")
                {
                    Caption = 'Awaiting Checks (Mgr)';
                    RunObject = Page 50173;
                    ApplicationArea = Basic, Suite;
                }
                action("ClosedTransactionsPoolCar")
                {
                    Caption = 'Closed Transactions';
                    RunObject = Page 50212;
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Motor Show Repairs")
            {
                Caption = 'Motor Show Repairs';
                action("Motor Show Repair List")
                {
                    Caption = 'Motor Show Repair List';
                    RunObject = Page 50621;
                    ApplicationArea = Basic, Suite;
                }
                action("Request Approvals (Event Mgr)")
                {
                    Caption = 'Request Approvals (Event Mgr)';
                    RunObject = Page 50213;
                    ApplicationArea = Basic, Suite;
                }
                action(" Pending Estimate Appr (PDI)")
                {
                    Caption = ' Pending Estimate Appr (PDI)';
                    RunObject = Page 50144;
                    ApplicationArea = Basic, Suite;
                }
                action("Approved Estimates (Event Mgr)")
                {
                    Caption = 'Approved Estimates (Event Mgr)';
                    RunObject = Page 50216;
                    ApplicationArea = Basic, Suite;
                }
                action("Pending Payment (PDI)")
                {
                    Caption = 'Pending Payment (PDI)';
                    RunObject = Page 50244;
                    ApplicationArea = Basic, Suite;
                }
                action("Closed Transactions")
                {
                    Caption = 'Closed Transactions';
                    RunObject = Page 50248;
                    ApplicationArea = Basic, Suite;
                }
            }
            group("View Payslip")
            {
                Caption = 'View Payslip';
                action("My Payslips")
                {
                    Caption = 'My Payslips';
                    RunObject = Page 50147;
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Vehicle Delivery")
            {
                Caption = 'Vehicle Delivery';
                action("Vehicle Delivery Monitor")
                {
                    Caption = 'Vehicle Delivery Monitor';
                    RunObject = Page 50378;
                    ApplicationArea = Basic, Suite;
                }
                action("Vehicle Delivered")
                {
                    Caption = 'Vehicle Delivered';
                    RunObject = Page 50380;
                    ApplicationArea = Basic, Suite;
                }
            }

        }
        area(creation)
        {
            action("Sales &Quote")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new sales quote to offer items or services to a customer.';
            }
            action("Sales &Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Sales &Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Order';
                Image = Document;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales &Return Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Return Order';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order";
                RunPageMode = Create;
                ToolTip = 'Compensate your customers for incorrect or damaged items that you sent to them and received payment for. Sales return orders enable you to receive items from multiple sales documents with one sales return, automatically create related sales credit memos or other return-related documents, such as a replacement sales order, and support warehouse documents for the item handling. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
            }
            action("Sales &Credit Memo")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Credit Memo';
                Image = CreditMemo;
                RunObject = Page "Sales Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
            }
        }
        area(processing)
        {
            group(Tasks)
            {
                Caption = 'Tasks';
                action("Sales &Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Journal';
                    Image = Journals;
                    RunObject = Page "Sales Journal";
                    ToolTip = 'Open a sales journal where you can batch post sales transactions to G/L, bank, customer, vendor and fixed assets accounts.';
                }
#if not CLEAN21
                action("Sales Price &Worksheet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Price &Worksheet';
                    Image = PriceWorksheet;
                    RunPageView = where("Object Type" = const(Page), "Object ID" = const(7023)); // "Sales Price Worksheet";
                    RunObject = Page "Role Center Page Dispatcher";
                    ToolTip = 'Manage sales prices for individual customers, for a group of customers, for all customers, or for a campaign.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '19.0';
                }
#else
                action("Price &Worksheet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Price &Worksheet';
                    Image = PriceWorksheet;
                    RunObject = Page "Price Worksheet";
                    ToolTip = 'Opens the page where you can add new price lines manually or copy them from the existing price lists or suggest new lines based on data in the product cards.';
                }
#endif
            }
            group(Action42)
            {
                Caption = 'Sales';
#if not CLEAN21
                action("&Prices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Prices';
                    Image = SalesPrices;
                    RunPageView = where("Object Type" = const(Page), "Object ID" = const(7002)); // "Sales Prices";
                    RunObject = Page "Role Center Page Dispatcher";
                    ToolTip = 'Set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the Sales Price Lists action.';
                    ObsoleteTag = '19.0';
                }
                action("&Line Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Line Discounts';
                    Image = SalesLineDisc;
                    RunPageView = where("Object Type" = const(Page), "Object ID" = const(7004)); // "Sales Line Discounts";
                    RunObject = Page "Role Center Page Dispatcher";
                    ToolTip = 'Set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the Sales Price Lists action.';
                    ObsoleteTag = '19.0';
                }
#else
                action("Price Lists")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Prices';
                    Image = SalesPrices;
                    RunObject = Page "Sales Price Lists";
                    ToolTip = 'View or set up sales price lists for products that you sell to the customer. A product price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
#endif
            }
            group(Reports)
            {
                Caption = 'Reports';

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

                action("TNL Sales Contribution")
                {
                    ApplicationArea = Suite;
                    Caption = 'TNL Sales Contribution';
                    Image = "Report";
                    RunObject = Report "TNL Sales Contribution";
                    ToolTip = 'View amounts for sales, profit, invoice discount, as well as profit percentage, for each salesperson for a selected period. The report also shows the adjusted profit and adjusted profit percentage, which reflect any changes to the original costs of the items in the sales.';
                }
                action("Salesperson - Sales &Statistics")
                {
                    ApplicationArea = Suite;
                    Caption = 'Salesperson - Sales &Statistics';
                    Image = "Report";
                    RunObject = Report "Salesperson - Sales Statistics";
                    ToolTip = 'View amounts for sales, profit, invoice discount, and payment discount, as well as profit percentage, for each salesperson for a selected period. The report also shows the adjusted profit and adjusted profit percentage, which reflect any changes to the original costs of the items in the sales.';
                }
#if not CLEAN21
                action("Price &List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Price &List';
                    Image = "Report";
                    RunPageView = where("Object Type" = const(Report), "Object ID" = const(715)); // "Price List";
                    RunObject = Page "Role Center Page Dispatcher";
                    ToolTip = 'View a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '19.0';
                }
#else
                    action("Price &List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Item Price &List';
                        Image = "Report";
                        RunObject = Report "Item Price List";
                        ToolTip = 'View a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
                    }
#endif
                action("Inventory - Sales &Back Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inventory - Sales &Back Orders';
                    Image = "Report";
                    RunObject = Report "Inventory - Sales Back Orders";
                    ToolTip = 'View a list with the order lines whose shipment date has been exceeded. The following information is shown for the individual orders for each item: number, customer name, customer''s telephone number, shipment date, order quantity and quantity on back order. The report also shows whether there are other items for the customer on back order.';
                }

                action(CarsInventory)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cars Inventory';
                    Image = "Report";
                    RunObject = Report "Cars-Inventory";
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



