page 50143 "Terminal Informations"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Terminal Informations";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Device ID"; Rec."Device ID")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Device IP"; Rec."Device IP")
                {
                }
                field("Device No."; Rec."Device No.")
                {
                }
                field("Use Device IP"; Rec."Use Device IP")
                {
                }
                field(Disabled; Rec.Disabled)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        IF CurrPage.LOOKUPMODE THEN CurrPage.EDITABLE := FALSE;
    end;
}

