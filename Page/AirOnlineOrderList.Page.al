page 70210 "Air Online Order List"
{
    CardPageID = "Air Online Order Card";
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Air Online Header";
    SourceTableView = WHERE(Send = CONST(false),
                            HoDPartApproval = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Requester Code"; Rec."Requester Code")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Profoma Invoice No:"; Rec."Profoma Invoice No:")
                {
                }
                field("Air Order Type"; Rec."Air Order Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

