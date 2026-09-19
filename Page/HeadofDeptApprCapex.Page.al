page 70155 "Head of Dept. Appr.-Capex"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = FILTER(Capex),
                            Send = FILTER('Yes'),
                            "Head of Department" = FILTER(<> Approved),
                            Reject = FILTER('No'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("No."; Rec."No.")
                {
                    Caption = 'Capex No.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                    Caption = 'Requester';
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field(Vendor; Rec.Vendor)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //UserSetup.GET(USERID);
        //SETFILTER("Department Code",UserSetup.Department);
    end;

    var
        UserSetup: Record "User Setup";
}

