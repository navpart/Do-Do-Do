table 50056 "Vehicle Delivery Monitor"
{

    fields
    {
        field(1; "Invoice No"; Code[20])
        {
        }
        field(2; "Customer Code"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Gen. Bus. Posting Group" = FILTER('LOCAL'));
        }
        field(3; "Customer Name"; Code[30])
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Item No."; Code[20])
        {
        }
        field(6; Description; Text[50])
        {
        }
        field(7; "Serial No."; Code[20])
        {
            Editable = false;
        }
        field(8; "Engine No."; Code[20])
        {
        }
        field(9; "Exterior Colour Name"; Text[30])
        {
        }
        field(10; "Exterior Colour Code"; Text[30])
        {
        }
        field(11; "Key No."; Text[10])
        {
        }
        field(12; Delivered; Boolean)
        {

            trigger OnValidate()
            begin
                IF Delivered THEN
                    "Delivery Date" := TODAY ELSE
                    "Delivery Date" := 0D;
            end;
        }
        field(13; "Delivery Date"; Date)
        {
            Editable = false;
        }
        field(14; "Transaction Type"; Option)
        {
            OptionCaption = 'Pending,Delivered';
            OptionMembers = Pending,Delivered;
        }
        field(15; "Customer Code  Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Customer;
        }
        field(16; "Entry No."; Integer)
        {
            TableRelation = "Item Ledger Entry"."Entry No." WHERE("Posting Date" = FIELD("Posting Date Filter"),
                                                                   "Source No." = FIELD("Customer Code  Filter"));
        }
        field(17; "Line No."; Integer)
        {
        }
        field(18; "Posting Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(19; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(20; Open; Boolean)
        {
            CalcFormula = Exist("Item Ledger Entry" WHERE("Item No." = FIELD("Item No."),
                                                           "Serial No." = FIELD("Serial No."),
                                                           Open = filter(false)));
            FieldClass = FlowField;
        }
        field(21; Overdue; Boolean)
        {
        }
        field(22; "Inventory Group"; Text[30])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Serial No.")
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
        key(Key3; "Posting Date")
        {
        }
        key(Key4; Delivered, "Posting Date")
        {
        }
        key(Key5; Delivered)
        {
        }
    }

    fieldgroups
    {
    }
}

