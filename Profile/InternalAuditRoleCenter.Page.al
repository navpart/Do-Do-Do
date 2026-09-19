page 70102 "Internal Audit Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {

            part(Control139; "Headline RC Administrator")
            {
                ApplicationArea = Basic, Suite;

            }
            part(AuditApprovals; "Audit Cue")
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

        }
    }

    actions
    {
        area(reporting)
        {
            action("Recei&vables-Payables")
            {
                Caption = 'Recei&vables-Payables';
                Image = ReceivablesPayables;
                RunObject = Report 5;
            }
            action("Detailed Trial Balance")
            {
                Caption = 'Detailed Trial Balance';
                RunObject = Report 4;
            }
            action("&Trial Balance/Budget")
            {
                Caption = '&Trial Balance/Budget';
                Image = "Report";
                //RunObject = Report 9;
            }
            action("&Closing Trial Balance")
            {
                Caption = '&Closing Trial Balance';
                Image = "Report";
                RunObject = Report 10;
            }
            action("&Fiscal Year Balance")
            {
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report 36;
            }

            action("Inventory Valuation New")
            {
                Caption = 'Inventory Valuation New';
                Image = "Report";
                RunObject = Report 50379;
            }
            action("TNL Sales Contribution")
            {
                Caption = 'TNL Sales Contribution';
                Image = "Report";

                RunObject = Report 50184;
            }
            action("Customer Item Sales")
            {
                Caption = 'Customer Item Sales';
                Image = Item;
                RunObject = Report "Customer/Item Sales";
            }
            action("Item History")
            {
                Caption = 'Item History';
                Image = "Report";
                RunObject = Report 50402;
            }
            action("Customer - &Balance")
            {
                Caption = 'Customer - &Balance';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
            }
            action("Customer - T&op 10 List")
            {
                Caption = 'Customer - T&op 10 List';
                Image = "Report";
                //RunObject = Report "Customer - Top 10 List";
            }
            action("Customer - S&ales List")
            {
                Caption = 'Customer - S&ales List';
                Image = "Report";
                //RunObject = Report "Customer - Sales List";
            }
            action("Sales &Statistics")
            {
                Caption = 'Sales &Statistics';
                Image = "Report";
                //RunObject = Report "Sales Statistics";
            }
            action("Pool Car")
            {
                Caption = 'Pool Car';
                Image = "Report";
                RunObject = Report 50442;
            }

            action("Vendor - &Purchase List")
            {
                Caption = 'Vendor - &Purchase List';
                Image = "Report";
                RunObject = Report 309;
            }
            action("Delivered Customer Order List")
            {
                Caption = 'Closed Jobs';
                RunObject = Page 80052;
            }
            action("WIP Customer Order List")
            {
                Caption = 'Opened Jobs';
                RunObject = Page 80043;
            }
        }
        area(embedding)
        {
            action(MyPaySlips)
            {
                ApplicationArea = CostAccounting;
                Caption = 'My Payslips';
                RunObject = Page "My payslip";
                ToolTip = '';
            }
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Incoming Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents';
                Image = Documents;
                RunObject = Page "Incoming Documents";
                ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                Image = Invoice;
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }

        }
        area(sections)
        {
            group("Pool Car Administration")
            {
                Caption = 'Pool Car Administration';
                action("New Request")
                {
                    Caption = 'New Request';
                    RunObject = Page 50592;
                }
                action("Approved Request")
                {
                    Caption = 'Approved Request';
                    RunObject = Page 50594;
                }
                action("Pool Car Allocation")
                {
                    Caption = 'Pool Car Allocation';
                    RunObject = Page 50596;
                }
            }
            group("Rejected Folder")
            {
                Caption = 'Rejected Folder';
                action("Rejected Procurement")
                {
                    Caption = 'Rejected Procurement';
                    RunObject = Page 70149;
                }
                action("Rejected IOU")
                {
                    Caption = 'Rejected IOU';
                    RunObject = Page 50220;
                }
            }
            group(OpexGrp)
            {
                Caption = 'Opex';
                action(Opex)
                {
                    Caption = 'Opex';
                    RunObject = Page 70125;
                }
                action("Head of Dep. Appr. Opex")
                {
                    Caption = 'Head of Dep. Appr. Opex';
                    RunObject = Page 70131;
                }
                action("Approved Opex")
                {
                    Caption = 'Approved Opex';
                    RunObject = Page 70134;
                }
                action("Advance Payment Opex")
                {
                    Caption = 'Advance Payment Opex';
                    RunObject = Page 70135;
                }
                action("Compliance Check Opex")
                {
                    Caption = 'Compliance Check Opex';
                    RunObject = Page 70138;
                }
                action("Awaiting Balance Payment")
                {
                    Caption = 'Awaiting Balance Payment';
                    RunObject = Page 70148;
                }
                action("Balance Payment Apprv. Opex")
                {
                    Caption = 'Balance Payment Apprv. Opex';
                    RunObject = Page 70139;
                }
                action(LPO)
                {
                    Caption = 'LPO';
                    RunObject = Page 70142;
                }
                action("Payment Voucher Opex")
                {
                    Caption = 'Payment Voucher Opex';
                    RunObject = Page 70136;
                }
                action("Balance/Full Payment Approved Opex")
                {
                    Caption = 'Balance/Full Payment Approved Opex';
                    RunObject = Page 70140;
                }

                action("General Manager Opex")
                {
                    Caption = 'General Manager Opex';
                    RunObject = Page 70132;
                }
                action("Managing Dir. Appr")
                {
                    Caption = 'Managing Dir. Appr.-Opex';
                    RunObject = Page 70133;
                }
                action("Head of Audit Appr Opex")
                {
                    Caption = 'Head of Audit Appr Opex';
                    RunObject = Page 70129;
                }
                action("Advanced Payment Approved")
                {
                    Caption = 'Advanced Payment Approved';
                    RunObject = Page 70145;
                }
                action("Balance/Full Payment Approved")
                {
                    Caption = 'Balance/Full Payment Approved Opex';
                    RunObject = Page 70140;
                }
                action("Balance/Full Payment Opex GM")
                {
                    Caption = 'Balance/Full Payment Opex GM';
                    RunObject = Page 70187;
                }
                action("Balance/Full Payment Opex MD")
                {
                    Caption = 'Balance/Full Payment Opex MD';
                    RunObject = Page 70186;
                }
                action("Closed Opex")
                {
                    Caption = 'Closed Opex';
                    RunObject = Page 70141;
                }
            }
            group(CapexGrp)
            {
                Caption = 'Capex';
                action(Capex)
                {
                    Caption = 'Capex';
                    RunObject = Page 70118;
                }
                action(" LPO -Capex")
                {
                    Caption = ' LPO -Capex';
                    RunObject = Page 70165;
                }
                action("Head of Dept. Appr. Capex")
                {
                    Caption = 'Head of Dept. Appr. Capex';
                    RunObject = Page 70155;
                }
                action("Head of Audit -Capex")
                {
                    Caption = 'Head of Audit -Capex';
                    RunObject = Page 70154;
                }
                action("GM Approval Capex")
                {
                    Caption = 'GM Approval Capex';
                    RunObject = Page 70156;
                }
                action("Managing Dir. Appr.-Capex")
                {
                    Caption = 'Managing Dir. Appr.-Capex';
                    RunObject = Page 70157;
                }
                action("Advance Payment Apprv. -Capex")
                {
                    Caption = 'Advance Payment Apprv. -Capex';
                    RunObject = Page 70159;
                }
                action("Bal/Full Payment Approval")
                {
                    Caption = 'Bal/Full Payment Approval';
                    RunObject = Page 70162;
                }
                action("Bal/Full Payment GM Appr. Capex")
                {
                    Caption = 'Bal/Full Payment GM Appr. Capex';
                    RunObject = Page 70124;
                }
                action("Bal/Full Payment MD Appr. Capex")
                {
                    Caption = 'Bal/Full Payment MD Appr. Capex';
                    RunObject = Page 70119;
                }
                action("Approved Capex")
                {
                    Caption = 'Approved Capex';
                    RunObject = Page 70158;
                }
                action("Payment Voucher -Capex")
                {
                    Caption = 'Payment Voucher -Capex';
                    RunObject = Page 70160;
                }
                action("Compliance Check -Capex")
                {
                    Caption = 'Compliance Check -Capex';
                    RunObject = Page 70161;
                }
                action("Advance Payment Capex")
                {
                    Caption = 'Advance Payment Capex';
                    RunObject = Page 70168;
                }
                action("Awaiting Bal Payment -Capex")
                {
                    Caption = 'Awaiting Bal Payment -Capex';
                    RunObject = Page 70167;
                }
                action("Balance/Full Payment")
                {
                    Caption = 'Balance/Full Payment';
                    RunObject = Page 70163;
                }
                action("Closed Capex")
                {
                    Caption = 'Closed Capex';
                    RunObject = Page 70164;
                }
            }
            group("Payment Process")
            {
                Caption = 'Payment Process';
                Image = Journals;
                action("Journal Voucher")
                {
                    Caption = 'Journal Voucher';
                    RunObject = Page 70011;
                }
                action("IOU Request")
                {
                    RunObject = Page 70030;
                }
                action("IOU Approved")
                {
                    RunObject = Page 70032;
                }
                action("Treated IOU")
                {
                    RunObject = Page 50376;
                }
                action("IOU Retirement")
                {
                    RunObject = Page 50204;
                }
                action("IOU Retirement Approved")
                {
                    RunObject = Page 70033;
                }
                action("Posted IOU Retirement")
                {
                    RunObject = Page 70034;
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
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;

                action("Posted Cash Receipts")
                {
                    Caption = 'Posted Cash Receipts';
                    RunObject = Page 70020;
                }
                action("Posted Cheque Receipts")
                {
                    Caption = 'Posted Cheque Receipts';
                    RunObject = Page "Posted Cheque Receipt List";
                }
                action("Posted e-Receipt")
                {
                    Caption = 'Posted e-Receipt';
                    RunObject = Page 70109;
                }
                action("Posted Cash Payment")
                {
                    Caption = 'Posted Cash Payment';
                    RunObject = Page 70022;
                }
                action("Posted Cheque Payment")
                {
                    Caption = 'Posted Cheque Payment';
                    RunObject = Page "Posted Cheque Payment List";
                }
                action("Posted e-Payment")
                {
                    Caption = 'Posted e-Payment';
                    RunObject = Page 70099;
                }
                action("Posted Journal Vouchers")
                {
                    Caption = 'Posted Journal Vouchers';
                    RunObject = Page 70024;
                }
                action("Posted Sales Invoice")
                {
                    Caption = 'Posted Sales Invoice';
                    RunObject = Page "Posted Sales Invoices";
                }
                action("Posted Sales Shipment")
                {
                    Caption = 'Posted Sales Shipment';
                    RunObject = Page "Posted Sales Shipments";
                }
                action("Posted Return Shipments")
                {
                    Caption = 'Posted Return Shipments';
                    RunObject = Page 6652;
                }
                action("Posted Sales Cr. Memo")
                {
                    Caption = 'Posted Sales Cr. Memo';
                    RunObject = Page "Posted Sales Credit Memos";
                }
                action("Posted Service Cr. Memo")
                {
                    Caption = 'Posted Service Cr. Memo';
                    RunObject = Page 144;
                }
            }
            group("Vehicle Delivery")
            {
                Caption = 'Vehicle Delivery';
                action(Customers)
                {
                    Caption = 'Customers';
                    Image = Customer;
                    RunObject = Page 22;
                }
                action("Warranty Coupon")
                {
                    Caption = 'Warranty Coupon';
                    RunObject = Page 70048;
                }
            }
            group("Human Resoures")
            {
                Caption = 'Human Resoures';
                Image = ReferenceData;
                action(Employee)
                {
                    Caption = 'Employee';
                    Image = Employee;
                    RunObject = Page 5201;
                }
                action("Blocked Employee")
                {
                    Caption = 'Blocked Employee';
                    RunObject = Page 70514;
                }
                action("Absence Registration")
                {
                    Caption = 'Absence Registration';

                    RunObject = Page 5212;
                }

                action("Planned Leave")
                {
                    Caption = 'Planned Leave';

                    RunObject = Page 50097;
                }
                action("Page Leave Request List")
                {
                    Caption = 'Leave Request';
                    Image = Item;
                    RunObject = Page 50604;
                }
                action("Page Approval Leave List")
                {
                    Caption = 'Leave Approval List';
                    RunObject = Page 50609;
                }
                action("HOD HR/Admin")
                {
                    Caption = 'HOD HR/Admin';
                    RunObject = Page 50610;
                }
                action("Page Approved Leave List")
                {
                    Caption = 'Leave Approved List';
                    RunObject = Page 50608;
                }
                action("MD Leave Approval List")
                {
                    Caption = 'MD Leave Approval List';
                    RunObject = Page 50607;
                }
                action("Treated Leave")
                {
                    Caption = 'Treated Leave';
                    RunObject = Page 50605;
                }
                action("Actual Leave")
                {
                    Caption = 'Actual Leave';
                    RunObject = Page 70055;
                }
                action("Employee Leave Analysis")
                {
                    Caption = 'Employee Leave Analysis';
                    RunObject = Page 70058;
                }

                action(Holidays)
                {
                    Caption = 'Holidays';
                    RunObject = Page 50317;
                }
                action(Purchase)
                {
                    Caption = 'Purchase';
                    RunObject = Page 9307;
                }
                action("Approved Leave Request")
                {
                    Caption = 'Approved Leave Request';
                    RunObject = Page 50605;
                }
            }
            group("AirOrder")
            {
                Caption = 'Air Order';
                action("Air Order")
                {
                    Caption = 'Air Order';
                    RunObject = Page 70210;
                }
                action("HOD Part Approval-AOO")
                {
                    Caption = 'HOD Part Approval-AOO';
                    RunObject = Page 70211;
                }
                action("Compliance Check AOO")
                {
                    Caption = 'Compliance Check AOO';
                    RunObject = Page 70212;
                }
                action("HOD Audit AOO")
                {
                    Caption = 'HOD Audit AOO';
                    RunObject = Page 70213;
                }
                action("GM List AOO")
                {
                    Caption = 'GM List AOO';
                    RunObject = Page 70214;
                }
                action("MD List AOO")
                {
                    Caption = 'MD List AOO';
                    RunObject = Page 70215;
                }
                action("Approved AOO")
                {
                    Caption = 'Approved AOO';
                    RunObject = Page 70216;
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
            group("Local Parts Purchase")
            {
                Caption = 'Local Parts Purchase';
                action(LPP)
                {
                    Caption = 'LPP';
                    RunObject = Page 70193;
                }
                action("HOD Part Approval")
                {
                    Caption = 'HOD Part Approval';
                    RunObject = Page 70194;
                }
                action("Compliance Check")
                {
                    Caption = 'Compliance Check';
                    RunObject = Page 70195;
                }
                action("HOD Audit")
                {
                    Caption = 'HOD Audit';
                    RunObject = Page 70196;
                }
                action("HOD Procurement Approval")
                {
                    Caption = 'HOD Procurement Approval';
                    RunObject = Page 70197;
                }
                action(GM)
                {
                    Caption = 'GM';
                    RunObject = Page 70198;
                }
                action(MD)
                {
                    Caption = 'MD';
                    RunObject = Page 70199;
                }
                action("MD Isolo")
                {
                    Caption = 'MD Isolo';
                    RunObject = Page 70217;
                }
                action("Departmental Float")
                {
                    Caption = 'Departmental Float';
                    RunObject = Page 70201;
                }
                action("Generate LPO")
                {
                    Caption = 'Generate LPO';
                    RunObject = Page 70204;
                }
                action("Print LPP LPO")
                {
                    Caption = 'Print LPP LPO';
                    RunObject = Page 70206;
                }
                action("Payment Approved")
                {
                    Caption = 'Payment Approved';
                    RunObject = Page 70202;
                }
                action("Payment Voucher")
                {
                    Caption = 'Payment Voucher';
                    RunObject = Page 70203;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = FiledPosted;

                action(ChangeModel)
                {
                    Caption = 'Change Model';
                    RunObject = xmlport "Change Model";
                }
                action(ChangeColour)
                {
                    Caption = 'Import Colour Changes';
                    Image = Import;
                    RunObject = xmlport "Modify Item Ledger Entry";
                }
                action(ExportColour)
                {
                    Caption = 'Export Colour Data (Excel)';
                    Image = Export;
                    RunObject = report "Export ILE Colour Excel";
                }


                action(SkipOpexQuote)
                {
                    Caption = 'Skip Opex Quotes';
                    RunObject = report "Skip Opex/Capex Quotes";
                }
                action(UnpostJournal)
                {
                    Caption = 'Unpost Journal';
                    RunObject = report "Unpost Journal";
                }
                action(IOUSendTo)
                {
                    Caption = 'IOU Send To';
                    RunObject = report "IOU Send To";
                }
                action(LeaveSendTo)
                {
                    Caption = 'Leave Send To';
                    RunObject = report "Leave Send To";
                }
                action(CapexSendTo)
                {
                    Caption = 'Opex/Capex Send To';
                    RunObject = report "Opex/Capex Send To";
                }
                action(SkipLeave)
                {
                    Caption = 'Skip Leave Controls';
                    RunObject = report "Skip Leave Controls";
                }
                action(UncheckPostedCOF)
                {
                    Caption = 'Uncheck Posted COF';
                    RunObject = report "Uncheck Posted COF";
                }
                action(UnDeliverCOF)
                {
                    Caption = 'Undeliver COF';
                    RunObject = report "Undeliver Customer Order";
                }
                action(ZeroPhysJnl)
                {
                    Caption = 'Zero Phys. Inventory Jnl.';
                    RunObject = report "Phys. Valuation Zeroing";
                }
                action(PriceTest)
                {
                    Caption = 'Price Test';
                    RunObject = report "Price Test";
                }
                action(UpdateVariant)
                {
                    Caption = 'Update Variant';
                    RunObject = report "Update Item Variant- SEA";
                }


            }
            group("View Payslip")
            {
                Caption = 'View Payslip';
                action("My Payslips")
                {
                    Caption = 'My Payslips';
                    RunObject = Page 50147;
                }
            }
            group(Inventory)
            {
                Caption = 'Inventory';
                Image = ReferenceData;
                action(Items)
                {
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page 31;
                }
                action("Page ISOLOItem List")
                {
                    Caption = 'Isolo Items';
                    RunObject = Page 70176;
                }
                action(Vendors)
                {
                    Caption = 'Vendors';
                    Image = Vendor;
                    RunObject = Page 27;
                }
                action("Transfer Order")
                {
                    Caption = 'Transfer Order';
                    RunObject = Page 5742;
                }
                action("TCSC Customers")
                {
                    Caption = 'TCSC Customers';
                    RunObject = Page "Customer List";
                }
                action("TCSC Sales Orders")
                {
                    Caption = 'TCSC Sales Orders';
                    RunObject = Page "Sales Orders";
                }
                action("Search Tracker")
                {
                    Caption = 'Search Tracker';
                    RunObject = Page 50118;
                }
                action("Stockkeping Unit")
                {
                    Caption = 'Stockkeping Unit';
                    RunObject = Page "Stockkeeping Unit List";
                }

                action("Parts by Model")
                {
                    Caption = 'Parts by Model';
                    RunObject = Page 50037;
                }
                action(Variants)
                {
                    Caption = 'Variants';
                    RunObject = Page 5401;
                }
                action(Locations)
                {
                    Caption = 'Locations';
                    Image = Warehouse;
                    RunObject = Page 15;
                }
                action("TNL Vehicle List")
                {
                    Caption = 'TNL Vehicle List';
                    RunObject = Page 70115;
                }
                action("Item Journals")
                {
                    Caption = 'Item Journals';
                    RunObject = Page 262;
                    RunPageView = WHERE("Template Type" = CONST(Item),
                                        Recurring = CONST(false));
                }
                action("Phys. Inventory Journals")
                {
                    Caption = 'Phys. Inventory Journals';
                    RunObject = Page 262;
                    RunPageView = WHERE("Template Type" = CONST("Phys. Inventory"),
                                        Recurring = CONST(false));
                }
            }
            group(Sales)
            {
                Caption = 'Sales';
                action(AllCustomers)
                {
                    Caption = 'Customers';
                    Image = Customer;
                    RunObject = Page 22;
                }
                action("Sales Order")
                {
                    Caption = 'Sales Order';
                    RunObject = Page 9305;
                }
                action("Sales Credit Memo")
                {
                    Caption = 'Sales Credit Memo';
                    RunObject = Page 9302;
                }
                action("Sales Quotes")
                {
                    Caption = 'Sales Quotes';
                    RunObject = Page 9300;
                }
            }
            group(Cash)
            {
                Caption = 'Cash';
                action("CashReceipt")
                {
                    Caption = 'Cash Receipt';
                    RunObject = Page "Cash Receipt List";
                }
                action("Cheque Receipt")
                {
                    Caption = 'Cheque Receipt';
                    RunObject = Page 70008;
                }
                action("e-Receipt")
                {
                    Caption = 'e-Receipt';
                    RunObject = Page 70107;
                }
                action("Cash Payment")
                {
                    Caption = 'Cash Payment';
                    RunObject = Page 70009;
                }
                action("Cheque Payment")
                {
                    Caption = 'Cheque Payment';
                    RunObject = Page 70010;
                }
                action("e-Payment")
                {
                    Caption = 'e-Payment';
                    RunObject = Page 70097;
                }
            }
            group("Job Card")
            {
                Caption = 'Job Card';
                action("Closed Job-Old")
                {
                    Caption = 'Closed Job-Old';
                    RunObject = Page 70076;
                }
                action("Closed Job-New")
                {
                    Caption = 'Closed Job-New';
                    RunObject = Page 80052;
                }
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("VRI in Progress")
            {
                Caption = 'VRI in Progress';
                Image = Document;
                RunObject = Page 50397;
            }
        }

    }

}

