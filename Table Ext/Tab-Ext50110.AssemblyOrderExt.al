tableextension 50110 AssemblyHeaderExt extends "Assembly Header"
{
    fields
    {

        field(50100; "Workflow Stage"; Option)
        {
            //ApplicationArea = All;
            //Caption = 'Workflow Stage';
            OptionCaption = 'Marketing,Logistics,Warehouse,"Service VRI",PARTS,"Service SA",Completed';
            optionMembers = Marketing,Logistics,Warehouse,"Service VRI",PARTS,"Service SA",Completed;

        }


        field(50103; "Marketing Comment"; Text[250])
        {
        }

        field(50104; "Logistics Comment"; Text[250])
        {
        }

        field(50105; "Service Comment"; Text[250])
        {
        }

        field(50106; "Parts Comment"; Text[250])
        {
        }
        field(50107; "Total Cost Amount"; Decimal)
        {
            CalcFormula = sum("Assembly Line"."Cost Amount" where("Document No." = field("No.")));
            FieldClass = FlowField;
            Editable = false;

        }
        field(50108; "Calculated Unit Cost"; Decimal)
        {
            caption = 'Calculated Unit Cost';
            DecimalPlaces = 0 : 5;
            Editable = false;

        }

        field(50110; "Marketing Ass. Orders"; integer)
        {

            CalcFormula = Count("Assembly Header" where("Document Type" = filter(order), "Workflow Stage" = const(marketing)));
            FieldClass = FlowField;
        }
        field(50111; "OLD Ass. Orders"; Integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = const(logistics)));
            FieldClass = FlowField;
        }
        field(50112; "VRI Serv Ass. Orders"; integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = const(warehouse)));
            FieldClass = FlowField;
        }
        field(50113; "PARTS Ass. Orders"; Integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = filter("service vri")));
            FieldClass = FlowField;
        }
        field(50114; "SA Service Ass. Orders"; integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = filter(parts)));
            FieldClass = FlowField;
        }
        field(50115; "Completed Ass. Orders"; Integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = filter(completed)));
            FieldClass = FlowField;
        }
        field(50116; "Unit Price"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;

        }
        field(50117; "Total Sales Amount"; Decimal)
        {
            CalcFormula = sum("Assembly Line"."Sales Amount" where("Document No." = field("No.")));
            FieldClass = FlowField;
            Editable = false;

        }

        field(50118; "Percentage Markup"; decimal)
        {
            Caption = 'Percentage Markup';
            // Example: 10 means 10%



        }
        field(50119; "Estimated Cost"; Decimal)
        {
            Caption = 'Estimated Cost';
            Editable = false;
        }
        field(50121; warehouse; Integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = filter(order), "Workflow Stage" = const(Warehouse)));
            FieldClass = FlowField;
        }

    }

    keys
    {
        key(Workflow_Stage; "Workflow Stage")
        {
        }
    }
    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(USERID);
    end;



}