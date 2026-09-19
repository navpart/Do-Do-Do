tableextension 50094 "Sales Cr.Memo Header Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50001; Quantity; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Value Entry"."Invoiced Quantity" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Line Item Count"; Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Line" WHERE("Document No." = FIELD("No."),
                                                            Type = CONST(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Order Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Sea,Air,Land;
        }
        field(50012; "xDeliv.No."; Code[20])
        {
            TableRelation = Customer;
        }
        field(50040; "xCust./Prod.Disc.Gr."; Integer)
        {
            BlankZero = true;
        }
        field(50042; "xVAT Liable?"; Boolean)
        {
            BlankZero = true;
        }
        field(50154; "Address 3"; Text[30])
        {
        }
        field(50155; "P.O.Box"; Text[30])
        {
        }
        field(50156; "Del.Add. 3"; Text[30])
        {
        }
        field(50157; "Del.P.O.Box"; Text[30])
        {
        }
        field(50163; "Send for Approval"; Boolean)
        {
        }
        field(50164; Sender; Code[30])
        {
        }
        field(50165; "Send to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50166; Approved; Boolean)
        {
        }
        field(50167; "Sent Time"; DateTime)
        {
        }
        field(50168; "Approved Time"; DateTime)
        {
        }
        field(50169; "Mail Body"; Text[250])
        {
        }
        field(50170; "Approved By"; Code[30])
        {
        }
        field(50171; "User Department"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'User Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50173; "1st Approval to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50174; "1st Approver"; Text[50])
        {
        }
        field(50175; "1st Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;
        }
        field(50176; "1st Approval Time"; DateTime)
        {
        }
        field(50177; "1st Approver's Comment"; Boolean)
        {
            /*  CalcFormula = Exist("Comment Line" WHERE("Table Name" = CONST(36),
                                                       "No." = FIELD("No.")));
             Editable = false;
             FieldClass = FlowField; */
        }
        field(50178; "2nd Approval to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50179; "2nd Approver"; Text[50])
        {
        }
        field(50180; "2nd Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;
        }
        field(50181; "2nd Approval Time"; DateTime)
        {
        }
        field(50182; "2nd Approver's Comment"; Boolean)
        {
        }
        field(50188; "Final Approval to"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50189; "Final Approver's Name"; Text[50])
        {
        }
        field(50190; "Final Apprv. Status"; Option)
        {
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;
        }
        field(50191; "Final Approval Time"; DateTime)
        {
        }
        field(50192; "Final Approver's Comment"; Boolean)
        {
        }
        field(50200; "Cost Value"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Posted to G/L" WHERE("Item Ledger Entry Type" = CONST(Sale),
                                                                        "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50201; "Shortcut Dimension 1 filter"; Code[20])
        {
            CaptionClass = '1,2,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50202; "Shortcut Dimension 2 filter"; Code[20])
        {
            CaptionClass = '1,2,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50203; "Shortcut Dimension 1 Count"; Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Line" WHERE("Shortcut Dimension 1 Code" = FIELD("Shortcut Dimension 1 filter")));
            CaptionClass = '1,2,1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50204; "Lines Shortcut Dimension 1"; Code[20])
        {
            CalcFormula = Lookup("Sales Cr.Memo Line"."Shortcut Dimension 1 Code" WHERE("Document No." = FIELD("No."),
                                                                                         "Shortcut Dimension 1 Code" = FILTER(<> '')));
            CaptionClass = '1,2,1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50259; "Tracker No."; Code[10])
        {
        }
        field(50262; "Sales Time"; Time)
        {
        }
        field(50263; Posting_Time; DateTime)
        {
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
    }
}
