namespace AL_TNL.AL_TNL;

using Microsoft.Service.Item;

page 50140 "App Service Item Card"
{
    ApplicationArea = All;
    Caption = 'App Service Item Card';
    PageType = Card;
    SourceTable = "Service Item";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
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
