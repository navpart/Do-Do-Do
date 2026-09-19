tableextension 50023 "Purch. Inv. Header Ext" extends "Purch. Inv. Header"
{
    fields
    {
        field(50001; Overhead; Decimal)
        {
            Description = 'LC';
        }
        field(50002; "Total Amount Item"; Decimal)
        {
            Description = 'LC';
        }
        field(50003; "Consignment No."; Code[20])
        {
            Caption = 'LC Number';
        }
        field(50009; "Total Charges Amount"; Decimal)
        {
            Description = 'BPR1.00,LC';
            Editable = false;
        }
        field(50010; "Vendor Freight"; Boolean)
        {
            Description = 'LC';
        }
        field(50011; "Total Amount account"; Decimal)
        {
            Description = 'LC';
        }
        field(50013; "WHT Amount"; Decimal)
        {
            Description = 'LC';
        }
        field(50014; "Total Amount Item to Receive"; Decimal)
        {
            Description = 'LC';
        }
        field(50015; "Moved to Store"; Boolean)
        {
            Description = 'LC';
        }
        field(50151; "Payment Moded"; Option)
        {
            OptionMembers = " ",CASH,CHEQUE,"L/C";
        }
        field(50156; Job; Code[10])
        {
        }
        field(50157; "Address 3"; Text[30])
        {
        }
        field(50158; "P.O.Box"; Text[30])
        {
        }
        field(50159; "Del.Add. 3"; Text[30])
        {
        }
        field(50160; "Del.P.O.Box"; Text[30])
        {
        }
        field(50161; "First User-ID"; Code[10])
        {
        }
        field(50162; "Last User-ID"; Code[10])
        {
        }
        field(50163; Modified; Date)
        {
        }
        field(50164; "TransitAcc.No."; Code[10])
        {
            TableRelation = "G/L Account";

        }
        field(50165; xStatus; Code[10])
        {

        }
        field(50170; "G/L Account Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Account";
        }
        field(50200; "Total Cost(LCY)"; Decimal)
        {

        }
        field(50201; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(50202; "External Document No."; Code[25])
        {

        }

        field(50206; "C.O.F. No"; Code[20])
        {

        }
        field(60000; "Total Item Qty"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Purch. Inv. Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                 Type = CONST(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
