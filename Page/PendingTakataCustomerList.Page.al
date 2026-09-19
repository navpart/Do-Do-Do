page 70504 "Pending Takata Customer List"
{
    CardPageID = "Takata Customer Card";
    PageType = List;
    SourceTable = "Takata Customer";
    SourceTableView = WHERE(Email = FILTER(''),
                            "KIV Customer" = FILTER(false),
                            "Not Reachable" = FILTER(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Registration. No"; Rec."Registration. No")
                {
                }
                field("Chassis No"; Rec."Chassis No")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Mobile No"; Rec."Mobile No")
                {
                }
                field("Vehicle Make Name"; Rec."Vehicle Make Name")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Date of Call"; Rec."Date of Call")
                {
                }
                field("Call Result"; Rec."Call Result")
                {
                }
                field("Call Purpose"; Rec."Call Purpose")
                {
                }
                field("KIV Customer"; Rec."KIV Customer")
                {
                }
            }
        }
    }

    actions
    {
    }
}

