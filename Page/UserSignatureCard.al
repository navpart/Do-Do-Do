namespace AL_TNL.AL_TNL;

using System.Security.User;

page 50089 "User Signature Card"
{
    ApplicationArea = All;
    Caption = 'User Signature Card';
    PageType = Card;
    SourceTable = "User Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }
        }
        area(factboxes)
        {
            part(SignatureImage; "User Signature")
            {
                ApplicationArea = All;
                Caption = 'Signature';
                SubPageLink = "User ID" = field("User ID");
            }
        }
    }
}
