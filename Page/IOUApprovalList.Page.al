page 50434 "IOU Approval List"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "IOU Register";
    SourceTableView = SORTING("IOU No.")
                      WHERE(Posted = FILTER(false),
                            Treated = FILTER(false),
                            "Final Apprv. Status" = FILTER(<> 'Approved'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("IOU No."; Rec."IOU No.")
                {
                }
                
                field(Description; Rec.Description)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Account No.";Rec."Account No.")
                {

                }
                field("Account Name";Rec."Account Name")
                {
                    
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OK)
            {
                Caption = 'OK';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Page 50433;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        xRec := Rec;
        UserSetUp.GET(USERID);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec := Rec;
        UserSetUp.GET(USERID);
    end;

    trigger OnOpenPage()
    begin
        UserSetUp.GET(USERID);
        //SETRANGE("Current pending Person",USERID);
    end;

    var
        UserSetUp: Record "User Setup";

}

