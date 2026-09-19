tableextension 50009 "Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50013; "Registration No."; Code[20])
        {
            Editable = false;
        }
        field(50014; "Chassis No."; Code[30])
        {
            Editable = false;
        }
        field(50016; "Exterior Colour Name"; Code[30])
        {
        }
        field(50151; Binlocation; Code[20])
        {
        }
        field(50201; "Issuing Department"; Code[10])
        {
        }
        field(50202; "Depart."; Code[10])
        {
        }
        field(50203; "Prod. Gr."; Code[10])
        {
        }
        field(50204; "Vouch GL"; Code[10])
        {
        }
        field(50205; "Old Value"; Decimal)
        {
        }
        field(50206; "xRemain Qty Val"; Decimal)
        {
            BlankZero = true;
        }
        field(50207; "Serial no. TNL"; Code[20])
        {
        }
        field(50208; "Invoice No."; Code[20])
        {
            Editable = false;
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(50209; "Qty. Demanded"; Decimal)
        {
        }
        field(50210; "Inventory Posting Group"; Code[20])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(50211; Reference; Text[50])
        {
        }
        field(50212; "Production Year"; Code[20])
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
            //CalcFormula = Lookup("Purch. Rcpt. Line"."Year of Production" WHERE("Document No." = FIELD("Document No.")));
            //FieldClass = FlowField;
        }
        field(60005; "Item Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(60006; "Gen. Bus. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(60101; "New Location Code"; Code[10])
        {
            TableRelation = Location;
        }
        field(60102; "Chasis Number"; Code[30])
        {
        }
        field(60103; "Engine No."; Code[20])
        {
        }
        field(60104; "Exterior Colour Code"; Code[30])
        {
        }
       
        field(60105; "Key No."; Text[30])
        {
        }
        field(60106; "Service Item Registered"; Boolean)
        {
        }
        field(60107; "On Transfer Line"; Boolean)
        {
        }
        field(60108; "From Service"; Boolean)
        {
        }
        field(60109; "From Service Line No."; Integer)
        {
        }
        field(60110; "Purchase Date"; Date)
        {
        }
        field(60111; Extract; Boolean)
        {
        }
        field(60112; UpdateProductGroup; Text[30])
        {
            // CalcFormula = Lookup(Item."Product Group Code" WHERE("No." = FIELD("Item No.")));
            // FieldClass = FlowField;
        }
        field(60113; "Pre-owned Color"; Text[30])
        {
            CalcFormula = Lookup(Item."Pre-Owned Colour" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60114; Pick; Boolean)
        {
        }
        field(60115; "Shelf No"; Code[20])
        {
            CalcFormula = Lookup(Item."Shelf No." WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60116; "Item Name"; Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60117; "Invoice No"; Code[20])
        {
            CalcFormula = Lookup("Value Entry"."Document No." WHERE("Item Ledger Entry No." = FIELD("Entry No.")));
            FieldClass = FlowField;
        }
        field(60118; "Invoice External"; Code[35])
        {
            //FieldClass = FlowField;
            //CalcFormula = Lookup("Value Entry"."External Document No." WHERE("Item Ledger Entry Type" = CONST(Purchase),
            //     Chassis = FIELD("Serial No.")));

        }
        field(60119; "TNL Selling Price to TCSC"; Decimal)
        {
            CalcFormula = Lookup(Item."TNL Selling Price to TCSC" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60120; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Source No.")));
            FieldClass = FlowField;
        }
        field(60121; "Vendor Name"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Source No.")));
            FieldClass = FlowField;
        }
        field(60122; "BNP Grouping"; Code[20])
        {
            CalcFormula = Lookup(Item."BNP Grouping" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60123; "Product Grp Code"; Code[20])
        {
            CalcFormula = Lookup(Item."Item No Category" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60124; "Problem Vehicle"; Boolean)
        {

        }
        field(60125; "Model No."; Code[50])
        {
            CalcFormula = Lookup(Item."Model No." WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60126; Grade; Code[10])
        {
            CalcFormula = Lookup(Item.Grade WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60127; Engine; Code[20])
        {
            CalcFormula = Lookup(Item.Engine WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
         field(60128; "Interior Colour Code"; Code[30])
        {
        }
        field(60129; "Interior Colour Name"; Text[50])
        {
        }


    }
    keys
    {
        key(ExtKey1; "Document Type", "Serial No.")
        {

        }
        key(ExtKey2; "Purchase Date")
        {

        }
    }
}
