page 50296 "Payroll Survey"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Payroll-Periods.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code"; Rec."Period Code")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field("Mid Month"; Rec."Mid Month")
                {
                }
                field(Closed; Rec.Closed)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Create Pay Period")
            {
                Caption = '&Create Pay Period';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 50044;
            }
        }
    }
}

