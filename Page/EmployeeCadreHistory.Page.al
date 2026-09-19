page 50308 "Employee Cadre History"
{
    AutoSplitKey = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Employee Cadre History";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    Visible = false;
                }
                field(Activities; Rec.Activities)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("Previous Job Title"; Rec."Previous Job Title")
                {
                }
                field("New Job Title"; Rec."New Job Title")
                {
                }
                field("Previous Gross Salary"; Rec."Previous Gross Salary")
                {
                }
                field("New Gross Salary"; Rec."New Gross Salary")
                {
                }
                field(Remark; Rec.Remark)
                {
                }
            }
        }
    }

    actions
    {
    }
}

