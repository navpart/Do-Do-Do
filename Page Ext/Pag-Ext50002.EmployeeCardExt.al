pageextension 50002 "Employee Card Ext" extends "Employee Card"
{

    layout
    {
        addafter(Payments)
        {
            group(Others)
            {
                group(Cost)
                {
                    field("Basic Salary"; Rec."Basic Salary")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Annual Tax Freepay"; Rec."Annual Tax Freepay")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Tax Paid YTD B/F"; Rec."Tax Paid YTD B/F")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Gross Taxable YTD B/F"; Rec."Gross Taxable YTD B/F")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Tax FreePay YTD B/F"; Rec."Tax FreePay YTD B/F")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Last Salary"; Rec."Last Salary")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Yearly Furniture Allowance"; Rec."Yearly Furniture Allowance")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Yearly Housing Allowance"; Rec."Yearly Housing Allowance")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Yearly A/C Allowance"; Rec."Yearly A/C Allowance")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Training Cost"; Rec."Training Cost")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Hospital Cost"; Rec."Hospital Cost")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Medical Reimbursed Cost"; Rec."Medical Reimbursed Cost")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Overall Medical Cost"; Rec."Overall Medical Cost")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("MEdical cost Limit"; Rec."MEdical cost Limit")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field(EDAmount; Rec.EDAmount)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Emolument EDAmount"; Rec."Emolument EDAmount")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }

                group(Leave)
                {
                    field("Leave Grade"; Rec."Leave Grade")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Annual Leave Duration"; Rec."Annual Leave Duration")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
                group(Posting)
                {
                    field("Posting Group"; Rec."Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Employee Group"; Rec."Employee Group")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Employee Emolument Group"; Rec."Employee Emolument Group")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Acct. type"; Rec."Acct. type")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Acct. No"; Rec."Acct. No")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Mode of payment"; Rec."Mode of payment")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field(Bank; Rec.Bank)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Bank Account"; Rec."Bank Account")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("NHF Number"; Rec."NHF Number")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("NSITF Number"; Rec."NSITF Number")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }

            }
        }

        addafter(Gender)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
            }
            field(Designation; Rec.Designation)
            {
                ApplicationArea = All;
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;
            }
        }

    }
}
