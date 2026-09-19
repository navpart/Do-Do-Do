page 70076 "Completed Job Instruction List"
{
    CardPageID = "Completed Job Instruction Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Customer Order Table.";
    SourceTableView = WHERE(Delivered = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Actual Hours Clocked"; Rec."Actual Hours Clocked")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Parts Ordered Staff Name"; Rec."Parts Ordered Staff Name")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Model No"; Rec."Model No")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field("Job Start Date"; Rec."Job Start Date")
                {
                }
                field("Date Delivered"; Rec."Date Delivered")
                {
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                }
                field(Estimation; Rec.Estimation)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field("(Engine No)"; Rec."(Engine No)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

