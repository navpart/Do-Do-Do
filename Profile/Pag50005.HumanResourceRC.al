page 50005 "HR RC"
{
    Caption = 'Human Resources', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Team Member")
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
            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }

            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(reporting)
        {



        }
        area(embedding) //needed
        {

            action(MyPaySlips)
            {
                ApplicationArea = CostAccounting;
                Caption = 'My Payslips';
                RunObject = Page "My payslip";
                ToolTip = '';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
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
            action(PurchCrMemo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Credit Memo';
                RunObject = Page "Purchase Credit Memos";
            }
            action(PostedPurch)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Purchase Invoices';
                RunObject = Page "Posted Purchase Invoices";
            }
            action(PostedPurchRcpts)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Purchase Receipts';
                RunObject = Page "Posted Purchase Receipts";
            }

            action(PostedPurchCrMemo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Purchase Credit Memos';
                RunObject = Page "Posted Purchase Credit Memos";
            }
            action(PostedRetrunRcpt)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Return Receipts';
                RunObject = Page "Posted Return Receipts";
            }
            action("Incoming Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents';
                Image = Documents;
                RunObject = Page "Incoming Documents";
                ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
            }


        }
        area(sections) //modules
        {



            group(Action172)
            {
                Caption = 'Employees';
                action("Employees")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List";
                }

                action("BlockedEmployee")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Blocked Employee';
                    Image = Journal;
                    RunObject = Page "Blocked Employee List";
                    ToolTip = 'View blocked employee list.';
                }
                action("Absence Registration")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";

                }
                action("Planned Leave")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Plan';
                    Image = CalculateCalendar;
                    RunObject = Page "Leave Entries List";
                    ToolTip = 'Plan your annual leave.';
                }
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
                action("HODHR")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Approval- HR';
                    Image = Calendar;
                    RunObject = Page "HOD HR/ADMIN LIST";
                    ToolTip = 'Approve leave applications.';
                }
                action("LeaveApproved")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Treated Leave Request';
                    Image = CalculateCalendar;
                    RunObject = Page "Treated Leave Request";
                    ToolTip = 'View treated leave request.';
                }
                action("Approved Leave")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Leave Approved';
                    Image = Calendar;
                    RunObject = Page "Approved Leave List";
                    ToolTip = 'View approved leave applications.';
                }
                action("Actual Leave")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Actual Leave';
                    Image = CalculateCalendar;
                    RunObject = Page "Acutal Leave List";
                    ToolTip = 'Plan your annual leave.';
                }
                 action(TrainingList)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Training Courses';
                    RunObject = page "Training Courses List";
                }


                group("Group1")
                {
                    Caption = 'Reports';
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }
                }

            }

            group(Group2)
            {
                Caption = 'Setup';
                action("Human Resources Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Setup';
                    RunObject = page "Human Resources Setup";
                }
                action("Human Resources Units of Measu")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Units of Measure';
                    RunObject = page "Human Res. Units of Measure";
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Inactivity';
                    RunObject = page "Causes of Inactivity";
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Grounds for Termination';
                    RunObject = page "Grounds for Termination";
                }
                action("Unions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Unions';
                    RunObject = page "Unions";
                }
                action("Employment Contracts")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employment Contracts';
                    RunObject = page "Employment Contracts";
                }
                action("Relatives")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Relatives';
                    RunObject = page "Relatives";
                }
                action("Misc. Articles")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Misc. Articles';
                    RunObject = page "Misc. Articles";
                }
                action("Confidential")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Confidential';
                    RunObject = page "Confidential";
                }
                action("Qualifications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Qualifications';
                    RunObject = page "Qualifications";
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Statistics Groups';
                    RunObject = page "Employee Statistics Groups";
                }
                action(HolidaysPage)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Holidays';
                    Image = CalculateCalendar;
                    RunObject = Page Holidays;
                    ToolTip = 'Plan annual holidays.';
                }
               


            }

            group(FuelMgt)
            {
                Caption = 'Fuel';
                action(FuelPurchase)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Order';
                    Image = Purchase;
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'View purchase orders.';
                }
                action(FuelReturn)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Credit Memo';
                    Image = Purchase;
                    RunObject = Page "Purchase Credit Memos";
                    ToolTip = 'View purchase credit memos.';
                }
                action("NewVehicle")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'New Vehicle';
                    Image = FaultDefault;
                    RunObject = Page "New Vehicle Fuel List";
                    ToolTip = 'View treated IOUs.';
                }
                action("FAFuelList")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Fixed Asset';
                    Image = FaultDefault;
                    RunObject = Page "Fixed Asset Fuel List";
                    ToolTip = 'View treated IOUs.';
                }

                action("StaffFuelList")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff';
                    Image = FaultDefault;
                    RunObject = Page "Staff Fuel List";
                    ToolTip = 'View treated IOUs.';
                }
                action(VendorsFuel)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    Image = FaultDefault;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View vendor list.';
                }
                action(PostedFuel)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Fuel';
                    Image = List;
                    RunObject = Page "Posted Fuel List";
                    ToolTip = 'View location list.';
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
                    Caption = 'Closed Capex';
                    RunObject = Page "Closed Capex";

                }

            }



            group(Stores)
            {
                Caption = 'Stores';

                action("StoreReq")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Store Requisition';
                    RunObject = Page "Stores Requisition List";
                }

                action("PostedStoreReq")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Posted Store Requisition';
                    RunObject = Page "Posted Stores Requisition List";
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

        }


        area(processing)
        {

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
