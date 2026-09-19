namespace AL_TNL.AL_TNL;

page 50102 "e-Invoice Setup"
{
    ApplicationArea = All;
    Caption = 'e-Invoice Setup';
    PageType = Card;
    SourceTable = "e-Invoice Setup";
    UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(PubKey; Rec.PubKey)
                {
                    ToolTip = 'Specifies the value of the PubKey field.', Comment = '%';
                    MultiLine = true;
                }
                field(Certificate; Rec.Certificate)
                {
                    ToolTip = 'Specifies the value of the Certificate field.', Comment = '%';
                    MultiLine = true;
                }
                field("Webservice Url"; Rec."Webservice Url")
                {
                    ToolTip = 'Specifies the URL of the web service for e-Invoice.', Comment = '%';
                    MultiLine = true;
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
                    eInvoice: Record "e-Invoice Setup";
                begin
                    eInvoice.SetRange("Primary Key");
                    if eInvoice.FindFirst() then
                        exit;

                    Rec.Init();
                    Rec."Primary Key" := '';
                    Rec.Insert();
                end;
            }
        }
    }
}
