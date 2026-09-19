namespace AL_TNL.AL_TNL;
using Microsoft.Sales.Reports;
using Microsoft.Sales.Customer;
using Microsoft.Finance.Analysis;
page 90019 "XMD Role Center"
{
    Caption = 'President', Comment = '{Dependency=Match,"ProfileDescription_PRESIDENT"}';
    PageType = RoleCenter;
    ApplicationArea = All;
    layout
    {
        area(rolecenter)
        {

        }
    }

    actions
    {
        area(reporting)
        {
            action("Recei&vables-Payables")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Recei&vables-Payables';
                Image = ReceivablesPayables;
                RunObject = Report 5;
                ToolTip = 'Perform bookkeeping tasks.';
            }
            action("&Trial Balance/Budget")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Trial Balance/Budget';
                Image = "Report";
                //RunObject = Report 9;
                ToolTip = 'View a trial balance in comparison to a budget. You can choose to see a trial balance for selected dimensions. You can use the report at the close of an accounting period or fiscal year.';
            }
            action("&Closing Trial Balancex")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Closing Trial Balance';
                Image = "Report";
                RunObject = Report 10;
                ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
            }
            action("&Fiscal Year Balancex")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report 36;
                ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
            }

            action("Customer - &Balancex")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - &Balance';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
                ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
            }
            action("Customer - T&op 10 List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - T&op 10 List';
                Image = "Report";
                //RunObject = Report "Customer - Top 10 List";
                ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
            }
            action("Customer - S&ales List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - S&ales List';
                Image = "Report";
                //RunObject = Report 119;
                ToolTip = 'View customer sales for a period, for example, to report sales activity to customs and tax authorities. You can choose to include only customers with total sales that exceed a minimum amount. You can also specify whether you want the report to show address details for each customer.';
            }
            action("Sales &Statistics")
            {
                ApplicationArea = Suite;
                Caption = 'Sales &Statistics';
                Image = "Report";
                //RunObject = Report "Sales Statistics";
                ToolTip = 'View customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.';
            }

            action("Vendor - &Purchase List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - &Purchase List';
                Image = "Report";
                RunObject = Report 309;
                ToolTip = 'View a list of your purchases in a period, for example, to report purchase activity to customs and tax authorities.';
            }
            action("&Account Schedulex")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Account Schedule';
                Image = "Report";
                RunObject = Report 25;
                ToolTip = 'Open an account schedule to analyze figures in general ledger accounts or to compare general ledger entries with general ledger budget entries.';
            }
            action("&G/L Trial Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&G/L Trial Balance';
                Image = "Report";
               // RunObject = Report 6;
                ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
            }
            action("&Bank Detail Trial Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Bank Detail Trial Balance';
                Image = "Report";
                RunObject = Report 1404;
                ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
            }
            action("&Account Schedule")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Account Schedule';
                Image = "Report";
                RunObject = Report 25;
                ToolTip = 'Open an account schedule to analyze figures in general ledger accounts or to compare general ledger entries with general ledger budget entries.';
            }
            action("Bu&dget")
            {
                ApplicationArea = Suite;
                Caption = 'Bu&dget';
                Image = "Report";
                RunObject = Report 8;
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }
            action("Trial Bala&nce/Budget")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Trial Bala&nce/Budget';
                Image = "Report";
                //RunObject = Report 9;
                ToolTip = 'View a trial balance in comparison to a budget. You can choose to see a trial balance for selected dimensions. You can use the report at the close of an accounting period or fiscal year.';
            }
            action("Trial Balance by &Period")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Trial Balance by &Period';
                Image = "Report";
                RunObject = Report 38;
                ToolTip = 'Show the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report 36;
                ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
            }
            action("Balance Comp. - Prev. Y&ear")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance Comp. - Prev. Y&ear';
                Image = "Report";
                RunObject = Report 37;
                ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
            }
            action("&Closing Trial Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Closing Trial Balance';
                Image = "Report";
                RunObject = Report 10;
                ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
            }

            action("Cash Flow Date List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Flow Date List';
                Image = "Report";
                RunObject = Report 846;
                ToolTip = 'View forecast entries for a period of time that you specify. The registered cash flow forecast entries are organized by source types, such as receivables, sales orders, payables, and purchase orders. You specify the number of periods and their length.';
            }

            action("Aged Accounts &Receivable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Accounts &Receivable';
                Image = "Report";
                //RunObject = Report 120;
                ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Aged Accounts Pa&yable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Accounts Pa&yable';
                Image = "Report";
                //RunObject = Report 322;
                ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Reconcile Cus&t. and Vend. Accs")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reconcile Cus&t. and Vend. Accs';
                Image = "Report";
                RunObject = Report 33;
                ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
            }

            action("&VAT Registration No. Check")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&VAT Registration No. Check';
                Image = "Report";
                RunObject = Report 32;
                ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report 31;
                ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
            }
            action("VAT &Statement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT &Statement';
                Image = "Report";
                RunObject = Report 12;
                ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
            }
            action("G/L - VAT Reconciliation")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'G/L - VAT Reconciliation';
                Image = "Report";
                RunObject = Report 11;
                ToolTip = 'Verify that the VAT amounts on the VAT statements match the amounts from the G/L entries.';
            }
            action("VAT - VIES Declaration Tax Aut&h")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT - VIES Declaration Tax Aut&h';
                Image = "Report";
                RunObject = Report 19;
                ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
            }
            action("VAT - VIES Declaration Dis&k")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT - VIES Declaration Dis&k';
                Image = "Report";
                RunObject = Report 88;
                ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
            }
            action("EC Sales &List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'EC Sales &List';
                Image = "Report";
                RunObject = Report 130;
                ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            }

              action("Cost Accounting P/L Statement")
            {
                ApplicationArea = CostAccounting;
                Caption = 'Cost Accounting P/L Statement';
                Image = "Report";
                RunObject = Report 1126;
                ToolTip = 'View the credit and debit balances per cost type, together with the chart of cost types.';
            }
            action("CA P/L Statement per Period")
            {
                ApplicationArea = CostAccounting;
                Caption = 'CA P/L Statement per Period';
                Image = "Report";
                RunObject = Report 1123;
                ToolTip = 'View profit and loss for cost types over two periods with the comparison as a percentage.';
            }
            action("CA P/L Statement with Budget")
            {
                ApplicationArea = CostAccounting;
                Caption = 'CA P/L Statement with Budget';
                Image = "Report";
                RunObject = Report 1133;
                ToolTip = 'View a comparison of the balance to the budget figures and calculates the variance and the percent variance in the current accounting period, the accumulated accounting period, and the fiscal year.';
            }
            action("Cost Accounting Analysis")
            {
                ApplicationArea = CostAccounting;
                Caption = 'Cost Accounting Analysis';
                Image = "Report";
                RunObject = Report 1127;
                ToolTip = 'View balances per cost type with columns for seven fields for cost centers and cost objects. It is used as the cost distribution sheet in Cost accounting. The structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
            }
        }
        area(embedding)
        {
            action("Account Schedules")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Account Schedules';
                RunObject = Page 103;
                ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
            }
            action(Budgetsx)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Budgets';
                RunObject = Page Budget;
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }
            action("Analysis by Dimensions")
            {
                ApplicationArea = Dimensions;
                Caption = 'Analysis by Dimensions';
                Image = AnalysisViewDimension;
                RunObject = Page 556;
                ToolTip = 'View amounts in G/L accounts by their dimension values and other filters that you define in an analysis view and then show in a matrix window.';
            }
            action("Sales Analysis Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Analysis Report';
                RunObject = Page 9376;
                RunPageView = WHERE("Analysis Area" = FILTER(Sales));
                ToolTip = 'Analyze the dynamics of your sales according to key sales performance indicators that you select, for example, sales turnover in both amounts and quantities, contribution margin, or progress of actual sales against the budget. You can also use the report to analyze your average sales prices and evaluate the sales performance of your sales force.';
            }
            action("Sales Budgets")
            {
                ApplicationArea = SalesBudget;
                Caption = 'Sales Budgets';
                RunObject = Page 7132;
                RunPageView = WHERE("Analysis Area" = FILTER(Sales));
                ToolTip = 'Enter item sales values of type amount, quantity, or cost for expected item sales in different time periods. You can create sales budgets by items, customers, customer groups, or other dimensions in your business. The resulting sales budgets can be reviewed here or they can be used in comparisons with actual sales data in sales analysis reports.';
            }
            action("Sales Quotes")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quotes';
                Image = Quote;
                RunObject = Page 9300;
                ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page 9305;
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page 9301;
                ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
            }
            action(Customersx)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Contacts)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page 5052;
                ToolTip = 'View a list of all your contacts.';
            }
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page 16;
                ToolTip = 'View the chart of accounts.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page 27;
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page 27;
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Orders';
                RunObject = Page 9307;
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(Budgets)
            {
                ApplicationArea = Suite;
                Caption = 'Budgets';
                RunObject = Page 121;
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page 371;
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action("VAT Statements")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT Statements';
                RunObject = Page 320;
                ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page 31;
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page 22;
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action("Managing Dir. Appr.-Capex")
            {
                Caption = 'Managing Dir. Appr.-Capex';
                RunObject = Page 70157;
            }
            action("Balance/Full Payment Capex MDx")
            {
                Caption = 'Balance/Full Payment Capex MD';
                RunObject = Page 70119;
            }
            action("Managing Dir. Appr")
            {
                Caption = 'Managing Dir. Appr.-Opex';
                RunObject = Page 70133;
            }
            action("Bal/Full Payment Opex MD")
            {
                Caption = 'Bal/Full Payment Opex MD';
                RunObject = Page 70186;
            }
            action("<Leave MD Approval List>")
            {
                Caption = 'MD Leave Approval List';
                RunObject = Page 50607;
            }
            action("MD Procurement Approval")
            {
                Caption = 'Local Purchases';
                RunObject = Page 70199;
            }
            action("Local Part Purchases - Isolo")
            {
                Caption = 'Local Part Purchases - Isolo';
                RunObject = Page 70217;
            }
            action("Air Orderx")
            {
                Caption = 'Air Order';
                RunObject = Page 70215;
            }
        }
        area(sections)
        {
            group("Fixed Assetsx")
            {
                Caption = 'Fixed Assets';
                Image = FixedAssets;
                action("Fixed Assets")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets';
                    RunObject = Page 5601;
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
            }
            group(Opex)
            {
                Caption = 'Opex';
                action("Managing Dir. Approval")
                {
                    Caption = 'Managing Dir. Appr-Opex';
                    RunObject = Page 70133;
                }
                action("Balance/Full Payment Opex MD")
                {
                    Caption = 'Balance/Full Payment Opex MD';
                    RunObject = Page 70186;
                }
            }
            group(Capex)
            {
                Caption = 'Capex';
                action("Managing Dir. Appr-Capex")
                {
                    Caption = 'Managing Dir. Appr-Capex';
                    RunObject = Page 70157;
                }
                action("Balance/Full Payment Capex MD")
                {
                    RunObject = Page 70119;
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
                action("<Page MD Approvals>")
                {
                    Caption = 'MD Leave Approval List';
                    RunObject = Page 50607;
                }
            }
            group("Air Order")
            {
                Caption = 'Air Order';
                action("MD List AOO")
                {
                    Caption = 'MD List AOO';
                    RunObject = Page 70215;
                }
            }
            group("Local Parts Purchase")
            {
                Caption = 'Local Parts Purchase';
                action(MD)
                {
                    Caption = 'MD';
                    RunObject = Page 70199;
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
                    //RunObject = Page 70021;
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
                    //RunObject = Page 70023;
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
            group(Cash)
            {
                Caption = 'Cash';
                action("Cash Receipt")
                {
                    Caption = 'Cash Receipt';
                    //RunObject = Page 70007;
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
        }
    }
}

