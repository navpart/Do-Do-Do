tableextension 50020 "Item Journal Line Ext" extends "Item Journal Line"
{
    fields
    {
        field(50000; "Requisition No."; Code[20])
        {
        }
        field(50001; "Engr. Part No."; Code[20])
        {
        }
        field(50002; Remark; Text[50])
        {
        }
        field(50003; "Qty. On Request"; Decimal)
        {
            Editable = false;
        }
        field(50011; "Qty. Ordered"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                VALIDATE(Quantity, "Qty. Ordered");
            end;
        }
        field(50014; "Fixed Assets No."; Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(50017; "Computer Amount"; Decimal)
        {
        }
        field(50018; "Physical Amount"; Decimal)
        {
        }
        field(50020; "Cage/Bin Code"; Text[30])
        {
        }
        field(50021; "Consignment No."; Code[20])
        {
        }
        field(50088; "Article Group"; Code[20])
        {

            trigger OnValidate()
            begin
                TESTFIELD("Article Group", '<>''');
            end;
        }
        field(50151; Binlocation; Code[10])
        {
        }
        field(50152; "Prod. Group"; Code[20])
        {
            //TableRelation = "Reminder Calls";
        }
        field(50200; "Collected by"; Code[30])
        {
        }
        field(50201; "Issuing Department"; Code[20])
        {
            CaptionClass = '1,2,1';
            //TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50202; "Control No."; Code[6])
        {
        }
        field(50203; "Prod. Gr. Code"; Code[10])
        {
        }
        field(50204; "Serial No. TNL"; Code[20])
        {
        }
        field(50205; "Registration No."; Code[30])
        {
            Editable = false;
        }
        field(50206; "Chassis No."; Code[30])
        {
            Editable = false;
        }
        field(50207; "Exterior Colour Code"; Code[30])
        {
            Editable = false;
        }
        field(50208; "SKU Unit Cost"; Decimal)
        {
            //CalcFormula = Lookup("Stockkeeping Unit"."Unit Cost" WHERE (Item No.=FIELD(Item No.),
            // Variant Code=FIELD(Variant Code)));
            //Editable = false;
            //FieldClass = FlowField;
        }
        field(50209; "Qty. Demanded"; Decimal)
        {
        }
        field(50210; "Chassis Number"; Code[30])
        {
            Description = 'Created by sharafadeen to manage Warranty';
        }
        field(50211; Reference; Text[50])
        {
        }
        field(50212; "Engine No."; Code[20])
        {
        }
        field(50213; "Exterior Colour Name"; Code[30])
        {
        }
        field(50220; "Interior Colour Code"; Code[30])
        {
            Editable = false;
        }
        field(50221; "Interior Colour Name"; Text[50])
        {
            Editable = false;
        }
        field(50214; "Key No."; Text[20])
        {
        }
        field(50215; "Service Item Registered"; Boolean)
        {
        }
        field(50216; "Maintenance Code"; Code[20])
        {
        }
        field(50217; "Shelf No."; Code[20])
        {
            Caption = 'Shelf No.';
        }
        field(50218; "Item shelf"; Code[20])
        {
            CalcFormula = Lookup(Item."Shelf No." WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(50219; "Year of Production"; Code[10])
        {
        }
        field(60005; "Item Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(60006; "Duplicate Count"; Integer)
        {
            
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            //TableRelation = Customer.No.;
        }
        field(60108; "From Service"; Boolean)
        {
        }
        field(60109; "From Service Line No."; Integer)
        {
        }
    }
    var
        ItemRec: Record Item;

}

