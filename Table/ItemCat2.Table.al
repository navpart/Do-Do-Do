table 50157 "Item Cat.2"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Department Code"; Code[20])
        {
            CaptionClass = '1,1,1';
        }
        field(4; "Base Unit of Measure"; Code[20])
        {
        }
        field(5; "Product Grp Code"; Code[20])
        {
        }
        field(6; "Inventory Posting Group"; Code[20])
        {
        }
        field(7; "Part Division"; Code[20])
        {
        }
        field(8; "Branch Code"; Code[20])
        {
        }
        field(9; "Item Category Code"; Code[20])
        {
        }
        field(10; "Item Price Group"; Code[20])
        {
        }
        field(11; "Costing Method"; Option)
        {
            OptionCaption = 'FIFO,LIFO,Specific,Average,Standard';
            OptionMembers = FIFO,LIFO,Specific,"Average",Standard;
        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(14; "Price/Profit Calculation"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Profit=Price-Cost,Price=Cost+Profit,No Relationship';
            OptionMembers = "Profit=Price-Cost","Price=Cost+Profit","No Relationship";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

