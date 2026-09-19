namespace AL_TNL.AL_TNL;

using Microsoft.Service.Pricing;

page 50086 "Service Costs List"
{
    ApplicationArea = All;
    Caption = 'Service Costs List';
    PageType = List;
    SourceTable = "Service Cost";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code for the service cost.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the general ledger account number to which the service cost will be posted.';
                }
                field("Cost Type"; Rec."Cost Type")
                {
                    ToolTip = 'Specifies the cost type.';
                }
                field("Dealer Factor"; Rec."Dealer Factor")
                {
                    ToolTip = 'Specifies the value of the Dealer Factor field.', Comment = '%';
                }
                field("Dealer Hourly Rate"; Rec."Dealer Hourly Rate")
                {
                    ToolTip = 'Specifies the value of the Dealer Hourly Rate field.', Comment = '%';
                }
                field("Default Quantity"; Rec."Default Quantity")
                {
                    ToolTip = 'Specifies the default quantity that is copied to the service lines containing this service cost.';
                }
                field("Default Unit Cost"; Rec."Default Unit Cost")
                {
                    ToolTip = 'Specifies the default unit cost that is copied to the service lines containing this service cost.';
                }
                field("Default Unit Price"; Rec."Default Unit Price")
                {
                    ToolTip = 'Specifies the default unit price of the cost that is copied to the service lines containing this service cost.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the service cost.';
                }
                field("Duration in Hrs"; Rec."Duration in Hrs")
                {
                    ToolTip = 'Specifies the value of the Duration in Hrs field.', Comment = '%';
                }
                field("Flat Rate"; Rec."Flat Rate")
                {
                    ToolTip = 'Specifies the value of the Flat Rate field.', Comment = '%';
                }
                field("Job Type"; Rec."Job Type")
                {
                    ToolTip = 'Specifies the value of the Job Type field.', Comment = '%';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
                field("Model Description"; Rec."Model Description")
                {
                    ToolTip = 'Specifies the value of the Model Description field.', Comment = '%';
                }
                field("Model Year"; Rec."Model Year")
                {
                    ToolTip = 'Specifies the value of the Model Year field.', Comment = '%';
                }
                field(Operations; Rec.Operations)
                {
                    ToolTip = 'Specifies the value of the Operations field.', Comment = '%';
                }
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                    ToolTip = 'Specifies the code of the service zone, to which travel applies if the Cost Type is Travel.';
                }
            }
        }
    }
}
