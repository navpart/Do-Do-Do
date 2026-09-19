namespace AL_TNL.AL_TNL;

page 50099 "Fault Material Setup Lookup"
{
    ApplicationArea = All;
    Caption = 'Fault Material Setup';
    PageType = List;
    Editable = false;
    CardPageId = "Fault Material Card";
    SourceTable = "Fault Setup Header";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action(FaultList)
            {
                ApplicationArea = All;
                Caption = 'Advanced View';
                Image = CustomerList;
                ToolTip = 'Open the Faults page showing all possible columns. ';

                trigger OnAction()
                var
                    FaultList: Page "Fault Material Setup List";
                begin
                    FaultList.SetTableView(Rec);
                    FaultList.SetRecord(Rec);
                    FaultList.LookupMode := true;
                    if FaultList.RunModal() = ACTION::LookupOK then begin
                        FaultList.GetRecord(Rec);
                        CurrPage.Close();
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(FaultList_Promoted; FaultList)
                {
                }
            }
        }
    }
}
