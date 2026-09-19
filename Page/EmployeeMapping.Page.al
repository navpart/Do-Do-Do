page 50391 "Employee Mapping"
{
    PageType = Card;
    SourceTable = "Employee Mapping";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                }
                field(Name;Rec.Name)
                {
                    Editable = false;
                }
                field("TnA ID";Rec."TnA ID")
                {
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                    Caption = 'Department';
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch';
                }
                field(Designation;Rec.Designation)
                {
                    Editable = false;
                }
                field("Date Filter";Rec."Date Filter")
                {
                    Editable = false;
                }
                field("Mins Worked";Rec."Mins Worked")
                {
                    Editable = false;
                }
                field("Mins Not Worked";Rec."Mins Not Worked")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

