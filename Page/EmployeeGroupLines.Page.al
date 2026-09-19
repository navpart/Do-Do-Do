page 50016 "Employee Group Lines."
{
    PageType = ListPart;
    SourceTable = "Payroll-Employee Group Lines.";
    SourceTableView = WHERE(Hide = Filter(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Name"; Rec."Employee Name")
                {
                    Visible = false;
                }
                field("Employee Group"; Rec."Employee Group")
                {
                    Visible = false;
                }
                field("E/D Code"; Rec."E/D Code")
                {
                    Lookup = true;
                    LookupPageID = "E/D Survey.";
                }
                field("Payslip Text"; Rec."Payslip Text")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("Default Amount"; Rec."Default Amount")
                {
                    DecimalPlaces = 0 :;
                    NotBlank = true;
                    //Numeric = false;
                }
                field("Yearly Allowance"; Rec."Yearly Allowance")
                {
                }
                field(Units; Rec.Units)
                {
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Flag; Rec.Flag)
                {
                }
                field("Old Default Amount"; Rec."Old Default Amount")
                {
                }
                field("Date Changed"; Rec."Date Changed")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Calculate)
            {
                Caption = 'Calculate';
                Image = Recalculate;

                trigger OnAction()
                begin
                    Rec.VALIDATE("E/D Code");
                end;
            }
        }
    }

    var
        EDRec: Record 50001;


    procedure GetEDName(): Text[30]
    begin
        // This code was disabled by Adams
        // A more efficient LOOKUP field is used instead
        /*
           IF EDRec.GET("E/D Code") THEN
              EXIT(EDRec."Payslip Text");
        */
        //

    end;
}

