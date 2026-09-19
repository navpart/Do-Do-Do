page 70055 "Acutal Leave List"
{
    ApplicationArea = All;
    CardPageID = "Actual Leave Card";
    PageType = List;
    SourceTable = "Leave Plan Lines Rev 2";
    SourceTableView = SORTING("Employee No.", "Leave Period", "Entry Type")
                      WHERE("Entry Type" = filter('ACTUAL'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Leave Period"; Rec."Leave Period")
                {
                }
                field("Annual Duration"; Rec."Annual Duration")
                {
                }
                field("Amount Due"; Rec."Amount Due")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Business Unit"; Rec."Business Unit")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Registered; Rec.Registered)
                {
                }
                field("Entry Type Filter"; Rec."Entry Type Filter")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                }
                field("Total Compassionate"; Rec."Total Compassionate")
                {
                }
                field("Total Exam"; Rec."Total Exam")
                {
                }
                field("Total Others"; Rec."Total Others")
                {
                }
                field("Total Consuming"; Rec."Total Consuming")
                {
                }
                field("Total Annual"; Rec."Total Annual")
                {
                }
                field("Total Commuted To Cash"; Rec."Total Commuted To Cash")
                {
                }
                field("Start Date1"; Rec."Start Date1")
                {
                }
                field("End Date1"; Rec."End Date1")
                {
                }
                field("No. Days1"; Rec."No. Days1")
                {
                }
                field("Start Date2"; Rec."Start Date2")
                {
                }
                field("End Date2"; Rec."End Date2")
                {
                }
                field("No. Days2"; Rec."No. Days2")
                {
                }
                field("Start Date3"; Rec."Start Date3")
                {
                }
                field("End Date3"; Rec."End Date3")
                {
                }
                field("No. Days3"; Rec."No. Days3")
                {
                }
                field("Start Date4"; Rec."Start Date4")
                {
                }
                field("End Date4"; Rec."End Date4")
                {
                }
                field("No. Days4"; Rec."No. Days4")
                {
                }
                field(Registered1; Rec.Registered1)
                {
                }
                field(Registered2; Rec.Registered2)
                {
                }
                field(Registered3; Rec.Registered3)
                {
                }
                field(Registered4; Rec.Registered4)
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Leave Category"; Rec."Leave Category")
                {
                }
                field(LeaveDate; Rec.LeaveDate)
                {
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                }
                field("Actual Duration"; Rec."Actual Duration")
                {
                }
                field("Period Filter"; Rec."Period Filter")
                {
                }
                field("Serial No"; Rec."Serial No")
                {
                }
                field("No Series"; Rec."No Series")
                {
                }
            }
        }
    }

    actions
    {
    }
}

