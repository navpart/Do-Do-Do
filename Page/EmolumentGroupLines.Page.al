page 50151 "Emolument Group Lines."
{
    PageType = ListPart;
    SourceTable = "Payroll-Emolument Lines";
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
                field("Emolument Group"; Rec."Emolument Group")
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
                field("Payslip Group ID"; Rec."Payslip Group ID")
                {
                }
            }
        }
    }

    actions
    {
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

    end;
}

