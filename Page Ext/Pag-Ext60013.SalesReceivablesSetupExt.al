namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Setup;

pageextension 60013 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(content)
        {
            group(CustomFastTab)
            {
                Caption = 'Custom Settings';

                field("Loss Sales Nos."; Rec."Loss Sales Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for loss sales.';
                }
                field("Auto Sale Invoice No."; Rec."Auto Sale Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for auto sale invoices.';
                }
                field("Vehicle Delivery Lapse Period"; Rec."Vehicle Delivery Lapse Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle delivery lapse period.';
                }
                field("Warranty Claim No."; Rec."Warranty Claim No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for warranty claims.';
                }
                field("Warranty Claim Defaulty Acct."; Rec."Warranty Claim Defaulty Acct.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default account for warranty claims.';
                }
                field("Customer Order No."; Rec."Customer Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for customer orders.';
                }
                field("Job Instruction No."; Rec."Job Instruction No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the job instruction number.';
                }
                field("Customer Order No. GN"; Rec."Customer Order No. GN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for customer orders (GN).';
                }
                field("Warranty Materia Refund Acct."; Rec."Warranty Materia Refund Acct.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account for warranty material refunds.';
                }
                field("Warranty Settlement Acct."; Rec."Warranty Settlement Acct.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account for warranty settlements.';
                }
                field("Spare Parts Fixed Cost Markup%"; Rec."Spare Parts Fixed Cost Markup%")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fixed cost markup percentage for spare parts.';
                }
                field("SP Fixed Exch. Rate USD"; Rec."SP Fixed Exch. Rate USD")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fixed exchange rate for USD.';
                }
                field("SP Fixed Exch. Rate JPY"; Rec."SP Fixed Exch. Rate JPY")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fixed exchange rate for JPY.';
                }
                field("SP Fixed Exch. Rate CNY"; Rec."SP Fixed Exch. Rate CNY")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fixed exchange rate for CNY.';
                }
                field("SP Fixed Exch. Rate ZAR"; Rec."SP Fixed Exch. Rate ZAR")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fixed exchange rate for ZAR.';
                }
                
                field("Appointment Nos."; Rec."Appointment Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for appointments.';
                }
                field("Estimate Nos."; Rec."Estimate Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for estimates.';
                }
                field("Repair Order Nos."; Rec."Repair Order Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for repair orders.';
                }
                field("Appointment BP Nos."; Rec."Appointment BP Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for appointment BP.';
                }
                field("CC Emails"; Rec."CC Emails")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the CC email addresses.';
                }

            }
        }
    }
}
