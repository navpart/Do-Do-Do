page 70213 "Head of Audit Approval FM"
{
    CardPageID = "Air Online Order Card";
    Editable = false;
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Air Online Header";
    SourceTableView = WHERE(Send = CONST(true),
                            "Head of Department" = CONST(Approved),
                            "Compliance check" = CONST(Satisfactory),
                            "Head of Audit" = FILTER(' '));

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
            }
        }
    }

    actions
    {
    }
}

