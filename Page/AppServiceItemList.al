namespace AL_TNL.AL_TNL;

using Microsoft.Service.Item;

page 50138 "App Service Item List"
{
    ApplicationArea = All;
    Caption = 'App Service Item List';
    PageType = List;
    SourceTable = "Service Item";
    UsageCategory = Lists;
    CardPageId = "App Service Item Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the service item number.';
                }
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
            }
        }
    }
}
