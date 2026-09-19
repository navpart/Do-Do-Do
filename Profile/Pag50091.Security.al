page 50091 Security
{
    Caption = 'Security', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control106; "My Job Queue")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }

            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(MyPaySlips)
            {
                ApplicationArea = CostAccounting;
                Caption = 'My Payslips';
                RunObject = Page "My payslip";
                ToolTip = '';
            }
            action(WaybillDoc)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Waybill';
                Image = "Report";
                RunObject = page "Security Sales Order List";
                ToolTip = 'View posted sales shipment.';
            }
            

        }

    }
}


