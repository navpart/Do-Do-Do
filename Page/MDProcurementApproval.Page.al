page 70199 "MD Procurement Approval"
{
    ApplicationArea = All;
    CardPageID = "LPP Card2";
    PageType = List;
    SourceTable = "Local Part Purchase Register";
    SourceTableView = WHERE("Procurement Approved" = CONST(false),
                            "GM Approval" = CONST(false),
                            "MD Approval" = CONST(true),
                            "Genarate LPO" = CONST(false),
                            Rejected = CONST(false),
                            "Compliance check" = CONST(Satisfactory),
                            "Head of Audit" = CONST(Approved),
                            "Total Purchase Value" = FILTER(> 499999),
                            "Order Type" = FILTER(<> 'Isolo Store'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("LPP No."; Rec."LPP No.")
                {
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
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Justification for purchase"; Rec."Justification for purchase")
                {
                }
                field("Total Purchase Value"; Rec."Total Purchase Value")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        ProcurementHeader: Record 70008;
}

