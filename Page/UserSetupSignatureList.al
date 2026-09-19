namespace AL_TNL.AL_TNL;

using System.Security.User;

page 50081 "User Setup Signature List"
{
    ApplicationArea = All;
    Caption = 'User Setup Signature List';
    PageType = List;
    SourceTable = "User Setup";
    UsageCategory = Lists;
    CardPageId = "User Signature Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                }
                /* field(Signature; Rec.Signature)
                {
                    ToolTip = 'Specifies the picture that has been set up for the company, such as a company logo.';
                } */
            }
        }
    }
}
