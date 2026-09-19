page 70512 "Back Order List"
{
    PageType = List;
    SourceTable = "Customer Order LineX";
    SourceTableView = WHERE("Stock Status" = FILTER('Not Available' | 'Not Established' | 'Local Part Purch'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Quantity Available"; Rec."Quantity Available")
                {
                }
                field("Stock Status"; Rec."Stock Status")
                {
                }
                field("Job Instruction No."; Rec."Job Instruction No.")
                {
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                }
            }
        }
    }

    actions
    {
    }
}

