table 70019 "LPP Line"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
        }
        field(2; "Document No."; Code[10])
        {
        }
        field(3; "Order Type"; Option)
        {
            OptionCaption = ',Warranty,Stock Order,Dealer Emergency order,Dojo Store Order,SPV Order,Isolo Store';
            OptionMembers = ,Warranty,"Stock Order","Dealer Emergency order","Dojo Store Order","SPV Order","Isolo Store";
        }
        field(4; "Item No"; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate()
            begin
                //IF PAGE.RUNMODAL(0,Item) = ACTION::LookupOK THEN BEGIN

                IF Item.GET("Item No") THEN
                    //  "Item No":= Item."No.";
                    "Item Name" := Item.Description
                ELSE
                    "Item Name" := '';
            end;
        }
        field(5; "Item Name"; Text[70])
        {
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                Amount := "Unit Cost" * Quantity;
            end;
        }
        field(7; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin

                Amount := "Unit Cost" * Quantity;
            end;
        }
        field(8; Amount; Decimal)
        {

            trigger OnValidate()
            begin

                Amount := "Unit Cost" * Quantity;
            end;
        }
        field(9; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document" WHERE(Status = FILTER(New | Released));

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IF Description = '' THEN
                    Description := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN(Description));
            end;
        }
        field(10; Preferred; Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD(Description);
                //TESTFIELD("Supplier's Name");
                //TESTFIELD("Supplier's Address");
                //TESTFIELD("Profoma Invoice No");
                //CALCFIELDS(Amount);
                //TESTFIELD(Amount);
            end;
        }
        field(11; Authorisation; Text[50])
        {
        }
        field(12; "Total Line Item"; Integer)
        {
        }
        field(13; "Total Unit"; Decimal)
        {
        }
        field(14; "Total Amount"; Decimal)
        {
        }
        field(15; Description; Text[30])
        {
        }
        field(16; "Quantity Available"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("Item No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50000; "Document Link"; Text[250])
        {
            Caption = 'Document Link';
            DataClassification = ToBeClassified;
            //ExtendedDatatype = URL;
        }


    }

    keys
    {
        key(Key1; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
        IncomingDoc: Record "Incoming Document";


    procedure GetIncomingDocumentURL(): Text[1000]
    var
        IncomingDocument: Record "Incoming Document";
    begin
        IF "Incoming Document Entry No." = 0 THEN
            EXIT('');

        IncomingDocument.GET("Incoming Document Entry No.");
        EXIT(IncomingDocument.GetURL);
    end;
}

