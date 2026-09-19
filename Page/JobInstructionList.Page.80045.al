page 80045 "Job Instruction List"
{
    CardPageID = "Job Instruction Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                }
                field("Reception Date";Rec."Reception Date")
                {
                }
                field("Reception Time";Rec."Reception Time")
                {
                }
                field("Reception Type";Rec."Reception Type")
                {
                }
                field("Courtesy Vehicle";Rec."Courtesy Vehicle")
                {
                }
                field("Delivery Type";Rec."Delivery Type")
                {
                }
                field("Customer No.";Rec."Customer No.")
                {
                }
                field("Customer Name";Rec."Customer Name")
                {
                }
                field(Address;Rec.Address)
                {
                }
                field("Telephone No.";Rec."Telephone No.")
                {
                }
                field(Address2;Rec.Address2)
                {
                }
                field(Date;Rec.Date)
                {
                }
                field("Date Delivered";Rec."Date Delivered")
                {
                }
                field("Time Delivered";Rec."Time Delivered")
                {
                }
                field("QC Result";Rec."QC Result")
                {
                }
                field("QC Comment";Rec."QC Comment")
                {
                }
            }
        }
    }

    actions
    {
    }
}

