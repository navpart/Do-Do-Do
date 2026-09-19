page 50314 "Employee CV"
{
    Caption = 'Employee Picture';
    PageType = Card;
    SourceTable = "Employee";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field("Curriculum Vitae"; Rec."Curriculum Vitae")
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&CV")
            {
                Caption = '&CV';
            }
        }
    }

    var
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        PictureExists: Boolean;
}

