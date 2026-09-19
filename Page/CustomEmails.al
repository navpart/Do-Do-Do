namespace AL_TNL.AL_TNL;

page 50179 "Custom Emails"
{
    ApplicationArea = All;
    Caption = 'Custom Emails';
    PageType = Card;
    SourceTable = "Custom Emails";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Finance/Accounts"; Rec."Finance/Accounts")
                {
                    ToolTip = 'Specifies the value of the Finance/Accounts field.', Comment = '%';
                }
                field("BNP Email"; Rec."BNP Email")
                {
                    ToolTip = 'Specifies the value of the BNP Email field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Initialize)
            {
                Image = Insert;
                Caption = 'Initialize Setup';
                ApplicationArea = All;


                trigger OnAction()
                var
                    CustomEmails: Record "Custom Emails";
                begin
                    CustomEmails.SetRange("Primary Key");
                    if CustomEmails.FindFirst() then
                        exit;

                    Rec.Init();
                    Rec."Primary Key" := '';
                    Rec.Insert();
                end;
            }
        }
    }
}
