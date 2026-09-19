page 50044 "Email Users List"
{
    ApplicationArea = All;
    Caption = 'Email Users List';
    PageType = List;
    SourceTable = "Email Users";
    UsageCategory = Lists;
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(User; Rec.User)
                {
                    ToolTip = 'Specifies the value of the User field.', Comment = '%';
                }
                field("Email "; Rec."Email")
                {
                    ToolTip = 'Specifies the value of the Email  field.', Comment = '%';
                }
                field(Select; Rec.Select)
                {
                    ToolTip = 'Specifies the value of the Select field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        EmailUsers: Record "Email Users";
    begin
        EmailUsers.SetRange(Select, true);
        if EmailUsers.FindFirst() then begin
            repeat
                EmailUsers.Select := false;
                EmailUsers.Modify();
            until EmailUsers.Next() = 0;

        end;

    end;
}
