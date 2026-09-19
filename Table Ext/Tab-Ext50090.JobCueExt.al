tableextension 50090 "Job Cue Ext" extends "Job Cue"
{
    fields
    {
        field(50018; "Open - Job Card"; Integer)
        {
            Caption = 'Open - Jobs Card';
            Editable = false;
        }
        field(50019; "Completed - Job Card"; Integer)
        {
            CalcFormula = Count(Job WHERE(Status = CONST(Completed)));
            FieldClass = FlowField;
        }
        field(50020; "Items Under Waarranty"; Integer)
        {
            /* CalcFormula = Count("Warranty Claim Header" WHERE("Under Warranty" = CONST(true)));
            Caption = 'Items Under Waarranty';
            FieldClass = FlowField; */
        }
        field(50021; "Expired Warranty"; Integer)
        {
            /* CalcFormula = Count("Warranty Claim Header" WHERE("Warranty Expired" = CONST(true)));
            Caption = 'Expired Warranty';
            FieldClass = FlowField; */
        }
        field(50022; "Existing Warranty Claims"; Integer)
        {
            /* Caption = 'Existing Warranty Claims';
            TableRelation = "Warranty Claim Header"."Warranty Claim Exist"; */
        }
        field(50023; "Open Warranty"; Integer)
        {
            CalcFormula = Count("Warranty Ledger Entry" WHERE(Open = CONST(true)));
            Caption = 'Open Warranty';
            FieldClass = FlowField;
        }
        field(50024; "Approved Material Claims"; Integer)
        {
            AccessByPermission = TableData 110 = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      Status = FILTER(Released | "Pending Prepayment")));
            Caption = 'Approved Sales Orders';
            FieldClass = FlowField;
        }
        field(50025; "Approved Labour Claims"; Integer)
        {
            AccessByPermission = TableData 120 = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = CONST(Order),
                                                         Status = FILTER(Released | "Pending Prepayment")));
            Caption = 'Approved Purchase Orders';
            FieldClass = FlowField;
        }
        field(50026; "Closed warranty cliam"; Integer)
        {
            CalcFormula = Count(Vendor WHERE(Blocked = FILTER(Payment)));
            Caption = 'Vendors - Payment on Hold';
            FieldClass = FlowField;
        }
        field(50027; "Warranty Coupons"; Integer)
        {
            /* CalcFormula = Count("Warranty Coupon" WHERE("Document Type" = CONST(Coupon)));
            Caption = 'Warranty Coupons -open';
            FieldClass = FlowField; */
        }
        field(50028; "Expired Coupons"; Integer)
        {
        }
        field(50029; "Contact - All"; Integer)
        {
            TableRelation = Contact;
        }
    }
}
