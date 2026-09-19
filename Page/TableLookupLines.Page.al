page 50011 "Table Lookup Lines."
{
    PageType = Card;
    SourceTable = "Payroll-Lookup Lines.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Lower Amount"; Rec."Lower Amount")
                {
                }
                field("Lower Code"; Rec."Lower Code")
                {
                }
                field("Upper Amount"; Rec."Upper Amount")
                {
                }
                field("Upper Code"; Rec."Upper Code")
                {
                }
                field("Extract Amount"; Rec."Extract Amount")
                {
                }
                field("Tax Rate %"; Rec."Tax Rate %")
                {
                }
                field("Cum. Tax Payable"; Rec."Cum. Tax Payable")
                {
                }
                field("Annual Lower"; Rec."Annual Lower")
                {
                }
                field("Annual Upper"; Rec."Annual Upper")
                {
                }
            }
        }
    }

    actions
    {
    }
}

