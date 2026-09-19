namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Customer;

page 50136 "App Customer List"
{
    ApplicationArea = All;
    Caption = 'App Customer List';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Lists;
    CardPageId = "App Customer Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
}
