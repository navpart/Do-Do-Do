page 50062 "Leave Roster Summary"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Leave Roster Summary";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Code"; Rec."Leave Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Total Duration"; Rec."Total Duration")
                {
                }
                field("Business Unit Filter"; Rec."Business Unit Filter")
                {
                }
                field("Global Dimension 1 Filter"; Rec."Global Dimension 1 Filter")
                {
                }
                field("Global Dimension 2 Filter"; Rec."Global Dimension 2 Filter")
                {
                }
                field("Employee No. Filter"; Rec."Employee No. Filter")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    trigger OnOpenPage()
    begin
        Rec.INIT;
        REc."Leave Code" := Rec."Leave Code"::PLAN;
        IF Rec.INSERT THEN;

        Rec.INIT;
        Rec."Leave Code" := REc."Leave Code"::ACTUAL;
        IF Rec.INSERT THEN;
    end;

    var
        ii: Integer;
}

