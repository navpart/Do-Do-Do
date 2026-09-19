tableextension 50013 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50000; Amount1; Decimal)
        {
            Description = 'LC';
        }
        field(50001; Amount2; Decimal)
        {
            Description = 'LC';
        }
        field(50002; "Item No."; Code[20])
        {

            trigger OnValidate()

            var
                Item: Record Item;

            begin
                IF "Item No." <> '' THEN BEGIN

                    Item.GET("Item No.");
                    Description := Item.Description;
                    "Net Weight" := Item."Net Weight";
                END ELSE
                    Description := '';

            end;
        }
        field(50003; "WHTax%"; Decimal)
        {
            Description = 'WHT';

            trigger OnValidate()
            begin
                WHTaxAmt := "WHTax%" * Quantity * "Direct Unit Cost" * 0.01;
            end;
        }
        field(50004; WHTaxAmt; Decimal)
        {
            Description = 'WHT';

            trigger OnValidate()

            begin
                //"WHTax%" := ROUND(WHTaxAmt / (Quantity * "Direct Unit Cost"), Currency."Amount Rounding Precision") * 100;
            end;
        }
        field(50005; "QtytoReceiveAmount(LCY)"; Decimal)
        {
            Description = 'LC';
        }
        field(50006; Colour; Code[30])
        {
            TableRelation = "Colour Codes"."Colour Code" WHERE("Product Group Code" = field("Color Group"));

            trigger OnValidate()

            var

            begin
                IF Colorrec.GET("Color Group", Colour) THEN
                    "Colour Description" := Colorrec.Description
                else
                    "Colour Description" := '';
            end;
        }
        field(50007; "Shelf/Bin"; Code[20])
        {
            Editable = false;
        }
        field(50008; ETA; Time)
        {
        }
        field(50009; "COF No."; Code[20])
        {

            trigger OnValidate()

            begin
                /*
                 IF COFRec.GET("COF No.") THEN BEGIN
                   "Vehicle Reg. No." := COFRec."Vehicle Registration No.";
                   "Model No." := COFRec."Model No";
                   "Reception Date" := COFRec."Reception Date";
                   "Promised Del Date" := COFRec."Expected Delivery Date";
                 END;
                 */
            end;
        }
        field(50010; "Method of Procurement"; Option)
        {
            OptionCaption = ' ,Air,Land,LPO,Sea';
            OptionMembers = " ",Air,Land,LPO,Sea;
        }
        field(50011; "Current Order Status"; Option)
        {
            OptionCaption = ' ,Supplied,Being Processed,Awaiting Supply,Awaiting Decision';
            OptionMembers = " ",Supplied,"Being Processed","Awaiting Supply","Awaiting Decision";
        }
        field(50012; "Vehicle Reg. No."; Code[20])
        {
            //TableRelation = "Service Item".No.;
        }
        field(50013; "Model No."; Code[20])
        {
        }
        field(50014; "Reception Date"; Date)
        {
        }
        field(50015; "Promised Del Date"; Date)
        {
        }
        field(50200; "Received Transit"; Decimal)
        {
        }
        field(50201; xBackOrderDate; Date)
        {
            Editable = false;
        }
        field(50203; "Prod.grp."; Code[10])
        {
        }
        field(50204; "Old Price"; Decimal)
        {
            AutoFormatType = 2;
        }
        field(50205; Remarks; Text[50])
        {
        }
        field(50210; "Duty Code"; Code[10])
        {
        }
        field(50211; "Chassis No."; Code[30])
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
        {
        }
        field(50304; "VRI CODE"; Code[10])
        {
        }
        field(50305; "Landing Cost"; Decimal)
        {
            Description = 'FOB + Factor';
        }
        field(50306; "Landing Cost (LCY)"; Decimal)
        {
        }
        field(50307; "Profit Margin"; Decimal)
        {
        }
        field(50308; "Total Retail Price Excl. VAT"; Decimal)
        {
        }
        field(50309; "VAT on Retail Price"; Decimal)
        {
        }
        field(50310; "Total Retail Price Inclu. VAT"; Decimal)
        {
        }
        field(60001; Comment; Text[80])
        {
            Editable = false;
        }
        field(60002; BackOrderDate; Date)
        {
        }
        field(60003; "Total Line Cost (LCY)"; Decimal)
        {
            Editable = false;
        }
        field(60004; "Sales Factor"; Decimal)
        {
        }
        field(60005; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;

            trigger OnValidate()

            begin
                PurchHeader.GET("Document Type", "Document No.");
                "Order Type" := PurchHeader."Order Type";
            end;
        }
        field(60006; "Colour Description"; Text[50])
        {
        }
        field(60007; "Color Group"; Code[20])
        {
            TableRelation = "Product Grp".Code WHERE("Item Category Code" = CONST('CARS'));
        }
        field(60008; "Item Length"; Decimal)
        {
        }
        field(60009; "Item Width"; Decimal)
        {
        }
        field(60010; "Item Height"; Decimal)
        {
        }
        field(60011; "Cubic Capacity"; Decimal)
        {
        }
        field(60012; "JPM Unit Price"; Decimal)
        {
        }
        field(60013; "JPM Value"; Decimal)
        {
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            //TableRelation = Customer.No.;
        }
        field(60101; "Model Name"; Text[30])
        {
        }
        field(60102; "Factor (Air)"; Decimal)
        {
        }
        field(60103; "Inventory Posting"; Code[10])
        {
        }
        field(60104; "Interior Colour Code"; Code[30])
        {
            TableRelation = "Interior Colour Codes"."Interior Colour Code" WHERE("Product Group Code" = field("Color Group"));

            trigger OnValidate()

            var

            begin
                IF InteriorColourRec.GET("Color Group", "Interior Colour Code") THEN
                    "Interior Colour Name" := InteriorColourRec."Interior Colour Name"
                ELSE
                    "Interior Colour Name" := '';
            end;
        }
        field(60105; "Interior Colour Name"; Text[50])
        {
            editable = false;

        }
    }

    var
        Item: Record Item;
        Colorrec: Record 50067;
        InteriorColourRec: Record 50188;
        COFRec: Record 50119;
        PurchComment: Record 43;
        PurchHeader: Record "Purchase Header";
}
