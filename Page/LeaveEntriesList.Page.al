page 50097 "Leave Entries List"
{
    ApplicationArea = All;
    CardPageID = "Leave Plan Card-1";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Leave Plan Lines Rev 2";
    SourceTableView = SORTING("Employee No.", "Leave Period", "Entry Type")
                      WHERE("Entry Type" = filter('PLAN'));

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
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                }
                field("Amount Due"; Rec."Amount Due")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
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


            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Leave Auto Generation")
            {
                Caption = '&Leave Auto Generation';
                action("Generate Leave Plan")
                {
                    Caption = 'Generate Leave Plan';
                    RunObject = Report "Leave PLan Updates";
                    ShortCutKey = 'Ctrl+G';

                    trigger OnAction()
                    var
                    //InteractTemplLanguage: Record "50022";
                    begin
                    end;
                }
            }
        }
    }
}

