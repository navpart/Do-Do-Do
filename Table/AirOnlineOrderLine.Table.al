table 70023 "Air Online Order Line"
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
            OptionCaption = ',DEALERS,SERVICE DEPT.(TAKATA),SERVICE  DEPT.(SST),NLNG PHC,PLANTGERIA PHC,WHO ABUJA,WARRANTY,DOJO LEKKI,DOJO OREGUN';
            OptionMembers = ,DEALERS,"SERVICE DEPT.(TAKATA)","SERVICE  DEPT.(SST)","NLNG PHC","PLANTGERIA PHC","WHO ABUJA",WARRANTY,"DOJO LEKKI","DOJO OREGUN";
        }
        field(4; "Item No"; Code[20])
        {
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST ("Charge(Item)")) "Item Charge";

            trigger OnValidate()
            begin
                //IF Type = Type::Item THEN BEGIN
                //  "Item Name" :=Item.Description;
                //END;

                //IF Type = Type::"Charge(Item)" THEN BEGIN
                //  "Item Name" := ItemCharge.Description
                //END;


                CASE Type OF
                    Type::Item:
                        BEGIN
                            Item.GET("Item No");
                            "Item Name" := Item.Description;
                        END;

                    Type::"Charge(Item)":
                        BEGIN
                            ItemCharge.GET("Item No");
                            "Item Name" := ItemCharge.Description;
                        END;
                END;
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
                // "Amount (FCY)":=  * Quantity;
            end;
        }
        field(7; "Amount (FCY)"; Decimal)
        {

            trigger OnValidate()
            begin

                //"Amount (FCY)" := "Unit Cost" * Quantity;
            end;
        }
        field(8; "Deposit Amount (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin

                //Amount := "Unit Cost" * Quantity;
            end;
        }
        field(9; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document" WHERE (Status = FILTER (New | Released));

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IF "Item Name" = '' THEN
                    "Item Name" := COPYSTR(IncomingDocument.Description, 1, MAXSTRLEN("Item Name"));
            end;
        }
        field(10; Preferred; Boolean)
        {

            trigger OnValidate()
            begin
                ////TESTFIELD(Description);
                ////TESTFIELD("Supplier's Name");
                ////TESTFIELD("Supplier's Address");
                ////TESTFIELD("Profoma Invoice No");
                ////CALCFIELDS(Amount);
                ////TESTFIELD(Amount);
            end;
        }
        field(11; Authorisation; Text[50])
        {
        }
        field(12; "PIC of order approval"; Boolean)
        {
        }
        field(13; Type; Option)
        {
            OptionCaption = ' ,Charge(Item),Item';
            OptionMembers = " ","Charge(Item)",Item;
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
        ItemCharge: Record "Item Charge";

    
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

