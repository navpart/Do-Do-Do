page 70129 "Head of Audit Appr."
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    PageType = List;
    Editable = false;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Head of Department" = CONST(Approved),
                            "Head of Audit" = FILTER('<> Approved'),
                            Reject = CONST(false),
                            "Document Type" = CONST(Opex));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Opex No.';
                }
                field(Date; Rec.Date)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Head of Department"; Rec."Head of Department")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

