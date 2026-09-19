tableextension 50093 "Sales Invoice Line Ext." extends "Sales Invoice Line"
{
    fields
    {
        field(50000; "Search Code"; Code[20])
        {
            TableRelation = "Parts Enquiry"."Search Code" WHERE("Document No." = FIELD("Document No."));
        }
        field(50001; "Quantity Demand"; Decimal)
        {
        }
        field(50002; "Search Line"; Integer)
        {
            TableRelation = "Parts Enquiry"."Entry No" WHERE("Search Code" = FIELD("Search Code"));
        }
        field(50003; "Created Demand"; Boolean)
        {
        }
        field(50006; Colour; Code[30])
        {
            Editable = true;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(50150; QtySold; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("No." = FIELD("No."),
                                                                   "Document No." = FIELD("Document No."),
                                                                   "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(50151; "Qty. Demanded"; Decimal)
        {
        }
        field(50152; "Fully Invoiced"; Boolean)
        {
            CalcFormula = Exist("Sales Invoice Line" WHERE("Document No." = FIELD("Document No."),
                                                            "Line No." = FIELD("Line No."),
                                                            Type = CONST(Item),
                                                            "No." = FIELD("No."),
                                                            "Quantity Demanded" = FILTER(<> 0),
                                                            Quantity = FIELD("Quantity Demanded")));
            FieldClass = FlowField;
        }
        field(50208; "Chassis Number"; Code[30])
        {
            Editable = false;
        }
        field(50209; "Quantity Demanded"; Decimal)
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
        {
        }
        field(50304; "Order Type"; Option)
        {
            CalcFormula = Lookup("Parts Enquiry"."Order Type" WHERE("Part No" = FIELD("No.")));
            FieldClass = FlowField;
            OptionCaption = ' ,Created Demand,Stock Replenishment,VOR';
            OptionMembers = " ","Created Demand","Stock Replenishment",VOR;
        }
        field(60102; "Part Group"; Code[10])
        {
        }
        field(60103; "Job Type"; Option)
        {
            OptionCaption = ' ,B&P,GR';
            OptionMembers = " ","B&P",GR;
        }
        field(60104; Accessory; Boolean)
        {
        }
        field(60105; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Sell-to Customer No.")));
            FieldClass = FlowField;
        }
        field(60106; "Prod. Grp. Code"; Code[20])
        {
            CalcFormula = Lookup(Item."Item No Category" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60107; "Prod. Code"; Code[10])
        {
            CalcFormula = Lookup(Item."Prod. Code" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60108; "Inventoy Posting Group"; Code[20])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60114; "Tracker No."; Code[50])
        {
            DataClassification = ToBeClassified;
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

    }
}
