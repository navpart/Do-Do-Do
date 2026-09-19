page 50236 "Fault Material Setup List."
{
    DeleteAllowed = false;
    InsertAllowed = true;
    Editable = true;
    PageType = List;
    CardPageId = "Fault Material Card";
    SourceTable = "Fault Setup Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
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
        /*   area(navigation)
          {
              action("Open Card")
              {
                  Caption = 'Open Card';
                  Image = GetEntries;
                  Promoted = true;
                  //RunObject = Page "Request For Quote card";
                  RunPageOnRec = true;
                  ShortCutKey = 'Shift+F7';
              }
          } */
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

