page 50025 "Loan List"
{
    CardPageID = "Loan Card.";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Loan.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan ID";Rec."Loan ID")
                {
                }
                field("Staff No.";Rec."Staff No.")
                {
                }
                field("Staff Name";Rec."Staff Name")
                {
                }
                field("Remaining Amount";Rec."Remaining Amount")
                {
                }
                field("Loan Type";Rec."Loan Type")
                {
                }
                field("Loan Created";Rec."Loan Created")
                {
                }
                field("Start Period";Rec."Start Period")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Loan")
            {
                Caption = '&Loan';
                action("&Card")
                {
                    Caption = '&Card';
                    Image = EditLines;
                    RunObject = Page "Loan Card.";
                    RunPageLink = "Loan ID"=FIELD("Loan ID");
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    var
        gpc: Codeunit 50004;
        DefaultPostingGroup: Code[20];
}

