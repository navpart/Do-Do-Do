tableextension 50068 "Transfer Shipment Header Ext" extends "Transfer Shipment Header"
{
    fields
    {
        field(50000; "Reference No."; Code[20])
        {
            Editable = false;
        }
        field(50001; "Variant Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code;

            trigger OnValidate()
            var
                ItemVariant: Record "Item Variant";
            begin
            end;
        }
        field(50002; "Total Quantity To Ship"; Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Qty. to Ship" WHERE("Document No." = FIELD("No."),
                                                                    "Item No." = FIELD("Item Filter"),
                                                                    "Transfer-from Code" = FIELD("Transfer-from Code"),
                                                                    "Variant Code" = FIELD("Variant Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Item Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item;

            trigger OnValidate()
            var
                TempTransferLine: Record "Transfer Line" temporary;
            begin
            end;
        }
        field(50004; "Total Quantity To Receive"; Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Qty. to Receive" WHERE("Document No." = FIELD("No."),
                                                                       "Item No." = FIELD("Item Filter"),
                                                                       "Transfer-to Code" = FIELD("Transfer-to Code"),
                                                                       "Variant Code" = FIELD("Variant Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "GIT Receipt No."; Code[20])
        {
            TableRelation = "Purch. Rcpt. Header"."No.";
        }
        field(50006; "Consignment No."; Code[20])
        {
        }
        field(50007; Reason; Text[200])
        {
        }
        field(50008; Duration; DateFormula)
        {
        }
        field(50009; "Dealer No."; Code[10])
        {
        }
        field(50010; "Dealer Name"; Text[30])
        {
        }
        field(50011; "Vehicle No."; Code[10])
        {
        }
        field(50012; "Branch Manager's Name"; Text[50])
        {
            Editable = false;
        }
        field(50013; "Shipment Approval"; Boolean)
        {
            Editable = false;
        }
        field(50014; "Approved By"; Text[50])
        {
            Editable = false;
        }
        field(50015; "Branch Confirmation"; Boolean)
        {
            Editable = false;
        }
        field(50016; "User ID"; Code[50])
        {
            CalcFormula = Lookup("G/L Entry"."User ID" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "COF No."; Code[20])
        {
        }
    }
}
