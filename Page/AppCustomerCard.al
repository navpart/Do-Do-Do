namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Service.Document;
using Microsoft.Service.History;

page 50137 "App Customer Card"
{
    ApplicationArea = All;
    Caption = 'App Customer Card';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the customer.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Related")
            {
                Caption = 'Related';

                action("Service Items")
                {
                    ApplicationArea = All;
                    Caption = 'Service Items';
                    Image = ServiceItem;
                    RunObject = Page "App Service Item List";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View service items for this customer.';
                }
                action("Sales Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    ToolTip = 'View sales orders for this customer.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    ToolTip = 'View posted sales invoices for this customer.';
                }
                action("Service Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View service orders for this customer.';
                }
                action("Posted Service Invoices")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Service Invoices';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Service Invoices";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View posted service invoices for this customer.';
                }
            }
        }
    }
}
