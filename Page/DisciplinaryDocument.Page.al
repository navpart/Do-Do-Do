page 50310 "Disciplinary Document"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "Employee Disciplinary Document";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Issue date"; Rec."Issue date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Effective Date"; Rec."Effective Date")
                {
                }
                field("Suspension Duration"; Rec."Suspension Duration")
                {
                }
                field("Expected Resumption Date"; Rec."Expected Resumption Date")
                {
                }
                field("Warning/Query Response Time"; Rec."Warning/Query Response Time")
                {
                }
                field("Expected Response Date"; Rec."Expected Response Date")
                {
                }
                field("Response Date"; Rec."Response Date")
                {
                }
                field("Resumption Date"; Rec."Resumption Date")
                {
                }
                field(Remark; Rec.Remark)
                {
                }
            }
        }
    }

    actions
    {
    }
}

