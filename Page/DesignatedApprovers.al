namespace AL_TNL.AL_TNL;

page 50065 "Designated Approvers"
{
    ApplicationArea = All;
    Caption = 'Designated Approvers';
    PageType = Card;
    SourceTable = "Designated Approvers";
    UsageCategory = Administration;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Audit; Rec.Audit)
                {
                    ToolTip = 'Specifies the value of the Audit field.', Comment = '%';
                }
                field(Finance; Rec.Finance)
                {
                    ToolTip = 'Specifies the value of the Finance field.', Comment = '%';
                }
                field(IT; Rec.IT)
                {
                    ToolTip = 'Specifies the value of the IT field.', Comment = '%';
                }
                field(Logistics; Rec.Logistics)
                {
                    ToolTip = 'Specifies the value of the Logistics field.', Comment = '%';
                }
                field(Marketing; Rec.Marketing)
                {
                    ToolTip = 'Specifies the value of the Marketing field.', Comment = '%';
                }
                field("Payment Notifications"; Rec."Payment Notifications")
                {
                    MultiLine = true;
                }
                field("Logistics Notifications"; Rec."Logistics Notifications")
                {
                    MultiLine = true;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;


    end;
}
