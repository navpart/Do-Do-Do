namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Archive;

page 50101 "Sales Order List TCSC"
{
    ApplicationArea = All;
    Caption = 'Sales Order TCSC';
    PageType = List;
    SourceTable = "Sales Header Archive";
    SourceTableView = WHERE("Document Type" = CONST(Order), "Location Code" = CONST('120ISO'));
    UsageCategory = None;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.', Comment = '%';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.', Comment = '%';
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Sell-to Post Code field.', Comment = '%';
                }
                field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Sell-to Country/Region Code field.', Comment = '%';
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ToolTip = 'Specifies the value of the Sell-to Contact field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the location where the items are to be placed when they are received. This field acts as the default location for new lines. Location code for individual lines can differ from it.';
                }
            }
        }
    }
}
