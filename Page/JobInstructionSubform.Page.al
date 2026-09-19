page 80012 "Job Instruction Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order LineX";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                }
                field(Results; Rec.Results)
                {
                }
                field("Stock Status"; Rec."Stock Status")
                {
                }
                field(ETA; Rec.ETA)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CustOnAfterGetCurrRecord;
    end;

    var
        CustOrderLine: Record 50122;
        CustOrderRec: Record 50119;

        "Unit CostEditable": Boolean;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec."No." = 'SUBLET' THEN
            "Unit CostEditable" := TRUE ELSE
            "Unit CostEditable" := FALSE;
    end;
}

