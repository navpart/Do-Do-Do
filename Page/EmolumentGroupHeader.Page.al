page 50152 "Emolument Group Header"
{
    PageType = Card;
    SourceTable = "Payroll-Emolument Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Lookup = false;
                }
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                }
                field("Net Pay Due"; Rec."Net Pay Due")
                {
                }
                field("Employee Name"; Rec."Search Name")
                {
                    Caption = 'Employee Name';
                    Editable = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field(Grade; Rec.Grade)
                {
                }
                field(Step; Rec.Step)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
                }
            }
            part(Lines; "Emolument Group Lines.")
            {
                SubPageLink = "Emolument Group" = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Copy Lines from another group")
                {
                    Caption = 'Copy Lines from another group';
                    Ellipsis = false;
                    //RunObject = Report 50049;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Group Code" := DefaultPostingGroup;
    end;

    var
        PGrp: Record 50011;
        //gpc: Codeunit "50004";
        DefaultPostingGroup: Code[20];

    procedure GetPGrp(Grp: Code[10]): Text[30]
    begin
        IF PGrp.GET(Grp) THEN
            EXIT(PGrp.Description)
        ELSE
            EXIT('');
    end;
}

