tableextension 50024 "Purch. Inv. Line" extends "Purch. Inv. Line"
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

        }
        field(50003; "WHTax%"; Decimal)
        {
            Description = 'WHT';
        }
        field(50004; WHTaxAmt; Decimal)
        {
            Description = 'WHT Amount';
        }
        field(50005; "QtytoReceiveAmount(LCY)"; Decimal)
        {
            Description = 'LC';
        }
        field(50006; Colour; Code[30])
        {

        }
        field(50008; ETA; Time)
        {
        }
        field(50009; "COF No."; Code[20])
        {
        }
        field(50010; "Method of Procurement"; Option)
        {
            OptionCaption = ' ,Air,Land,LPO,Sea';
            OptionMembers = " ",Air,Land,LPO,Sea;
        }
        field(50011; "Current Stock Status"; Option)
        {
            OptionCaption = ' ,Supplied,Being Processed,Awaiting Supply,No ETA,Awaiting Decision';
            OptionMembers = " ",Supplied,"Being Processed","Awaiting Supply","No ETA","Awaiting Decision";
        }
        field(50012; "Vehicle Reg. No."; Code[20])
        {
            TableRelation = "Service Item"."No.";
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
        field(50210; "Duty Code"; Code[10])
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
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
        field(60003; "Total Line Cost (LCY)"; Decimal)
        {
            Editable = false;
        }
        field(60005; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(60006; "Colour Description"; Text[50])
        {
        }
        field(60007; "Color Group"; Code[20])
        {

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
        field(60015; "Vendor Name"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Buy-from Vendor No.")));
            FieldClass = FlowField;
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(60104; "Interior Colour Code"; Code[30])
        {
            
        }
        field(60105; "Interior Colour Name"; Text[50])
        {
          

        }
    }
}
