page 50093 "Service CS"
{
    Caption = 'Service CS', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
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
            action(WarrantyCoupon)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Warranty Coupon';
                Image = ListPage;
                RunObject = page "Warranty Coupon4";
                ToolTip = 'View warranty coupons.';
            }
            action(Takata)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Takata Calls';
                Image = "Report";
                RunObject = page "Pending Takata Customer List";
                ToolTip = 'View pending Takata customer calls.';
            }
            action(ProsCustomers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Prospective Customers';
                Image = "Report";
                RunObject = page "Prospective Customer";
                ToolTip = 'View prospective Customers.';
            }
            action(KIVCustomers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'KIV Customer';
                Image = "Report";
                RunObject = page "KIV Customer";
                ToolTip = 'View KIV Customer.';
            }
            action(NotReach)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Not Reachable Customers';
                Image = "Report";
                RunObject = page "Not Reachable Customer";
                ToolTip = 'View not reachable customers.';
            }
            action(TCSCCustomers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'TCSC Customer';
                Image = "Report";
                RunObject = page "Customer List";
                RunPageView = WHERE("Location Code" = FILTER('120ISO'));
                ToolTip = 'View TCSC customers.';
            }

        }

    }
}


