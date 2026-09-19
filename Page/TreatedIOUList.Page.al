page 50376 "Treated IOU List"
{
    ApplicationArea = All;
    CardPageID = "Treated IOU Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "IOU Register";
    SourceTableView = SORTING("IOU No.")
                      WHERE(Posted = FILTER(false),
                            Treated = FILTER(True));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Collected By"; Rec."Collected By")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Expected Retirement Date"; Rec."Expected Retirement Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        IOURegister: Record 50105;
        PaymentRec: Record 50103;
        PaymentLine: Record 50104;
        IOURegister2: Record 50105;
        LineNo: Integer;
}

