page 51068 "Training Courses List"
{
    AutoSplitKey = false;
    CardPageID = "Employee Training";
    DelayedInsert = true;
    Editable = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Training Courses";
    ApplicationArea = All;
    Caption = 'Training Courses';
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Course Code"; Rec."Course Code")
                {
                }
                field("Course Type"; Rec."Course Type")
                {
                }

                field("Course Name"; Rec."Course Name")
                {
                }
                field("Training Group"; Rec."Training Group")
                {
                }
                field("Course Description"; Rec."Course Description")
                {
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                }
                field("Vendor name"; Rec."Vendor name")
                {
                }
                field(Time; Time)
                {
                }
                field("Course Start Date"; Rec."Course Start Date")
                {
                }
                field("Course Duration"; Rec."Course Duration")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field(Comment; Rec.Comment)
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
        area(navigation)
        {
            group("&Course")
            {
                Caption = '&Course';
                action("&Card")
                {
                    Caption = '&Card';
                    Image = EditLines;
                    //RunObject = Page 60034;
                }
                action(Attendance)
                {
                    Caption = 'Attendance';
                    RunObject = Page 50067;
                    RunPageLink = "Training Course Code" = FIELD("Course Code");
                }
            }
        }
    }
}

