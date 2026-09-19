tableextension 50084 "Service Invoice Line Ext" extends "Service Invoice Line"
{
    fields
    {
        field(50000; WSR; Code[10])
        {
        }
        field(50100; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Bill-to Customer No.")));
            FieldClass = FlowField;
        }
        field(50302; "Customer Order No."; Code[20])
        {
            CalcFormula = Lookup("Service Invoice Header"."Customer Order No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50303; "Registration No."; Code[20])
        {
            CalcFormula = Lookup("Service Invoice Header"."Registration No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50304; "Model No."; Code[20])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Model No." WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(50305; "Model Name"; Code[40])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Model Name" WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(50306; "Job Type"; Option)
        {
            Caption = 'Customer Request Type';
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,BP,BP Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate",BP,"BP Estimate",Painting;
        }
        field(50400; "Local Buys"; Boolean)
        {
            CalcFormula = Lookup(Item."Local Buys" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50401; "Invt. Post. Grp"; Code[20])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50402; VIN; Code[50])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Frame No./VIN" WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
        field(90001; "TIN"; Text[150])
        {
            Caption = 'TIN';
        }
        field(90002; "Email"; Text[150])
        {
            Caption = 'Email';
        }
        field(90003; "Postal Address"; Text[250])
        {
            Caption = 'Postal Address';
        }
        field(90004; "Street Name"; Text[100])
        {
            Caption = 'Street Name';
        }
        field(90005; "City Name"; Text[50])
        {
            Caption = 'City Name';
        }
        field(90006; "Postal Zone"; Text[50])
        {
            Caption = 'Postal Zone';
        }
        field(90007; "Tax Category"; Code[10])
        {
            Caption = 'Tax Category';
        }
       

    }

}